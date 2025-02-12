## Scrutiny to JSON Import

Data from the Scrutiny export can be converted into a more usable format by running the included script:

    $ cd search_gov_crawler/search_gov_spiders/utility_files
    $ python import_plist.py --input_file ./scrutiny-2023-06-20.plist


## Job Schedule Calendar
To start I have spread jobs throughout the day.  I did not give any consideration to how long individual jobs run so this may need to be adjusted to allow for very long running jobs.  All times are UTC.  A maintenance window has been established each Wednesday between 1500 and 2100 so we can do releases without extra enabling/disabling of jobs.

:heavy_check_mark: - Scrape job scheduled
:x:  - Maintenance window, do not schedule (Wed 1530-

UTC | 	Mon	|	Tue	|	Wed	|	Thu	|	Fri	|
| :---: | :---: | :---: | :---: | :---: | :---: |
|0030	|		|		|		|		|		|
|0100	|		|		|		|		|		|
|0130	|		|		|		|		|		|
|0200	|		|		|		|		|		|
|0230	|		|		|		|		|		|
|0300	|		|		|		|		|		|
|0330	|   :heavy_check_mark:   |   :heavy_check_mark:   |   :heavy_check_mark:   |   :heavy_check_mark:   |   :heavy_check_mark:   |
|0400	|		|		|		|		|		|
|0430	|		|		|		|		|		|
|0500	|		|		|		|		|		|
|0530	|   :heavy_check_mark:   |   :heavy_check_mark:   |   :heavy_check_mark:   |   :heavy_check_mark:   |   :heavy_check_mark:   |
|0600	|		|		|		|		|		|
|0630	|		|		|		|		|		|
|0700	|		|		|		|		|		|
|0730	|   :heavy_check_mark:   |   :heavy_check_mark:   |   :heavy_check_mark:   |   :heavy_check_mark:   |   :heavy_check_mark:   |
|0800	|		|		|		|		|		|
|0830	|		|		|		|		|		|
|0900	|		|		|		|		|		|
|0930	|   :heavy_check_mark:   |   :heavy_check_mark:   |   :heavy_check_mark:   |   :heavy_check_mark:   |   :heavy_check_mark:   |
|1000	|		|		|		|		|		|
|1030	|		|		|		|		|		|
|1100	|		|		|		|		|		|
|1130	|   :heavy_check_mark:   |   :heavy_check_mark:   |   :heavy_check_mark:   |   :heavy_check_mark:   |   :heavy_check_mark:   |
|1200	|		|		|		|		|		|
|1230	|		|		|		|		|		|
|1300	|		|		|		|		|		|
|1330	|   :heavy_check_mark:   |   :heavy_check_mark:   |   :heavy_check_mark:   |   :heavy_check_mark:   |   :heavy_check_mark:   |
|1400	|		|		|		|		|		|
|1430	|		|		|		|		|		|
|1500	|		|		|	:x:	|		|		|
|1530	|   :heavy_check_mark:   |   :heavy_check_mark:   |	:x:	|   :heavy_check_mark:   |   :heavy_check_mark:   |
|1600	|		|		|	:x:	|		|		|
|1630	|		|		|	:x:	|		|		|
|1700	|		|		|	:x:	|		|		|
|1730	|   :heavy_check_mark:   |   :heavy_check_mark:   |	:x:	|   :heavy_check_mark:   |   :heavy_check_mark:   |
|1800	|		|		|	:x:	|		|		|
|1830	|		|		|	:x:	|		|		|
|1900	|		|		|	:x:	|		|		|
|1930	|   :heavy_check_mark:   |   :heavy_check_mark:   |	:x:	|   :heavy_check_mark:   |   :heavy_check_mark:   |
|2000	|		|		|	:x:	|		|		|
|2030	|		|		|	:x:	|		|		|
|2100	|		|		|		|		|		|
|2130	|   :heavy_check_mark:   |   :heavy_check_mark:   |   :heavy_check_mark:   |   :heavy_check_mark:   |		|
|2200	|		|		|		|		|		|
|2230	|		|		|		|		|		|
|2300	|		|		|		|		|		|
|2330	|		|		|		|		|		|

## Schedule Import
To initialize the above schedule in scrapydweb follow these instructions:
* Run scrapyd, logparser, and scrapydweb using directions in main [README](/README.md#running-scrapydweb-ui) file.
* Apply schedule to database by running the init script
        $ cd search_gov_crawler/search_gov_spiders/utility_files
        $ python init_schedule.py --input_file=./crawl-sites-production.json
* If there are any issues finding the database files, you may need to set the DATA_PATH environment variable.  If you have not set DATA_PATH as an environment variable or in scrapydweb config, it will be set to `<venv-path>/lib/python3.12/site-packages/scrapydweb/data/database`
* Refresh scrapydweb Timer Tasks page
* All tasks will initially be in an inactive state.  To reactivate:
  * Click `Edit` button on any task
  * Update `action` field from `Add Task & Fire Right Now` to `Add Task`
  * Update `name` field to remove ` - edit` that has been added to end of task name
  * Click `Check CMD` button
  * Click `[update] Add Task` button
  * Verify task has a value for `Next run time` on the Timer Task page.
