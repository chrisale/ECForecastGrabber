#!/bin/bash
## THIS SCRIPT WILL NEED TO BE MADE EXECUTABLE (chmod +x) AND THEN ADDED TO YOUR CRONJOBS
## * * * * * /path/to/this/forecastgrabber.sh will run the forecast grabber every 60 seconds.
## YOU MUST MODIFY forecast.pl with similar paths and other configurations for this to function.

## MODIFY THE FILE PATHS TO SUIT YOUR SYSTEM. ECXMLfile, forecast.pl, and EC ForecastTmp.txt can all be in the same place.
## MODIFY THE FULL URL WEB ADDRESS TO YOUR CITY RSS FEED

/path/to/wget -O "/your/location/ECXMLfile.txt" https://weather.gc.ca/rss/city/bc-46_e.xml

## IF YOUR SYSTEM USES CURL COMMENT OUT THE PREVIOUS LINE AND UNCOMMENT THE FOLLOWING LINE
#/path/to/curl -o /your/location/ECXMLfile.txt https://weather.gc.ca/rss/city/bc-46_e.xml

## THE LOCATION OF forecast.pl
perl /your/location/forecast.pl

## THE LOCATION OF THE TEMPORARY FILE CAN BE THE SAME AS YOUR forecast.pl and ECXMLFile.

##ECForecast.html must be in a public web directory to be included on your webpage.
cp /your/location/ECForecastTmp.txt /your/web/folder/ECForecast.html

echo 'done'
