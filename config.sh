#!/bin/bash
## CONFIG FILE FOR FORECAST GRABBER

## Full path to wget 
#eg. /usr/bin/wget
wgetPath=/usr/bin/wget

## Path to your script files. Recommended outside your web accessible directory.
#eg. /var/www/supportfiles/ECForecastGrabber-main
scriptPath=/var/www/supportfiles/ECForecastGrabber-main

## Path to final web directory where XML and HTML file will be stored.
#eg. /var/www/httpdocs
webPath=/var/www/httpdocs

## Full URL to the RSS feed for your desired city.
#eg. https://weather.gc.ca/rss/city/bc-46_e.xml
rssURL=https://weather.gc.ca/rss/city/bc-46_e.xml

## Full URL to the to your desired city's forecast page.
#eg. https://weather.gc.ca/city/pages/bc-46_metric_e.html
forecastURL=https://weather.gc.ca/city/pages/bc-46_metric_e.html

## Exact name of the City associated with the forecast page - If you get a double output of the name or warning
#link you might need to check this to ensure it is exactly the same as the webpage.
## eg. 'Port Alberni'
forecastPlaceName='Port Alberni'

## Full URL of the forecast web page for your city or town.
## eg. https://weather.gc.ca/warnings/report_e.html?bc45
warnLink=https://weather.gc.ca/warnings/report_e.html?bc45

## Full URL of the warnings web page for your area.
## eg. https://weather.gc.ca/lightning/index_e.html?id=PAC#mapTop
thunderLink=https://weather.gc.ca/lightning/index_e.html?id=PAC#mapTop

## Clickable name for your forecast, this can be anything.
## eg. 'Vancouver Island Inland Sections - Forecast'
forecastName='Vancouver Island Inland Sections - Forecast'


#### THE FOLLOWING DON'T NEED TO BE CHANGED BUT CAN BE

## Name of the XML file
## eg. ECXMLfile.xml
xmlFile=ECXMLfile.xml

## Final Web File Name - A temporary file will also be derived from this filename and placed in 
## the same directory when the script runs.
## eg. ECForecast.html
finalForecast=ECForecast.html

##Colours for warnings.
## eg. #ff7777;
## or for a name eg. red;
freezeDrizzleWarn=#ff7777;
freezeRainWarn=#ff66dd;
freezingTemp=#0000ff;
hotTemp=#ff0000;
thunderWarn=#ffaa00;

