#!/usr/bin/perl
# use moduleuse XML::Simple;
package ECFGWarnings;
use XML::Simple;
use Data::Dumper;
use HTTP::Date;
use utf8;
use Encode;
use Exporter;

our @ISA= qw(Exporter);

# these CAN be exported.
our @EXPORT_OK = qw( warnings_weather );

# these are exported by default.
our @EXPORT = qw( warnings_weather );

sub warnings_weather {
#print "hello";

	my ($fullforecast,$warnLink,$thunderLink,$boldDays,$textColor,$freezeDrizzleWarn,$freezeRainWarn,$freezingTemp,$nearfreezeTemp,$hotTemp,$exhotTemp,$exHumidex,$thunderWarn,$flurriesColor,$windyColor,$hRainColor,$vhRainColor,$warningColor,$endedColor,$yellowWarnColor,$orangeWarnColor,$redWarnColor,$comma,$forecastlink,$warnings,$warnings2,$warnings3,$forecastPlaceName,$forecastName,$footerMsg,$mainStyleElement,$daystrongStyle,$drizzstrongStyle,$frainstrongStyle,$flurstrongStyle,$snowflstrongStyle,$snowstrongStyle,$ftempstrongStyle,$htempstrongStyle,$thunderstrongStyle) = @_;

$fullforecast =~ s/No watches or warnings in effect. $forecastPlaceName//g;
$fullforecast =~ s/Aucune veille ou alerte en vigueur. $forecastPlaceName//g;

##ENDING WARNINGS - COMES FIRST TO CATCH THE "ENDED" AND NOT MIX UP THE WARNINGS
$fullforecast =~ s/SNOWFALL WARNING ENDED, $forecastPlaceName/<strong><a target='_blank' style="color: $warningColor;" href="$warnLink">SNOWFALL WARNING ENDED<\/a><\/strong>/g;

$fullforecast =~ s/WIND WARNING ENDED, $forecastPlaceName/<strong><a target='_blank' style="color: $warningColor;" href="$warnLink">WIND WARNING ENDED<\/a><\/strong>/g;

$fullforecast =~ s/RAINFALL WARNING ENDED, $forecastPlaceName/<strong><a target='_blank' style="color: $warningColor;" href="$warnLink">RAINFALL WARNING ENDED<\/a><\/strong>/g;

$fullforecast =~ s/FREEZING RAIN WARNING ENDED, $forecastPlaceName/<strong><a target='_blank' style="color: $warningColor;" href="$warnLink">FREEZING RAIN WARNING ENDED<\/a><\/strong>/g;

$fullforecast =~ s/FREEZING DRIZZLE WARNING ENDED, $forecastPlaceName/<strong><a target='_blank' style="color: $warningColor;" href="$warnLink">FREEZING DRIZZLE WARNING ENDED<\/a><\/strong>/g;

$fullforecast =~ s/WINTER STORM WARNING ENDED, $forecastPlaceName/<strong><a target='_blank' style="color: $warningColor;" href="$warnLink">WINTER STORM ENDED<\/a><\/strong>/g;

##STATEMENTS AND WATCHES TO GET TO BEFORE WARNINGS


##WINTER STORM WATCH**
$fullforecast =~ s/WINTER STORM WATCH, $forecastPlaceName/<strong><a target='_blank' style="color: $warningColor;" href="$warnLink">WINTER STORM WATCH IN EFFECT<\/a><\/strong>/g;
$fullforecast =~ s/AVIS TEMPÊTE HIVERNALE, $forecastPlaceName/<strong><a target='_blank' style="background-color: $redWarnColor; color: #000;" href="$warnLink">AVIS TEMPÊTE HIVERNALE <\/a><\/strong>/g;

$fullforecast =~ s/SEVERE THUNDERSTORM WATCH, $forecastPlaceName/<strong><a target='_blank' style="color: $warningColor;" href="$warnLink">SEVERE THUNDERSTORM WATCH IN EFFECT<\/a><\/strong>/g;

$fullforecast =~ s/SPECIAL AIR QUALITY STATEMENT, $forecastPlaceName/<strong><a target='_blank' style="color: $warningColor;" href="$warnLink">SPECIAL AIR QUALITY STATEMENT IN EFFECT<\/a><\/strong>/g;

$fullforecast =~ s/SPECIAL WEATHER STATEMENT, $forecastPlaceName/<strong ><a target='_blank' style="color: $warningColor;" href="$warnLink">SPECIAL WEATHER STATEMENT IN EFFECT<\/a><\/strong>/g;
$fullforecast =~ s/BULLETIN MÉTÉOROLOGIQUE SPECIAL, $forecastPlaceName/<strong ><a target='_blank' style="color: $warningColor;" href="$warnLink">BULLETIN MÉTÉOROLOGIQUE SPÉCIAL<\/a><\/strong>/g;

$fullforecast =~ s/FOG ADVISORY, $forecastPlaceName/<strong><a target='_blank' style="color: $warningColor;"  href="$warnLink">FOG ADVISORY IN EFFECT<\/a><\/strong>/g;


##GENERIC WEATHER WARNING
$fullforecast =~ s/WEATHER WARNING, $forecastPlaceName/<strong><a target='_blank' style="color: $warningColor;" href="$warnLink">WEATHER WARNING IN EFFECT<\/a><\/strong>/g;

#SMOG WARNING
$fullforecast =~ s/SMOG WARNING, $forecastPlaceName/<strong><a target='_blank' style="color: $warningColor;" href="$warnLink">SMOG WARNING<\/a><\/strong>/g;


##WIND WARNING WARNINGS**
$fullforecast =~ s/YELLOW WARNING - WIND, $forecastPlaceName/<strong><a target='_blank' style="background-color: $yellowWarnColor; color: #000;" href="$warnLink">YELLOW WARNING - WIND<\/a><\/strong>/g;
$fullforecast =~ s/AVERTISSEMENT JAUNE - VENT, $forecastPlaceName/<strong><a target='_blank' style="background-color: $yellowWarnColor; color: #000;" href="$warnLink">AVERTISSEMENT JAUNE - VENT <\/a><\/strong>/g;

$fullforecast =~ s/ORANGE WARNING - WIND, $forecastPlaceName/<strong><a target='_blank' style="background-color: $orangeWarnColor; color: #000;" href="$warnLink">ORANGE WARNING - WIND<\/a><\/strong>/g;
$fullforecast =~ s/AVERTISSEMENT ORANGE - VENT, $forecastPlaceName/<strong><a target='_blank' style="background-color: $orangeWarnColor; color: #000;" href="$warnLink">AVERTISSEMENT ORANGE - VENT <\/a><\/strong>/g;

$fullforecast =~ s/RED WARNING - WIND, $forecastPlaceName/<strong><a target='_blank' style="background-color: $redWarnColor; color: #000;" href="$warnLink">RED WARNING - WIND<\/a><\/strong>/g;
$fullforecast =~ s/AVERTISSEMENT ROUGE - VENT, $forecastPlaceName/<strong><a target='_blank' style="background-color: $redWarnColor; color: #000;" href="$warnLink">AVERTISSEMENT ROUGE - VENT <\/a><\/strong>/g;


##FREEZING RAIN WARNINGS**
$fullforecast =~ s/YELLOW WARNING - FREEZING RAIN, $forecastPlaceName/<strong><a target='_blank' style="background-color: $yellowWarnColor; color: #000;" href="$warnLink">YELLOW WARNING - FREEZING RAIN<\/a><\/strong>/g;
$fullforecast =~ s/AVERTISSEMENT JAUNE - PLUIE VERGLAÇANTE, $forecastPlaceName/<strong><a target='_blank' style="background-color: $yellowWarnColor; color: #000;" href="$warnLink">AVERTISSEMENT JAUNE - PLUIE VERGLAÇANTE <\/a><\/strong>/g;

$fullforecast =~ s/ORANGE WARNING - FREEZING RAIN, $forecastPlaceName/<strong><a target='_blank' style="background-color: $orangeWarnColor; color: #000;" href="$warnLink">ORANGE WARNING - FREEZING RAIN<\/a><\/strong>/g;
$fullforecast =~ s/AVERTISSEMENT ORANGE - PLUIE VERGLAÇANTE, $forecastPlaceName/<strong><a target='_blank' style="background-color: $orangeWarnColor; color: #000;" href="$warnLink">AVERTISSEMENT ORANGE - PLUIE VERGLAÇANTE <\/a><\/strong>/g;

$fullforecast =~ s/RED WARNING - FREEZING RAIN, $forecastPlaceName/<strong><a target='_blank' style="background-color: $redWarnColor; color: #000;" href="$warnLink">RED WARNING - FREEZING RAIN<\/a><\/strong>/g;
$fullforecast =~ s/AVERTISSEMENT ROUGE - PLUIE VERGLAÇANTE, $forecastPlaceName/<strong><a target='_blank' style="background-color: $redWarnColor; color: #000;" href="$warnLink">AVERTISSEMENT ROUGE - PLUIE VERGLAÇANTE <\/a><\/strong>/g;


##FREEZING DRIZZLE WARNINGS**
$fullforecast =~ s/YELLOW WARNING - FREEZING DRIZZLE, $forecastPlaceName/<strong><a target='_blank' style="background-color: $yellowWarnColor; color: #000;" href="$warnLink">YELLOW WARNING - FREEZING DRIZZLE<\/a><\/strong>/g;
$fullforecast =~ s/AVERTISSEMENT JAUNE - BRUINE VERGLAÇANTE, $forecastPlaceName/<strong><a target='_blank' style="background-color: $yellowWarnColor; color: #000;" href="$warnLink">AVERTISSEMENT JAUNE - BRUINE VERGLAÇANTE <\/a><\/strong>/g;

$fullforecast =~ s/ORANGE WARNING - FREEZING DRIZZLE, $forecastPlaceName/<strong><a target='_blank' style="background-color: $orangeWarnColor; color: #000;" href="$warnLink">ORANGE WARNING - FREEZING DRIZZLE<\/a><\/strong>/g;
$fullforecast =~ s/AVERTISSEMENT ORANGE - BRUINE VERGLAÇANTE, $forecastPlaceName/<strong><a target='_blank' style="background-color: $orangeWarnColor; color: #000;" href="$warnLink">AVERTISSEMENT ORANGE - BRUINE VERGLAÇANTE <\/a><\/strong>/g;

$fullforecast =~ s/RED WARNING - FREEZING DRIZZLE, $forecastPlaceName/<strong><a target='_blank' style="background-color: $redWarnColor; color: #000;" href="$warnLink">RED WARNING - FREEZING DRIZZLE<\/a><\/strong>/g;
$fullforecast =~ s/AVERTISSEMENT ROUGE - BRUINE VERGLAÇANTE, $forecastPlaceName/<strong><a target='_blank' style="background-color: $redWarnColor; color: #000;" href="$warnLink">AVERTISSEMENT ROUGE - BRUINE VERGLAÇANTE <\/a><\/strong>/g;


##WINTER STORM WARNINGS**
$fullforecast =~ s/YELLOW WARNING - WINTER STORM, $forecastPlaceName/<strong><a target='_blank' style="background-color: $yellowWarnColor; color: #000;" href="$warnLink">YELLOW WARNING - WINTER STORM<\/a><\/strong>/g;
$fullforecast =~ s/AVERTISSEMENT JAUNE - TEMPÊTE HIVERNALE, $forecastPlaceName/<strong><a target='_blank' style="background-color: $yellowWarnColor; color: #000;" href="$warnLink">AVERTISSEMENT JAUNE - TEMPÊTE HIVERNALE <\/a><\/strong>/g;

$fullforecast =~ s/ORANGE WARNING - WINTER STORM, $forecastPlaceName/<strong><a target='_blank' style="background-color: $orangeWarnColor; color: #000;" href="$warnLink">ORANGE WARNING - WINTER STORM<\/a><\/strong>/g;
$fullforecast =~ s/AVERTISSEMENT ORANGE - TEMPÊTE HIVERNALE, $forecastPlaceName/<strong><a target='_blank' style="background-color: $orangeWarnColor; color: #000;" href="$warnLink">AVERTISSEMENT ORANGE - TEMPÊTE HIVERNALE <\/a><\/strong>/g;

$fullforecast =~ s/RED WARNING - WINTER STORM, $forecastPlaceName/<strong><a target='_blank' style="background-color: $redWarnColor; color: #000;" href="$warnLink">RED WARNING - WINTER STORM<\/a><\/strong>/g;
$fullforecast =~ s/AVERTISSEMENT ROUGE - TEMPÊTE HIVERNALE, $forecastPlaceName/<strong><a target='_blank' style="background-color: $redWarnColor; color: #000;" href="$warnLink">AVERTISSEMENT ROUGE - TEMPÊTE HIVERNALE <\/a><\/strong>/g;


##EXTREME COLD WARNINGS**
$fullforecast =~ s/YELLOW WARNING - EXTREME COLD, $forecastPlaceName/<strong><a target='_blank' style="background-color: $yellowWarnColor; color: #000;" href="$warnLink">YELLOW WARNING - EXTREME COLD<\/a><\/strong>/g;
$fullforecast =~ s/AVERTISSEMENT JAUNE - FROID EXTRÊME, $forecastPlaceName/<strong><a target='_blank' style="background-color: $yellowWarnColor; color: #000;" href="$warnLink">AVERTISSEMENT JAUNE - FROID EXTRÊME <\/a><\/strong>/g;

$fullforecast =~ s/ORANGE WARNING - EXTREME COLD, $forecastPlaceName/<strong><a target='_blank' style="background-color: $orangeWarnColor; color: #000;" href="$warnLink">ORANGE WARNING - EXTREME COLD<\/a><\/strong>/g;
$fullforecast =~ s/AVERTISSEMENT ORANGE - FROID EXTRÊME, $forecastPlaceName/<strong><a target='_blank' style="background-color: $orangeWarnColor; color: #000;" href="$warnLink">AVERTISSEMENT ORANGE - FROID EXTRÊME <\/a><\/strong>/g;

$fullforecast =~ s/RED WARNING - EXTREME COLD, $forecastPlaceName/<strong><a target='_blank' style="background-color: $redWarnColor; color: #000;" href="$warnLink">RED WARNING - EXTREME COLD<\/a><\/strong>/g;
$fullforecast =~ s/AVERTISSEMENT ROUGE - FROID EXTRÊME, $forecastPlaceName/<strong><a target='_blank' style="background-color: $redWarnColor; color: #000;" href="$warnLink">AVERTISSEMENT ROUGE - FROID EXTRÊME <\/a><\/strong>/g;


##RAINFALL WARNINGS**
$fullforecast =~ s/YELLOW WARNING - RAINFALL, $forecastPlaceName/<strong><a target='_blank' style="background-color: $yellowWarnColor; color: #000;" href="$warnLink">YELLOW WARNING - RAINFALL<\/a><\/strong>/g;
$fullforecast =~ s/AVERTISSEMENT JAUNE - PLUIE, $forecastPlaceName/<strong><a target='_blank' style="background-color: $yellowWarnColor; color: #000;" href="$warnLink">AVERTISSEMENT JAUNE - PLUIE <\/a><\/strong>/g;

$fullforecast =~ s/ORANGE WARNING - RAINFALL, $forecastPlaceName/<strong><a target='_blank' style="background-color: $orangeWarnColor; color: #000;" href="$warnLink">ORANGE WARNING - RAINFALL<\/a><\/strong>/g;
$fullforecast =~ s/AVERTISSEMENT ORANGE - PLUIE, $forecastPlaceName/<strong><a target='_blank' style="background-color: $orangeWarnColor; color: #000;" href="$warnLink">AVERTISSEMENT ORANGE - PLUIE <\/a><\/strong>/g;

$fullforecast =~ s/RED WARNING - RAINFALL, $forecastPlaceName/<strong><a target='_blank' style="background-color: $redWarnColor; color: #000;" href="$warnLink">RED WARNING - RAINFALL<\/a><\/strong>/g;
$fullforecast =~ s/AVERTISSEMENT ROUGE - PLUIE, $forecastPlaceName/<strong><a target='_blank' style="background-color: $redWarnColor; color: #000;" href="$warnLink">AVERTISSEMENT ROUGE - PLUIE <\/a><\/strong>/g;

##SNOWFALL WARNINGS**
$fullforecast =~ s/YELLOW WARNING - SNOWFALL, $forecastPlaceName/<strong><a target='_blank' style="background-color: $yellowWarnColor; color: #000;" href="$warnLink">YELLOW WARNING - SNOWFALL<\/a><\/strong>/g;
$fullforecast =~ s/AVERTISSEMENT JAUNE - NEIGE, $forecastPlaceName/<strong><a target='_blank' style="background-color: $yellowWarnColor; color: #000;" href="$warnLink">AVERTISSEMENT JAUNE - NEIGE <\/a><\/strong>/g;

$fullforecast =~ s/ORANGE WARNING - SNOWFALL, $forecastPlaceName/<strong><a target='_blank' style="background-color: $orangeWarnColor; color: #000;" href="$warnLink">ORANGE WARNING - SNOWFALL<\/a><\/strong>/g;
$fullforecast =~ s/AVERTISSEMENT ORANGE - NEIGE, $forecastPlaceName/<strong><a target='_blank' style="background-color: $orangeWarnColor; color: #000;" href="$warnLink">AVERTISSEMENT ORANGE - NEIGE <\/a><\/strong>/g;

$fullforecast =~ s/RED WARNING - SNOWFALL, $forecastPlaceName/<strong><a target='_blank' style="background-color: $redWarnColor; color: #000;" href="$warnLink">RED WARNING - SNOWFALL<\/a><\/strong>/g;
$fullforecast =~ s/AVERTISSEMENT ROUGE - NEIGE, $forecastPlaceName/<strong><a target='_blank' style="background-color: $redWarnColor; color: #000;" href="$warnLink">AVERTISSEMENT ROUGE - NEIGE <\/a><\/strong>/g;

##BLOWING SNOW ADVISORY**
$fullforecast =~ s/YELLOW ADVISORY - BLOWING SNOW, $forecastPlaceName/<strong><a target='_blank' style="background-color: $yellowWarnColor; color: #000;" href="$warnLink">YELLOW ADVISORY - BLOWING SNOW<\/a><\/strong>/g;
$fullforecast =~ s/AVIS JAUNE - POUDRERIE, $forecastPlaceName/<strong><a target='_blank' style="background-color: $yellowWarnColor; color: #000;" href="$warnLink">AVIS JAUNE - POUDRERIE <\/a><\/strong>/g;

$fullforecast =~ s/ORANGE ADVISORY - BLOWING SNOW, $forecastPlaceName/<strong><a target='_blank' style="background-color: $orangeWarnColor; color: #000;" href="$warnLink">ORANGE ADVISORY - BLOWING SNOW<\/a><\/strong>/g;
$fullforecast =~ s/AVIS ORANGE - POUDRERIE, $forecastPlaceName/<strong><a target='_blank' style="background-color: $orangeWarnColor; color: #000;" href="$warnLink">AVIS ORANGE - POUDRERIE <\/a><\/strong>/g;

$fullforecast =~ s/RED ADVISORY - BLOWING SNOW, $forecastPlaceName/<strong><a target='_blank' style="background-color: $redWarnColor; color: #000;" href="$warnLink">RED ADVISORY - BLOWING SNOW<\/a><\/strong>/g;
$fullforecast =~ s/AVIS ROUGE - POUDRERIE, $forecastPlaceName/<strong><a target='_blank' style="background-color: $redWarnColor; color: #000;" href="$warnLink">AVIS ROUGE - POUDRERIE <\/a><\/strong>/g;

##BLIZZARD WARNING**
$fullforecast =~ s/YELLOW WARNING - BLIZZARD, $forecastPlaceName/<strong><a target='_blank' style="background-color: $yellowWarnColor; color: #000;" href="$warnLink">YELLOW WARNING - BLIZZARD<\/a><\/strong>/g;
$fullforecast =~ s/AVERTISSEMENT JAUNE - BLIZZARD, $forecastPlaceName/<strong><a target='_blank' style="background-color: $yellowWarnColor; color: #000;" href="$warnLink">AVERTISSEMENT JAUNE - BLIZZARD <\/a><\/strong>/g;

$fullforecast =~ s/ORANGE WARNING - BLIZZARD, $forecastPlaceName/<strong><a target='_blank' style="background-color: $orangeWarnColor; color: #000;" href="$warnLink">ORANGE WARNING - BLIZZARD<\/a><\/strong>/g;
$fullforecast =~ s/AVERTISSEMENT ORANGE - BLIZZARD, $forecastPlaceName/<strong><a target='_blank' style="background-color: $orangeWarnColor; color: #000;" href="$warnLink">AVERTISSEMENT ORANGE - BLIZZARD <\/a><\/strong>/g;

$fullforecast =~ s/RED WARNING - BLIZZARD, $forecastPlaceName/<strong><a target='_blank' style="background-color: $redWarnColor; color: #000;" href="$warnLink">RED WARNING - BLIZZARD<\/a><\/strong>/g;
$fullforecast =~ s/AVERTISSEMENT ROUGE - BLIZZARD, $forecastPlaceName/<strong><a target='_blank' style="background-color: $redWarnColor; color: #000;" href="$warnLink">AVERTISSEMENT ROUGE - BLIZZARD <\/a><\/strong>/g;

##SNOW SQUALL WARNING**
$fullforecast =~ s/YELLOW WARNING - SNOW SQUALL, $forecastPlaceName/<strong><a target='_blank' style="background-color: $yellowWarnColor; color: #000;" href="$warnLink">YELLOW WARNING - SNOW SQUALL<\/a><\/strong>/g;
$fullforecast =~ s/AVERTISSEMENT JAUNE - BOURRASQUES DE NEIGE, $forecastPlaceName/<strong><a target='_blank' style="background-color: $yellowWarnColor; color: #000;" href="$warnLink">AVERTISSEMENT JAUNE - BOURRASQUES DE NEIGE <\/a><\/strong>/g;

$fullforecast =~ s/ORANGE WARNING - SNOW SQUALL, $forecastPlaceName/<strong><a target='_blank' style="background-color: $orangeWarnColor; color: #000;" href="$warnLink">ORANGE WARNING - SNOW SQUALL<\/a><\/strong>/g;
$fullforecast =~ s/AVERTISSEMENT ORANGE - BOURRASQUES DE NEIGE, $forecastPlaceName/<strong><a target='_blank' style="background-color: $orangeWarnColor; color: #000;" href="$warnLink">AVERTISSEMENT ORANGE - BOURRASQUES DE NEIGE <\/a><\/strong>/g;

$fullforecast =~ s/RED WARNING - SNOW SQUALL, $forecastPlaceName/<strong><a target='_blank' style="background-color: $redWarnColor; color: #000;" href="$warnLink">RED WARNING - SNOW SQUALL<\/a><\/strong>/g;
$fullforecast =~ s/AVERTISSEMENT ROUGE - BOURRASQUES DE NEIGE, $forecastPlaceName/<strong><a target='_blank' style="background-color: $redWarnColor; color: #000;" href="$warnLink">AVERTISSEMENT ROUGE - BOURRASQUES DE NEIGE <\/a><\/strong>/g;

##COLD WARNING**
$fullforecast =~ s/YELLOW WARNING - COLD, $forecastPlaceName/<strong><a target='_blank' style="background-color: $yellowWarnColor; color: #000;" href="$warnLink">YELLOW WARNING - COLD<\/a><\/strong>/g;
$fullforecast =~ s/AVERTISSEMENT JAUNE - FROID, $forecastPlaceName/<strong><a target='_blank' style="background-color: $yellowWarnColor; color: #000;" href="$warnLink">AVERTISSEMENT JAUNE - FROID <\/a><\/strong>/g;

$fullforecast =~ s/ORANGE WARNING - COLD, $forecastPlaceName/<strong><a target='_blank' style="background-color: $orangeWarnColor; color: #000;" href="$warnLink">ORANGE WARNING - COLD<\/a><\/strong>/g;
$fullforecast =~ s/AVERTISSEMENT ORANGE - FROID, $forecastPlaceName/<strong><a target='_blank' style="background-color: $orangeWarnColor; color: #000;" href="$warnLink">AVERTISSEMENT ORANGE - FROID <\/a><\/strong>/g;

$fullforecast =~ s/RED WARNING - COLD, $forecastPlaceName/<strong><a target='_blank' style="background-color: $redWarnColor; color: #000;" href="$warnLink">RED WARNING - COLD<\/a><\/strong>/g;
$fullforecast =~ s/AVERTISSEMENT ROUGE - FROID, $forecastPlaceName/<strong><a target='_blank' style="background-color: $redWarnColor; color: #000;" href="$warnLink">AVERTISSEMENT ROUGE - FROID <\/a><\/strong>/g;


##SEVERE THUNDERSTORM WARNINGS**
$fullforecast =~ s/YELLOW WARNING - SEVERE THUNDERSTORM, $forecastPlaceName/<strong><a target='_blank' style="background-color: $yellowWarnColor; color: #000;" href="$warnLink">YELLOW WARNING - SEVERE THUNDERSTORM<\/a><\/strong>/g;


$fullforecast =~ s/ORANGE WARNING - SEVERE THUNDERSTORM, $forecastPlaceName/<strong><a target='_blank' style="background-color: $orangeWarnColor; color: #000;" href="$warnLink">ORANGE WARNING - SEVERE THUNDERSTORM<\/a><\/strong>/g;


$fullforecast =~ s/RED WARNING - SEVERE THUNDERSTORM, $forecastPlaceName/<strong><a target='_blank' style="background-color: $redWarnColor; color: #000;" href="$warnLink">RED WARNING - SEVERE THUNDERSTORM<\/a><\/strong>/g;

$fullforecast =~ s/HEAT WARNING, $forecastPlaceName/<strong><a target='_blank' style="color: $warningColor;" href="$warnLink">HEAT WARNING IN EFFECT<\/a><\/strong>/g;

##HEAT WARNINGS**
$fullforecast =~ s/YELLOW WARNING - HEAT, $forecastPlaceName/<strong><a target='_blank' style="background-color: $yellowWarnColor; color: #000;" href="$warnLink">YELLOW WARNING - HEAT<\/a><\/strong>/g;
$fullforecast =~ s/AVERTISSEMENT ROUGE - CHALEUR, $forecastPlaceName/<strong><a target='_blank' style="background-color: $redWarnColor; color: #000;" href="$warnLink">AVERTISSEMENT ROUGE - CHALEUR <\/a><\/strong>/g;


$fullforecast =~ s/ORANGE WARNING - HEAT, $forecastPlaceName/<strong><a target='_blank' style="background-color: $orangeWarnColor; color: #000;" href="$warnLink">ORANGE WARNING - HEAT<\/a><\/strong>/g;
$fullforecast =~ s/AVERTISSEMENT ROUGE - CHALEUR, $forecastPlaceName/<strong><a target='_blank' style="background-color: $redWarnColor; color: #000;" href="$warnLink">AVERTISSEMENT ROUGE - CHALEUR <\/a><\/strong>/g;


$fullforecast =~ s/RED WARNING - HEAT, $forecastPlaceName/<strong><a target='_blank' style="background-color: $redWarnColor; color: #000;" href="$warnLink">RED WARNING - HEAT<\/a><\/strong>/g;
$fullforecast =~ s/AVERTISSEMENT ROUGE - CHALEUR, $forecastPlaceName/<strong><a target='_blank' style="background-color: $redWarnColor; color: #000;" href="$warnLink">AVERTISSEMENT ROUGE - CHALEUR <\/a><\/strong>/g;




$fullforecast =~ s/No watches or warnings in effect./<strong><a target='_blank' href="$warnLink">No watches or warnings in effect.<\/a><\/strong>/g;
$fullforecast =~ s/Aucune veille ou alerte en vigueur./<strong><a target='_blank' href="$warnLink">Aucune veille ou alerte en vigueur.<\/a><\/strong>/g;

$fullforecast =~ s/Persons in or near this area should be on the lookout for adverse weather conditions and take necessary safety precautions.//g;
$fullforecast =~ s/Le public de la région concernée doit porter une attention particulière aux conditions météorologiques potentiellement dangereuses et prendre les mesures de sécurité qui s'imposent.//g;

return $fullforecast;
}

1;