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

	my ($fullforecast,$warnLink,$thunderLink,$boldDays,$textColor,$freezeDrizzleWarn,$freezeRainWarn,$freezingTemp,$nearfreezeTemp,$hotTemp,$exhotTemp,$exHumidex,$thunderWarn,$flurriesColor,$windyColor,$hRainColor,$vhRainColor,$warningColor,$endedColor,$comma,$forecastlink,$warnings,$warnings2,$warnings3,$forecastPlaceName,$forecastName,$footerMsg) = @_;

$fullforecast =~ s/No watches or warnings in effect. $forecastPlaceName//g;
$fullforecast =~ s/Aucune veille ou alerte en vigueur. $forecastPlaceName//g;

$fullforecast =~ s/SNOWFALL WARNING ENDED, $forecastPlaceName/<strong><a target='_blank' style="color: $warningColor;" href="$warnLink">SNOWFALL WARNING ENDED<\/a><\/strong>/g;
$fullforecast =~ s/WIND WARNING ENDED, $forecastPlaceName/<strong><a target='_blank' style="color: $warningColor;" href="$warnLink">WIND WARNING ENDED<\/a><\/strong>/g;
$fullforecast =~ s/RAINFALL WARNING ENDED, $forecastPlaceName/<strong><a target='_blank' style="color: $warningColor;" href="$warnLink">RAINFALL WARNING ENDED<\/a><\/strong>/g;

$fullforecast =~ s/FREEZING RAIN WARNING ENDED, $forecastPlaceName/<strong><a target='_blank' style="color: $warningColor;" href="$warnLink">FREEZING RAIN WARNING ENDED<\/a><\/strong>/g;
$fullforecast =~ s/FREEZING DRIZZLE WARNING ENDED, $forecastPlaceName/<strong><a target='_blank' style="color: $warningColor;" href="$warnLink">FREEZING DRIZZLE WARNING ENDED<\/a><\/strong>/g;

$fullforecast =~ s/WINTER STORM WARNING ENDED, $forecastPlaceName/<strong><a target='_blank' style="color: $warningColor;" href="$warnLink">WINTER STORM ENDED<\/a><\/strong>/g;

$fullforecast =~ s/WIND WARNING, $forecastPlaceName/<strong><a target="_blank" style="color: $warningColor;" href="$warnLink">WIND WARNING IN EFFECT<\/a><\/strong>/g;
$fullforecast =~ s/AVERTISSEMENT DE VENT , $forecastPlaceName/<strong><a target="_blank" style="color: $warningColor;" href="$warnLink">AVERTISSEMENT DE VENT <\/a><\/strong>/g;

$fullforecast =~ s/AVERTISSEMENT DE PLUIE VERGLAÇANTE, $forecastPlaceName/<strong><a target='_blank' style="color: $warningColor;" href="$warnLink">AVERTISSEMENT DE PLUIE VERGLAÇANTE<\/a><\/strong>/g;

$fullforecast =~ s/FREEZING DRIZZLE WARNING, $forecastPlaceName/<strong><a target='_blank' style="color: $warningColor;" href="$warnLink">FREEZING DRIZZLE WARNING IN EFFECT<\/a><\/strong>/g;

$fullforecast =~ s/AVERTISSEMENT DE PLUIE VERGLAÇANTE, $forecastPlaceName/<strong><a target='_blank' style="color: $warningColor;" href="$warnLink">AVERTISSEMENT DE PLUIE VERGLAÇANTE<\/a><\/strong>/g;

$fullforecast =~ s/FREEZING DRIZZLE WARNING, $forecastPlaceName/<strong><a target='_blank' style="color: $warningColor;" href="$warnLink">FREEZING DRIZZLE WARNING IN EFFECT<\/a><\/strong>/g;


$fullforecast =~ s/WINTER STORM WARNING, $forecastPlaceName/<strong><a target='_blank' style="color: $warningColor;" href="$warnLink">WINTER STORM WARNING IN EFFECT<\/a><\/strong>/g;
$fullforecast =~ s/AVERTISSEMENT DE TEMPÊTE HIVERNALE, $forecastPlaceName/<strong><a target='_blank' style="color: $warningColor;" href="$warnLink">AVERTISSEMENT DE TEMPÊTE HIVERNALE<\/a><\/strong>/g;

$fullforecast =~ s/WINTER STORM WATCH, $forecastPlaceName/<strong><a target='_blank' style="color: $warningColor;" href="$warnLink">WINTER STORM WATCH IN EFFECT<\/a><\/strong>/g;

$fullforecast =~ s/EXTREME COLD WARNING, $forecastPlaceName/<strong><a target='_blank' style="color: $warningColor;" href="$warnLink">EXTREME COLD WARNING<\/a><\/strong>/g;
$fullforecast =~ s/AVERTISSEMENT DE FROID EXTRÊME, $forecastPlaceName/<strong><a target='_blank' style="color: $warningColor;" href="$warnLink">AVERTISSEMENT DE FROID EXTRÊME <\/a><\/strong>/g;


$fullforecast =~ s/RAINFALL WARNING, $forecastPlaceName/<strong><a target='_blank' style="color: $warningColor;" href="$warnLink">RAINFALL WARNING IN EFFECT<\/a><\/strong>/g;
$fullforecast =~ s/AVERTISSEMENT DE PLUIE , $forecastPlaceName/<strong><a target='_blank' style="color: $warningColor;" href="$warnLink">AVERTISSEMENT DE PLUIE <\/a><\/strong>/g;


$fullforecast =~ s/SNOWFALL WARNING, $forecastPlaceName/<strong><a target='_blank' style="color: $warningColor;" href="$warnLink">SNOWFALL WARNING IN EFFECT<\/a><\/strong>/g;
$fullforecast =~ s/AVERTISSEMENT DE NEIGE, $forecastPlaceName/<strong><a target='_blank' style="color: $warningColor;" href="$warnLink">AVERTISSEMENT DE NEIGE <\/a><\/strong>/g;

$fullforecast =~ s/SPECIAL WEATHER STATEMENT, $forecastPlaceName/<strong ><a target='_blank' style="color: $warningColor;" href="$warnLink">SPECIAL WEATHER STATEMENT IN EFFECT<\/a><\/strong>/g;
$fullforecast =~ s/BULLETIN MÉTÉOROLOGIQUE SPECIAL, $forecastPlaceName/<strong ><a target='_blank' style="color: $warningColor;" href="$warnLink">BULLETIN MÉTÉOROLOGIQUE SPÉCIAL<\/a><\/strong>/g;


$fullforecast =~ s/SPECIAL AIR QUALITY STATEMENT, $forecastPlaceName/<strong><a target='_blank' style="color: $warningColor;" href="$warnLink">SPECIAL AIR QUALITY STATEMENT IN EFFECT<\/a><\/strong>/g;
$fullforecast =~ s/SEVERE THUNDERSTORM WATCH, $forecastPlaceName/<strong><a target='_blank' style="color: $warningColor;" href="$warnLink">SEVERE THUNDERSTORM WATCH IN EFFECT<\/a><\/strong>/g;
$fullforecast =~ s/SEVERE THUNDERSTORM WARNING, $forecastPlaceName/<strong><a target='_blank' style="color: $warningColor;" href="$warnLink">SEVERE THUNDERSTORM WARNING IN EFFECT<\/a><\/strong>/g;
$fullforecast =~ s/HEAT WARNING, $forecastPlaceName/<strong><a target='_blank' style="color: $warningColor;" href="$warnLink">HEAT WARNING IN EFFECT<\/a><\/strong>/g;

$fullforecast =~ s/FOG ADVISORY, $forecastPlaceName/<strong><a target='_blank' style="color: $warningColor;"  href="$warnLink">FOG ADVISORY IN EFFECT<\/a><\/strong>/g;
$fullforecast =~ s/SMOG WARNING, $forecastPlaceName/<strong><a target='_blank' style="color: $warningColor;" href="$warnLink">SMOG WARNING<\/a><\/strong>/g;


$fullforecast =~ s/No watches or warnings in effect./<strong><a target='_blank' href="$warnLink">No watches or warnings in effect.<\/a><\/strong>/g;
$fullforecast =~ s/Aucune veille ou alerte en vigueur./<strong><a target='_blank' href="$warnLink">Aucune veille ou alerte en vigueur.<\/a><\/strong>/g;

$fullforecast =~ s/Persons in or near this area should be on the lookout for adverse weather conditions and take necessary safety precautions.//g;
$fullforecast =~ s/Le public de la région concernée doit porter une attention particulière aux conditions météorologiques potentiellement dangereuses et prendre les mesures de sécurité qui s'imposent.//g;

return $fullforecast;
}

1;