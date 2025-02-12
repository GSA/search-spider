import os
import asyncio
import pytest
from unittest.mock import patch, MagicMock
from search_gov_crawler.elasticsearch.es_batch_upload import SearchGovElasticsearch

html_content = """
    <html lang="en">
    <head>
        <title>Test Article Title</title>
        <meta name="description" content="Test article description.">
        <meta name="keywords" content="test, article, keywords">
        <meta property="og:image" content="https://example.com/image.jpg">
        <meta name="lang" content="en">
    </head>
    <body>
        <h1>Test Article Title</h1>
        <p>This is the main content of the test article.</p>
    </body>
    </html>
"""

@pytest.fixture
def sample_spider():
    """Fixture for a mock spider with a logger."""

    class SpiderMock:
        logger = MagicMock()

    return SpiderMock()

# Mock environment variables
@pytest.fixture(autouse=True)
def mock_env_vars():
    with patch.dict(os.environ, {
        "ES_HOSTS": "http://localhost:9200",
        "SPIDER_ES_INDEX_NAME": "test_index",
        "SPIDER_ES_INDEX_ALIAS": "test_alias",
        "ES_USER": "test_user",
        "ES_PASSWORD": "test_password"
    }):
        yield

# Mock convert_html function
@pytest.fixture
def mock_convert_html():
    with patch("search_gov_crawler.elasticsearch.es_batch_upload.convert_html") as mock:
        yield mock

@pytest.fixture
def mock_asyncio_loop():
    with patch("search_gov_crawler.elasticsearch.es_batch_upload.asyncio.get_event_loop") as mock_get_loop:
        mock_loop = asyncio.new_event_loop()
        mock_get_loop.return_value = mock_loop

        with patch("search_gov_crawler.elasticsearch.es_batch_upload.asyncio.new_event_loop") as mock_new_loop:
            mock_new_loop.return_value = mock_loop
            yield mock_loop
            mock_loop.close()

# Test add_to_batch (Corrected)
@pytest.mark.asyncio(loop_scope="module")
async def test_add_to_batch(mock_convert_html, sample_spider):
    es_uploader = SearchGovElasticsearch(batch_size=2)
    mock_convert_html.return_value = {"_id": "1", "title": "Test Document"}

    es_uploader.add_to_batch(html_content, "http://example.com/1", sample_spider)
    assert len(es_uploader._current_batch) == 1

    es_uploader.add_to_batch(html_content, "http://example.com/2", sample_spider)
    assert len(es_uploader._current_batch) == 0

@pytest.mark.asyncio(loop_scope="module")
async def test_batch_upload(mock_convert_html, sample_spider):  # Use pytest-asyncio's event loop
    es_uploader = SearchGovElasticsearch(batch_size=2)
    mock_convert_html.return_value = {"_id": "1", "title": "Test Document"}
    es_uploader._current_batch = [{"_id": "1", "title": "Test Document"}, {"_id": "2", "title": "Test Document"}]

    es_uploader.batch_upload(sample_spider)
    assert len(es_uploader._current_batch) == 0

@pytest.mark.asyncio(loop_scope="module")
async def test_batch_upload_empty(sample_spider):
    es_uploader = SearchGovElasticsearch(batch_size=2)
    es_uploader._current_batch = []
    es_uploader._batch_elasticsearch_upload = MagicMock()
    es_uploader.batch_upload(sample_spider)
    es_uploader._batch_elasticsearch_upload.assert_not_called()  # Ensure it is not called when the batch is empty

# Test _batch_elasticsearch_upload
@pytest.mark.asyncio(loop_scope="module")
async def test_batch_elasticsearch_upload(mock_convert_html, mock_asyncio_loop, sample_spider):
    es_uploader = SearchGovElasticsearch(batch_size=2)
    docs = [{"_id": "1", "title": "Test Document"}]
    mock_convert_html.return_value = docs[0]
    es_uploader._create_actions = MagicMock()
    await es_uploader._batch_elasticsearch_upload(docs, mock_asyncio_loop, sample_spider)
    es_uploader._create_actions.assert_called_once()

def test_add_to_batch_no_doc(mock_convert_html, sample_spider):
    es_uploader = SearchGovElasticsearch(batch_size=2)
    mock_convert_html.return_value = None

    es_uploader.add_to_batch("<html></html>", "http://example.com/1", sample_spider)
    assert len(es_uploader._current_batch) == 0

def test_parse_es_urls_invalid_url():
    es_uploader = SearchGovElasticsearch()
    with pytest.raises(ValueError) as excinfo:
        es_uploader._parse_es_urls("invalid-url")
    assert "Invalid Elasticsearch URL" in str(excinfo.value)

def test_parse_es_urls_valid_urls():
    es_uploader = SearchGovElasticsearch()
    hosts = es_uploader._parse_es_urls("http://localhost:9200,https://remotehost:9300")
    assert hosts == [{"host": "localhost", "port": 9200, "scheme": "http"}, {"host": "remotehost", "port": 9300, "scheme": "https"}]
