# search-spider
The home for the spider that supports search.gov.

#### Table of contents:
* [About](#about)
  * [Core Scrapy File Strcture](#core-scrapy-file-structure)
  * [Scrapy Web Crawler](#scrapy-web-crawler)
* [Quick Start](#quick-start)
  * [Running Against All Listed Search.gov Domains](#running-against-all-listed-searchgov-domains)
  * [Running Against A Specific Domain](#running-against-a-specific-domain)
* [Setup and Use](#setup-and-use)
  * [Option 1: command-line](#option-1-straight-from-command-line)
  * [Option 2: benchmark](#option-2-benchmark-command-line)
  * [Option 3: custom scheduler](#option-3-custom-scheduler)
  * [Option 4: scrapyd](#option-2-deploying-on-server-scrapyd)
* [Adding New Spiders](#adding-new-spiders)
* [Running Scrapydweb UI](#running-scrapydweb-ui)

## About
The spider uses the open source [scrapy](https://scrapy.org/) framework.

The spiders can be found at `search_gov_crawler/search_gov_spiders/spiders/`.

### Core Scrapy File Structure
*Note: Other files and directories are within the repository but the folders and files below relate to those needed for the scrapy framework.

```bash
├── search_gov_crawler ( scrapy root )
│   ├── search_gov_spider ( scrapy project *Note multiple projects can exist within a project root )
│   │   ├── extensions ( includes custom scrapy extensions )
│   │   ├── helpers ( includes common functions )
│   │   ├── spiders
│   │   │   ├── domain_spider.py ( spider for html pages )
│   │   │   ├── domain_spider_js.py  ( spider for js pages )
│   │   ├── utility_files ( includes json files with default domains to scrape )
│   │   ├── items.py
│   │   ├── middlewares.py
│   │   ├── pipelines.py
│   │   ├── settings.py
│   ├── scrapy.cfg
```

### Scrapy Web Crawler
The spider can either scrape for URLs from the list of required domains or take in a domain and starting URL to scrape a site/domain.

Running the spider produces a list of urls found in `search_gov_crawler/search_gov_spiders/spiders/scrapy_urls/{spider_name}/{spider_name}_{date}-{UTC_time}.txt` as specified by `FEEDS` in `settings.py`.

## Quick Start
**We support the use of .env file in the root directory, eg:**
```bash
SPIDER_ES_INDEX_NAME="i14y-documents-spider"
SPIDER_ES_INDEX_ALIAS="i14y-documents"
ES_HOSTS="http://localhost:9200"
ES_USER="username"
ES_PASSWORD="password"
SPIDER_URLS_API="https://fake-api.com/urls"
```

**Insall and activate virtual environment:**
```bash
python -m venv venv
. venv/bin/activate
```

**Install required python modules:**
```bash
# make sure the virtual environment is activate
pip install -r ./search_gov_crawler/requirements.txt
playwright install --with-deps
playwright install chrome --force
```

**Install required nltk modules:**
```bash
# make sure the virtual environment is activate
python ./search_gov_crawler/elasticsearch/install_nltk.py
```

### Running Against All Listed Search.gov Domains
Navigate down to `search_gov_crawler/search_gov_spiders`, then enter the command below:
```commandline
scrapy crawl domain_spider
```
to run for all urls / domains that do not require javacript handling.  To run for all sites that require
javascript run:
```commandline
scrapy crawl domain_spider_js
```
^^^ These will take a _long_ time

### Running Against A Specific Domain
In the same directory specified above, enter the command below, adding the domain and starting URL for the crawler:
```commandline
scrapy crawl domain_spider -a allowed_domains=example.com -a start_urls=www.example.com
```
or
```commandline
scrapy crawl domain_spider -a allowed_domains=example.com -a start_urls=www.example.com
```

## Setup and Use
Make sure to follow **Quick Start** steps above, before running any spiders.

### Option 1: straight from command-line
1. Navigate to the [*spiders*](search_gov_crawler/search_gov_spiders/spiders) directory
2. Enter one of two following commands:

    * This command will output the yielded URLs in the destination (relative to the [*spiders*](search_gov_crawler/search_gov_spiders/spiders) directory) and file format specified in the `search_gov_crawler/search_gov_spiders/pipelines.py`:

          $ scrapy runspider <spider_file.py>

    * This command will output the yielded URLs in the destination (relative to the [*spiders*](search_gov_crawler/search_gov_spiders/spiders) directory) and file format specified by the user:


          $ scrapy runspider <spider_file.py>  -o <filepath_to_output_folder/spider_output_filename.csv>

### Option 2: benchmark command line
The benchmark script is primarily intended for use in timing and testing scrapy runs.  There are two ways to run.  In either case its
likes you want to redirect your ouput to a log file using something like `<benchmark command> >scrapy.log 2>&1`
1. To run a single domain (specifying starting URL `-u` and allowed domain `-d`):

          $ python search_gov_spiders/benchmark.py -u https://www.example.com -d example.com

2. To run multiple spiders simultaneously, provide a json file in the format of the [*crawl-sites-sample.json file*](search_gov_crawler/search_gov_spiders/utility_files/crawl-sites-sample.json) as an argument:

          $ python search_gov_spiders/benchmark.py -f </path/to/crawl-sites-like-file.json>

There are other options available.  Run `python search_gov_spiders/benchmark.py -h` for more info.

### Option 3: custom scheduler
1. See the [*Running Scrapy Scheduler*](#running-scrapy-scheduler) section below.

### Option 4: deploying on server (Scrapyd)
1. Navigate to the [*Scrapy project root directory*](search_gov_crawler) and start the server.

        $ scrapyd

    * Note: the directory where you start the server is arbitrary. It's simply where the logs and Scrapy project FEED destination (relative to the server directory) will be.

2. Run this command to eggify the Scrapy project and deploy it to the Scrapyd server:

        $ scrapyd-deploy default


    * Note: This will simply deploy it to a local Scrapyd server. To add custom deployment endpoints, you navigate to the [*scrapy.cfg*](search_gov_crawler/scrapy.cfg) file and add or customize endpoints.

        For instance, if you wanted local and production endpoints:

            [settings]
            default = search_gov_spiders.settings

            [deploy: local]
            url = http://localhost:6800/
            project = search_gov_spiders

            [deploy: production]
            url = <IP_ADDRESS>
            project = search_gov_spiders

        To deploy:

            # deploy locally
            scrapyd-deploy local

            # deploy production
            scrapyd-deploy production

3. For an interface to view jobs (pending, running, finished) and logs, access http://localhost:6800/. However, to actually manipulate the spiders deployed to the Scrapyd server, you'll need to use the [*Scrapyd JSON API*](https://scrapyd.readthedocs.io/en/latest/api.html).

    Some most-used commands:

    * Schedule a job:

            $ curl http://localhost:6800/schedule.json -d project=search_gov_spiders -d spider=<spider_name>
    * Check load status of a service:

            $ curl http://localhost:6800/daemonstatus.json

## Adding new spiders

1.  Navigate to anywhere within the [*Scrapy project root*](search_gov_crawler) directory and run this command:

        $ scrapy genspider -t crawl <spider_name> "<spider_starting_domain>"

2. Open the `/search_gov_spiders/search_gov_spiders/spiders/boilerplate.py` file and replace the lines of the generated spider with the lines of the boilerplate spider as dictated in the boilerplate file.

3. Modify the `rules` in the new spider as needed. Here's the [*Scrapy rules documentation*](https://docs.scrapy.org/en/latest/topics/spiders.html#crawling-rules) for the specifics.

4. To update the Scrapyd server with the new spider, run:

        $ scrapyd-deploy <default or endpoint_name>

        ## Running Against All Listed Search.gov Domains

## Running scrapy scheduler
This process allows for scrapy to be run directly using an in-memory scheduler.  The schedule is based on the initial schedule setup in the [*crawl-sites-sample.json file*](search_gov_crawler/search_gov_spiders/utility_files/crawl-sites-sample.json).  The process will run until killed.

The json input file must be in a format similar what is below.  There are validations in place when the file is read and in tests that should help
prevent this file from getting into an invalid state.

```json
[
    {
        "name": "Example",
        "allowed_domains": "example.com",
        "allow_query_string": false,
        "handle_javascript": false,
        "schedule": "30 08 * * MON",
        "starting_urls": "https://www.example.com"
    }
]
```

0. Source virtual environment and update dependencies.

1. Start scheduler

        $ python search_gov_crawler/scrapy_scheduler.py


## Running Scrapydweb UI

### Local Environment Setup

0. Source virtual environment, update dependencies, and change working directory to `search_gov_crawler`

1. Start scrapyd

        $ scrapyd

2. Build latest version of scrapy project (if any changes have been made since last run)

        $ scrapyd-deploy local -p search_gov_spiders

3. Start logparser

        $ python -m search_gov_logparser

4. Start scrapydweb

        $ python -m search_gov_scrapydweb
