#!/bin/bash
## This is the main script for the ECFORECASTGRABBER tool. If you're in here I hope you know what you're doing. :)
## Any issues, suggestions or contributions are welcome and can be made on github.
export LANGUAGE=UTF8

version="v3.2"

#Bring in config file variables.
. $(dirname "$0")/config.sh

#Some Temporary variables
tmp=tmp
finalForecasttmp="$tmp$finalForecast"

echo 'Running forecastgrabber.sh. Fetching XML feed.'
$wgetPath -O "$webPath/$xmlFile" $rssURL

## IF YOUR SYSTEM USES CURL COMMENT OUT THE PREVIOUS LINE AND UNCOMMENT THE FOLLOWING LINE
#/path/to/curl -o /your/location/ECXMLfile.txt https://weather.gc.ca/rss/city/bc-46_e.xml

#Export all the variables for perl
export perlversion=$version
export perlwebPath=$webPath
export perlxmlFile=$xmlFile
export perlenableIndigenous=$enableIndigenous
export perlenableTseshaht=$enableTseshaht
export perlenableMarine=$enableMarine
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
export perlnearfreezeTemp=$nearfreezeTemp
export perlhotTemp=$hotTemp
export perlexhotTemp=$exhotTemp
export perlexHumidex=$exHumidex
export perlthunderWarn=$thunderWarn
export perlboldDays=$boldDays
export perltextColor=$textColor
export perlflurriesColor=$flurriesColor
export perlfooterMsg=$footerMsg
export perlwindyColor=$windyColor
export perlhRainColor=$hRainColor
export perlvhRainColor=$vhRainColor
export perlwarningColor=$warningColor
export perlendedColor=$endedColor


echo 'running perl script'

## Running the perl script with -C to ensure UTF-8 compliance.

perl -C $scriptPath/forecast.pl

## Copying the new file from temporary to final file and removing the temporary.

cp $webPath/$finalForecasttmp $webPath/$finalForecast
rm $webPath/$finalForecasttmp

echo 'done'