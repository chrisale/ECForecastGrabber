#!/bin/bash
## THIS SCRIPT WILL NEED TO BE MADE EXECUTABLE (chmod +x) AND THEN ADDED TO YOUR CRONJOBS
## * * * * * /path/to/this/forecastgrabber.sh will run the forecast grabber every 60 seconds.
## YOU MUST MODIFY forecast.pl with similar paths and other configurations for this to function.

## MODIFY THE FILE PATHS TO SUIT YOUR SYSTEM. ECXMLfile, forecast.pl, and EC ForecastTmp.txt can all be in the same place.
. $(dirname "$0")/config.sh

tmp=tmp
finalForecasttmp="$tmp$finalForecast"

echo 'Running forecastgrabber.sh. Fetching XML feed.'
$wgetPath -O "$webPath/$xmlFile" $rssURL

## IF YOUR SYSTEM USES CURL COMMENT OUT THE PREVIOUS LINE AND UNCOMMENT THE FOLLOWING LINE
#/path/to/curl -o /your/location/ECXMLfile.txt https://weather.gc.ca/rss/city/bc-46_e.xml



#Export all the variables for perl

export perlwebPath=$webPath
export perlxmlFile=$xmlFile
export perlforecastURL=$forecastURL
export perlforecastPlaceName=$forecastPlaceName
export perlwarnLink=$warnLink
export perlthunderLink=$thunderLink
export perlforecastName=$forecastName
export perlfinalForecast=$finalForecast
export perlfinalForecasttmp=$finalForecasttmp
export perlfreezeDrizzleWarn=$freezeDrizzleWarn
export perlfreezeRainWarn=$freezeRainWarn
export perlfreezingTemp=$freezingTemp
export perlhotTemp=$hotTemp
export perlthunderWarn=$thunderWarn
export perlboldDays=$boldDays
export perltextColor=$textColor
export perlflurriesColor=$flurriesColor
export perlfooterMsg=$footerMsg



## THE LOCATION OF forecast.pl
echo 'running perl script'

perl $scriptPath/forecast.pl

## THE LOCATION OF THE TEMPORARY FILE CAN BE THE SAME AS YOUR forecast.pl and ECXMLFile.

##ECForecast.html must be in a public web directory to be included on your webpage.

cp $webPath/$finalForecasttmp $webPath/$finalForecast
rm $webPath/$finalForecasttmp

echo 'done'
