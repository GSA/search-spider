/* Clear existing tables */
DELETE FROM "task";
DELETE FROM "task_job_result";
DELETE FROM "task_result";

/* Insert new schedule */
INSERT INTO "task" VALUES( 1,'DOD Army MWR',                                            'cron',current_timestamp,current_timestamp,'search_gov_spiders','default: the latest version','domain_spider','dod-army-mwr',                                            '{"allowed_domains": "armymwr.com", "setting": [], "start_urls": "https://www.armymwr.com/"}',                                 '[1]','*','*','*','*','mon','03','30','0',NULL,NULL,'UTC',0,600,'True',1);
INSERT INTO "task" VALUES( 2,'DOD Defense Travel Management Office',                    'cron',current_timestamp,current_timestamp,'search_gov_spiders','default: the latest version','domain_spider','dod-defense-travel-management-office',                    '{"allowed_domains": "travel.dod.mil", "setting": [], "start_urls": "https://www.travel.dod.mil/"}',                           '[1]','*','*','*','*','tue','03','30','0',NULL,NULL,'UTC',0,600,'True',1);
INSERT INTO "task" VALUES( 3,'DOS AIS USVISA INFO',                                     'cron',current_timestamp,current_timestamp,'search_gov_spiders','default: the latest version','domain_spider','dos-ais-usvisa-info',                                     '{"allowed_domains": "ais.usvisa-info.com", "setting": [], "start_urls": "https://ais.usvisa-info.com/"}',                     '[1]','*','*','*','*','wed','03','30','0',NULL,NULL,'UTC',0,600,'True',1);
INSERT INTO "task" VALUES( 4,'Drought - Toolkit.climate.gov',                           'cron',current_timestamp,current_timestamp,'search_gov_spiders','default: the latest version','domain_spider','drought---toolkit.climate.gov',                           '{"allowed_domains": "toolkit.climate.gov", "setting": [], "start_urls": "https://toolkit.climate.gov"}',                      '[1]','*','*','*','*','thu','03','30','0',NULL,NULL,'UTC',0,600,'True',1);
INSERT INTO "task" VALUES( 5,'ED Office of Hearings and Appeals OHA',                   'cron',current_timestamp,current_timestamp,'search_gov_spiders','default: the latest version','domain_spider','ed-office-of-hearings-and-appeals-oha',                   '{"allowed_domains": "oha.ed.gov", "setting": [], "start_urls": "https://oha.ed.gov"}',                                        '[1]','*','*','*','*','fri','03','30','0',NULL,NULL,'UTC',0,600,'True',1);
INSERT INTO "task" VALUES( 6,'FDA Import Alerts',                                       'cron',current_timestamp,current_timestamp,'search_gov_spiders','default: the latest version','domain_spider','fda-import-alerts',                                       '{"allowed_domains": "accessdata.fda.gov", "setting": [], "start_urls": "https://www.accessdata.fda.gov/CMS_IA/default.html"}','[1]','*','*','*','*','mon','05','30','0',NULL,NULL,'UTC',0,600,'True',1);
INSERT INTO "task" VALUES( 7,'HHS ASPR Drive',                                          'cron',current_timestamp,current_timestamp,'search_gov_spiders','default: the latest version','domain_spider','hhs-aspr-drive',                                          '{"allowed_domains": "drive.hhs.gov", "setting": [], "start_urls": "https://drive.hhs.gov/"}',                                 '[1]','*','*','*','*','tue','05','30','0',NULL,NULL,'UTC',0,600,'True',1);
INSERT INTO "task" VALUES( 8,'NASA James Webb Space Telescope',                         'cron',current_timestamp,current_timestamp,'search_gov_spiders','default: the latest version','domain_spider','nasa-james-webb-space-telescope',                         '{"allowed_domains": "jwst.nasa.gov", "setting": [], "start_urls": "https://www.jwst.nasa.gov/"}',                             '[1]','*','*','*','*','wed','05','30','0',NULL,NULL,'UTC',0,600,'True',1);
INSERT INTO "task" VALUES( 9,'Navy All Hands Magazine',                                 'cron',current_timestamp,current_timestamp,'search_gov_spiders','default: the latest version','domain_spider_js','navy-all-hands-magazine',                              '{"allowed_domains": "allhands.navy.mil", "setting": [], "start_urls": "https://allhands.navy.mil/"}',                         '[1]','*','*','*','*','thu','05','30','0',NULL,NULL,'UTC',0,600,'True',1);
INSERT INTO "task" VALUES(10,'Navy MyNavyHR',                                           'cron',current_timestamp,current_timestamp,'search_gov_spiders','default: the latest version','domain_spider','navy-mynavyhr',                                           '{"allowed_domains": "mynavyhr.navy.mil", "setting": [], "start_urls": "https://www.mynavyhr.navy.mil/"}',                     '[1]','*','*','*','*','fri','05','30','0',NULL,NULL,'UTC',0,600,'True',1);
INSERT INTO "task" VALUES(11,'NIH Diversity',                                           'cron',current_timestamp,current_timestamp,'search_gov_spiders','default: the latest version','domain_spider','nih-diversity',                                           '{"allowed_domains": "diversity.nih.gov", "setting": [], "start_urls": "https://diversity.nih.gov/"}',                         '[1]','*','*','*','*','mon','07','30','0',NULL,NULL,'UTC',0,600,'True',1);
INSERT INTO "task" VALUES(12,'NIH LRP',                                                 'cron',current_timestamp,current_timestamp,'search_gov_spiders','default: the latest version','domain_spider','nih-lrp',                                                 '{"allowed_domains": "lrp.nih.gov", "setting": [], "start_urls": "https://www.lrp.nih.gov/"}',                                 '[1]','*','*','*','*','tue','07','30','0',NULL,NULL,'UTC',0,600,'True',1);
INSERT INTO "task" VALUES(13,'NIH ORWH',                                                'cron',current_timestamp,current_timestamp,'search_gov_spiders','default: the latest version','domain_spider','nih-orwh',                                                '{"allowed_domains": "orwh.od.nih.gov", "setting": [], "start_urls": "https://orwh.od.nih.gov/"}',                             '[1]','*','*','*','*','wed','07','30','0',NULL,NULL,'UTC',0,600,'True',1);
INSERT INTO "task" VALUES(14,'NOAA CoastWatch',                                         'cron',current_timestamp,current_timestamp,'search_gov_spiders','default: the latest version','domain_spider','noaa-coastwatch',                                         '{"allowed_domains": "coastwatch.noaa.gov", "setting": [], "start_urls": "https://coastwatch.noaa.gov/cw/index.html"}',        '[1]','*','*','*','*','thu','07','30','0',NULL,NULL,'UTC',0,600,'True',1);
INSERT INTO "task" VALUES(15,'NOAA Coastwatch Caribbean',                               'cron',current_timestamp,current_timestamp,'search_gov_spiders','default: the latest version','domain_spider','noaa-coastwatch-caribbean',                               '{"allowed_domains": "cwcaribbean.aoml.noaa.gov", "setting": [], "start_urls": "https://cwcaribbean.aoml.noaa.gov/"}',         '[1]','*','*','*','*','fri','07','30','0',NULL,NULL,'UTC',0,600,'True',1);
INSERT INTO "task" VALUES(16,'NOAA CoastWatch Central Pacific',                         'cron',current_timestamp,current_timestamp,'search_gov_spiders','default: the latest version','domain_spider','noaa-coastwatch-central-pacific',                         '{"allowed_domains": "oceanwatch.pifsc.noaa.gov", "setting": [], "start_urls": "https://oceanwatch.pifsc.noaa.gov/"}',         '[1]','*','*','*','*','mon','09','30','0',NULL,NULL,'UTC',0,600,'True',1);
INSERT INTO "task" VALUES(17,'NOAA CoastWatch East Coast Node',                         'cron',current_timestamp,current_timestamp,'search_gov_spiders','default: the latest version','domain_spider','noaa-coastwatch-east-coast-node',                         '{"allowed_domains": "eastcoast.coastwatch.noaa.gov", "setting": [], "start_urls": "https://eastcoast.coastwatch.noaa.gov/"}', '[1]','*','*','*','*','tue','09','30','0',NULL,NULL,'UTC',0,600,'True',1);
INSERT INTO "task" VALUES(18,'NOAA Coastwatch Great Lakes',                             'cron',current_timestamp,current_timestamp,'search_gov_spiders','default: the latest version','domain_spider','noaa-coastwatch-great-lakes',                             '{"allowed_domains": "coastwatch.glerl.noaa.gov", "setting": [], "start_urls": "https://coastwatch.glerl.noaa.gov/"}',         '[1]','*','*','*','*','wed','09','30','0',NULL,NULL,'UTC',0,600,'True',1);
INSERT INTO "task" VALUES(19,'NOAA CoastWatch West Coast',                              'cron',current_timestamp,current_timestamp,'search_gov_spiders','default: the latest version','domain_spider','noaa-coastwatch-west-coast',                              '{"allowed_domains": "coastwatch.pfeg.noaa.gov", "setting": [], "start_urls": "https://coastwatch.pfeg.noaa.gov/"}',           '[1]','*','*','*','*','thu','09','30','0',NULL,NULL,'UTC',0,600,'True',1);
INSERT INTO "task" VALUES(20,'NOAA GOES-R',                                             'cron',current_timestamp,current_timestamp,'search_gov_spiders','default: the latest version','domain_spider','noaa-goes-r',                                             '{"allowed_domains": "goes-r.gov", "setting": [], "start_urls": "https://www.goes-r.gov"}',                                    '[1]','*','*','*','*','fri','09','30','0',NULL,NULL,'UTC',0,600,'True',1);
INSERT INTO "task" VALUES(21,'NRCS WCC portal',                                         'cron',current_timestamp,current_timestamp,'search_gov_spiders','default: the latest version','domain_spider','nrcs-wcc-portal',                                         '{"allowed_domains": "nrcs.usda.gov", "setting": [], "start_urls": "https://www.nrcs.usda.gov/wps/portal/wcc/home/"}',         '[1]','*','*','*','*','mon','11','30','0',NULL,NULL,'UTC',0,600,'True',1);
INSERT INTO "task" VALUES(22,'TREAS - FinCEN',                                          'cron',current_timestamp,current_timestamp,'search_gov_spiders','default: the latest version','domain_spider','treas---fincen',                                          '{"allowed_domains": "fincen.gov", "setting": [], "start_urls": "https://www.fincen.gov/"}',                                   '[1]','*','*','*','*','tue','11','30','0',NULL,NULL,'UTC',0,600,'True',1);
INSERT INTO "task" VALUES(23,'US Committee on the Marine Transportation System',        'cron',current_timestamp,current_timestamp,'search_gov_spiders','default: the latest version','domain_spider','us-committee-on-the-marine-transportation-system',        '{"allowed_domains": "cmts.gov", "setting": [], "start_urls": "https://www.cmts.gov/"}',                                       '[1]','*','*','*','*','wed','11','30','0',NULL,NULL,'UTC',0,600,'True',1);
INSERT INTO "task" VALUES(24,'US COURTS CACB',                                          'cron',current_timestamp,current_timestamp,'search_gov_spiders','default: the latest version','domain_spider','us-courts-cacb',                                          '{"allowed_domains": "cacb.uscourts.gov", "setting": [], "start_urls": "https://www.cacb.uscourts.gov"}',                      '[1]','*','*','*','*','thu','11','30','0',NULL,NULL,'UTC',0,600,'True',1);
INSERT INTO "task" VALUES(25,'USCOURTS ARE',                                            'cron',current_timestamp,current_timestamp,'search_gov_spiders','default: the latest version','domain_spider','uscourts-are',                                            '{"allowed_domains": "are.uscourts.gov", "setting": [], "start_urls": "https://www.are.uscourts.gov/"}',                       '[1]','*','*','*','*','fri','11','30','0',NULL,NULL,'UTC',0,600,'True',1);
INSERT INTO "task" VALUES(26,'USCOURTS CAEP',                                           'cron',current_timestamp,current_timestamp,'search_gov_spiders','default: the latest version','domain_spider','uscourts-caep',                                           '{"allowed_domains": "caep.uscourts.gov", "setting": [], "start_urls": "https://www.caep.uscourts.gov/"}',                     '[1]','*','*','*','*','mon','13','30','0',NULL,NULL,'UTC',0,600,'True',1);
INSERT INTO "task" VALUES(27,'USCOURTS JPML',                                           'cron',current_timestamp,current_timestamp,'search_gov_spiders','default: the latest version','domain_spider','uscourts-jpml',                                           '{"allowed_domains": "jpml.uscourts.gov", "setting": [], "start_urls": "https://www.jpml.uscourts.gov"}',                      '[1]','*','*','*','*','tue','13','30','0',NULL,NULL,'UTC',0,600,'True',1);
INSERT INTO "task" VALUES(28,'USCOURTS MSND',                                           'cron',current_timestamp,current_timestamp,'search_gov_spiders','default: the latest version','domain_spider','uscourts-msnd',                                           '{"allowed_domains": "msnd.uscourts.gov", "setting": [], "start_urls": "https://www.msnd.uscourts.gov/"}',                     '[1]','*','*','*','*','wed','13','30','0',NULL,NULL,'UTC',0,600,'True',1);
INSERT INTO "task" VALUES(29,'USCOURTS MSSD',                                           'cron',current_timestamp,current_timestamp,'search_gov_spiders','default: the latest version','domain_spider','uscourts-mssd',                                           '{"allowed_domains": "mssd.uscourts.gov", "setting": [], "start_urls": "https://www.mssd.uscourts.gov/"}',                     '[1]','*','*','*','*','thu','13','30','0',NULL,NULL,'UTC',0,600,'True',1);
INSERT INTO "task" VALUES(30,'USCOURTS NCWBA',                                          'cron',current_timestamp,current_timestamp,'search_gov_spiders','default: the latest version','domain_spider','uscourts-ncwba',                                          '{"allowed_domains": "ncwba.uscourts.gov", "setting": [], "start_urls": "https://www.ncwba.uscourts.gov/"}',                   '[1]','*','*','*','*','fri','13','30','0',NULL,NULL,'UTC',0,600,'True',1);
INSERT INTO "task" VALUES(31,'USCOURTS PAWD',                                           'cron',current_timestamp,current_timestamp,'search_gov_spiders','default: the latest version','domain_spider','uscourts-pawd',                                           '{"allowed_domains": "pawd.uscourts.gov", "setting": [], "start_urls": "https://www.pawd.uscourts.gov/"}',                     '[1]','*','*','*','*','mon','15','30','0',NULL,NULL,'UTC',0,600,'True',1);
INSERT INTO "task" VALUES(32,'USCOURTS UTB',                                            'cron',current_timestamp,current_timestamp,'search_gov_spiders','default: the latest version','domain_spider','uscourts-utb',                                            '{"allowed_domains": "utb.uscourts.gov", "setting": [], "start_urls": "https://www.utb.uscourts.gov/"}',                       '[1]','*','*','*','*','tue','15','30','0',NULL,NULL,'UTC',0,600,'True',1);
INSERT INTO "task" VALUES(33,'USDA FPAC Business Center',                               'cron',current_timestamp,current_timestamp,'search_gov_spiders','default: the latest version','domain_spider','usda-fpac-business-center',                               '{"allowed_domains": "fpacbc.usda.gov", "setting": [], "start_urls": "https://www.fpacbc.usda.gov/index.html"}',               '[1]','*','*','*','*','thu','15','30','0',NULL,NULL,'UTC',0,600,'True',1);
INSERT INTO "task" VALUES(34,'USDA NFC Help Documentation',                             'cron',current_timestamp,current_timestamp,'search_gov_spiders','default: the latest version','domain_spider_js','usda-nfc-help-documentation',                          '{"allowed_domains": "help.nfc.usda.gov", "setting": [], "start_urls": "https://help.nfc.usda.gov/"}',                         '[1]','*','*','*','*','fri','15','30','0',NULL,NULL,'UTC',0,600,'True',1);
INSERT INTO "task" VALUES(35,'VA Access To Care',                                       'cron',current_timestamp,current_timestamp,'search_gov_spiders','default: the latest version','domain_spider','va-access-to-care',                                       '{"allowed_domains": "accesstocare.va.gov", "setting": [], "start_urls": "https://www.accesstocare.va.gov"}',                  '[1]','*','*','*','*','mon','17','30','0',NULL,NULL,'UTC',0,600,'True',1);
INSERT INTO "task" VALUES(36,'VA Benefits.va.gov',                                      'cron',current_timestamp,current_timestamp,'search_gov_spiders','default: the latest version','domain_spider','va-benefits.va.gov',                                      '{"allowed_domains": "benefits.va.gov", "setting": [], "start_urls": "https://benefits.va.gov/benefits/"}',                    '[1]','*','*','*','*','tue','17','30','0',NULL,NULL,'UTC',0,600,'True',1);
INSERT INTO "task" VALUES(37,'VA CFM Technical Information Library TIL',                'cron',current_timestamp,current_timestamp,'search_gov_spiders','default: the latest version','domain_spider','va-cfm-technical-information-library-til',                '{"allowed_domains": "cfm.va.gov", "setting": [], "start_urls": "https://www.cfm.va.gov/til/"}',                               '[1]','*','*','*','*','thu','17','30','0',NULL,NULL,'UTC',0,600,'True',1);
INSERT INTO "task" VALUES(38,'VA CIDER Research',                                       'cron',current_timestamp,current_timestamp,'search_gov_spiders','default: the latest version','domain_spider','va-cider-research',                                       '{"allowed_domains": "cider.research.va.gov", "setting": [], "start_urls": "https://www.cider.research.va.gov"}',              '[1]','*','*','*','*','fri','17','30','0',NULL,NULL,'UTC',0,600,'True',1);
INSERT INTO "task" VALUES(39,'VA HERC Research - keep query strings',                   'cron',current_timestamp,current_timestamp,'search_gov_spiders','default: the latest version','domain_spider','va-herc-research---keep-query-strings',                   '{"allowed_domains": "herc.research.va.gov", "setting": [], "start_urls": "https://www.herc.research.va.gov/"}',               '[1]','*','*','*','*','mon','19','30','0',NULL,NULL,'UTC',0,600,'True',1);
INSERT INTO "task" VALUES(40,'VA HSRD Research',                                        'cron',current_timestamp,current_timestamp,'search_gov_spiders','default: the latest version','domain_spider','va-hsrd-research',                                        '{"allowed_domains": "hsrd.research.va.gov", "setting": [], "start_urls": "https://www.hsrd.research.va.gov/"}',               '[1]','*','*','*','*','tue','19','30','0',NULL,NULL,'UTC',0,600,'True',1);
INSERT INTO "task" VALUES(41,'VA My Health',                                            'cron',current_timestamp,current_timestamp,'search_gov_spiders','default: the latest version','domain_spider','va-my-health',                                            '{"allowed_domains": "myhealth.va.gov", "setting": [], "start_urls": "https://www.myhealth.va.gov"}',                          '[1]','*','*','*','*','thu','19','30','0',NULL,NULL,'UTC',0,600,'True',1);
INSERT INTO "task" VALUES(42,'VA Office of Accountability and Whistleblower Protection','cron',current_timestamp,current_timestamp,'search_gov_spiders','default: the latest version','domain_spider','va-office-of-accountability-and-whistleblower-protection','{"allowed_domains": "va.gov", "setting": [], "start_urls": "https://www.va.gov/accountability/"}',                            '[1]','*','*','*','*','fri','19','30','0',NULL,NULL,'UTC',0,600,'True',1);
INSERT INTO "task" VALUES(43,'VA QUERI Research',                                       'cron',current_timestamp,current_timestamp,'search_gov_spiders','default: the latest version','domain_spider','va-queri-research',                                       '{"allowed_domains": "queri.research.va.gov", "setting": [], "start_urls": "https://www.queri.research.va.gov/"}',             '[1]','*','*','*','*','mon','21','30','0',NULL,NULL,'UTC',0,600,'True',1);
INSERT INTO "task" VALUES(44,'VA Research & Development',                               'cron',current_timestamp,current_timestamp,'search_gov_spiders','default: the latest version','domain_spider','va-research-&-development',                               '{"allowed_domains": "research.va.gov", "setting": [], "start_urls": "https://www.research.va.gov/"}',                         '[1]','*','*','*','*','tue','21','30','0',NULL,NULL,'UTC',0,600,'True',1);
INSERT INTO "task" VALUES(45,'VA Resources',                                            'cron',current_timestamp,current_timestamp,'search_gov_spiders','default: the latest version','domain_spider','va-resources',                                            '{"allowed_domains": "va.gov", "setting": [], "start_urls": "https://www.va.gov/resources/"}',                                 '[1]','*','*','*','*','wed','21','30','0',NULL,NULL,'UTC',0,600,'True',1);
INSERT INTO "task" VALUES(46,'DOD DANTES',                                              'cron',current_timestamp,current_timestamp,'search_gov_spiders','default: the latest version','domain_spider','dod-dantes',                                              '{"allowed_domains": "dantes.mil","setting": [], "start_urls": "https://www.dantes.mil/"}',                                    '[1]','*','*','*','*','thu','21','30','0',NULL,NULL,'UTC',0,600,'True',1);
