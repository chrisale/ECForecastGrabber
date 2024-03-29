#!/usr/bin/perl
# use moduleuse XML::Simple;
package ECFGGeneral;
use XML::Simple;
use Data::Dumper;
use HTTP::Date;
use utf8;
use Encode;
use Exporter;

our @ISA= qw(Exporter);

# these CAN be exported.
our @EXPORT_OK = qw( general_weather );

# these are exported by default.
our @EXPORT = qw( general_weather );

sub general_weather {
#print "hello";

	my ($fullforecast,$warnLink,$thunderLink,$boldDays,$textColor,$freezeDrizzleWarn,$freezeRainWarn,$freezingTemp,$nearfreezeTemp,$hotTemp,$exhotTemp,$exHumidex,$thunderWarn,$flurriesColor,$windyColor,$hRainColor,$vhRainColor,$warningColor,$endedColor,$comma,$forecastlink,$warnings,$warnings2,$warnings3,$forecastPlaceName,$forecastName,$footerMsg,$mainStyleElement,$daystrongStyle,$drizzstrongStyle,$frainstrongStyle,$flurstrongStyle,$snowflstrongStyle,$snowstrongStyle,$ftempstrongStyle,$htempstrongStyle,$thunderstrongStyle) = @_;

#GENERAL WEATHER TERMS
$fullforecast =~ s/Forecast issued/ Forecast Issued/g;
$fullforecast =~ s/Prévisions émises/ Prévisions Émises/g;
$fullforecast =~ s/Tomorrow/ <strong $daystrongStyle > Tomorrow<\/strong>/g;
$fullforecast =~ s/Ce soir et cette nuit/ <strong $daystrongStyle > Ce soir et cette nuit<\/strong>/g;
$fullforecast =~ s/Night:/<strong $daystrongStyle > Night:<\/strong>/g;
$fullforecast =~ s/Monday:/<strong $daystrongStyle > Monday:<\/strong>/g;
$fullforecast =~ s/Lundi:/<strong $daystrongStyle > Lundi:<\/strong>/g;
$fullforecast =~ s/Monday night:/<strong $daystrongStyle > Monday night:<\/strong>/g;
$fullforecast =~ s/Lundi soir et nuit:/<strong $daystrongStyle > Lundi soir et nuit:<\/strong>/g;
$fullforecast =~ s/Tuesday:/<strong $daystrongStyle > Tuesday:<\/strong>/g;
$fullforecast =~ s/Mardi:/<strong $daystrongStyle > Mardi:<\/strong>/g;
$fullforecast =~ s/Tuesday night:/<strong $daystrongStyle > Tuesday night:<\/strong>/g;
$fullforecast =~ s/Mardi soir et nuit:/<strong $daystrongStyle > Mardi soir et nuit:<\/strong>/g;
$fullforecast =~ s/Wednesday:/<strong $daystrongStyle > Wednesday:<\/strong>/g;
$fullforecast =~ s/Mercredi:/<strong $daystrongStyle > Mercredi:<\/strong>/g;
$fullforecast =~ s/Wednesday night:/<strong $daystrongStyle > Wednesday night:<\/strong>/g;
$fullforecast =~ s/Mercredi soir et nuit:/<strong $daystrongStyle > Mercredi soir et nuit:<\/strong>/g;
$fullforecast =~ s/Thursday:/<strong $daystrongStyle > Thursday:<\/strong>/g;
$fullforecast =~ s/Jeudi:/<strong $daystrongStyle > Jeudi:<\/strong>/g;
$fullforecast =~ s/Thursday night:/<strong $daystrongStyle > Thursday night:<\/strong>/g;
$fullforecast =~ s/Jeudi soir et nuit:/<strong $daystrongStyle > Jeudi soir et nuitt:<\/strong>/g;
$fullforecast =~ s/Friday:/<strong $daystrongStyle > Friday:<\/strong>/g;
$fullforecast =~ s/Vendredi:/<strong $daystrongStyle > Vendredi:<\/strong>/g;
$fullforecast =~ s/Friday night:/<strong $daystrongStyle > Friday night:<\/strong>/g;
$fullforecast =~ s/Vendredi soir et nuit:/<strong $daystrongStyle > Vendredi soir et nuit:<\/strong>/g;
$fullforecast =~ s/Saturday:/<strong $daystrongStyle > Saturday:<\/strong>/g;
$fullforecast =~ s/Samedi:/<strong $daystrongStyle > Samedi:<\/strong>/g;
$fullforecast =~ s/Saturday night:/<strong $daystrongStyle > Saturday night:<\/strong>/g;
$fullforecast =~ s/Samedi soir et nuit:/<strong $daystrongStyle > Samedi soir et nuit:<\/strong>/g;
$fullforecast =~ s/Sunday:/<strong $daystrongStyle > Sunday:<\/strong>/g;
$fullforecast =~ s/Dimanche:/<strong $daystrongStyle > Dimanche:<\/strong>/g;
$fullforecast =~ s/Sunday night:/<strong $daystrongStyle > Sunday night:<\/strong>/g;
$fullforecast =~ s/Dimanche soir et nuit:/<strong $daystrongStyle > Dimanche soir et nuit:<\/strong>/g;

$fullforecast =~ s/thunderstorms/<a href="$thunderLink"  target="_blank"><strong style="color:
$thunderWarn">thunderstorms<\/strong><\/a>/g;
$fullforecast =~ s/thunderstorm/<a href="$thunderLink" target="_blank"><strong style="color: $thunderWarn">thunderstorm<\/strong><\/a>/g;
$fullforecast =~ s/thundershowers/<a href="$thunderLink"  target="_blank"><strong style="color: $thunderWarn">thundershowers<\/strong><\/a>/g;
$fullforecast =~ s/thundershower/<a href="$thunderLink"  target="_blank"><strong style="color: $thunderWarn">thundershower<\/strong><\/a>/g;

$fullforecast =~ s/orages/<a href="$thunderLink"  target="_blank"><strong style="color: $thunderWarn">orages<\/strong><\/a>/g;
$fullforecast =~ s/orage/<a href="$thunderLink" target="_blank"><strong style="color: $thunderWarn">orage<\/strong><\/a>/g;
$fullforecast =~ s/Orages/<a href="$thunderLink" target="_blank"><strong style="color: $thunderWarn">Orages<\/strong><\/a>/g;
$fullforecast =~ s/Orage/<a href="$thunderLink" target="_blank"><strong style="color: $thunderWarn">Orage<\/strong><\/a>/g;


$fullforecast =~ s/Normals/<strong> Normals:<\/strong>/g;

#COLD STUFF
$fullforecast =~ s/Freezing drizzle/<strong $drizzstrongStyle >Freezing drizzle<\/strong>/g;
$fullforecast =~ s/freezing drizzle/<strong $drizzstrongStyle >freezing drizzle<\/strong>/g;
$fullforecast =~ s/Freezing rain/<strong $frainstrongStyle >Freezing rain<\/strong>/g;
$fullforecast =~ s/freezing rain/<strong $frainstrongStyle >freezing rain<\/strong>/g;
$fullforecast =~ s/Pluie verglaçante/<strong $frainstrongStyle >Pluie verglaçante<\/strong>/g;
$fullforecast =~ s/pluie verglaçante/<strong $frainstrongStyle >pluie verglaçante<\/strong>/g;
$fullforecast =~ s/Flurries/<strong $flurstrongStyle >Flurries<\/strong>/g;
$fullforecast =~ s/flurries/<strong $flurstrongStyle >flurries<\/strong>/g;
$fullforecast =~ s/Averses de neige/<strong $flurstrongStyle >Averses de neige<\/strong>/g;
$fullforecast =~ s/d\'averses de neige/<strong $flurstrongStyle >d\'averses de neige<\/strong>/g;
$fullforecast =~ s/Snowfall/<strong $snowflstrongStyle >Snowfall<\/strong>/g;
$fullforecast =~ s/snowfall/<strong $snowflstrongStyle >snowfall<\/strong>/g;
$fullforecast =~ s/Snow/<strong $snowstrongStyle >Snow<\/strong>/g;
$fullforecast =~ s/snow/<strong $snowstrongStyle >snow<\/strong>/g;
$fullforecast =~ s/Neige/<strong $snowstrongStyle >Neige<\/strong>/g;
$fullforecast =~ s/neige/<strong $snowstrongStyle >neige<\/strong>/g;
$fullforecast =~ s/plus 1/<strong style="color: $nearfreezeTemp">plus 1<\/strong>/g;
$fullforecast =~ s/Low 0/<strong style="color: $nearfreezeTemp">Low 0<\/strong>/g;
$fullforecast =~ s/low 0/<strong style="color: $nearfreezeTemp">low 0<\/strong>/g;
$fullforecast =~ s/Minimum 0/<strong style="color: $nearfreezeTemp">Minimum 0<\/strong>/g;
$fullforecast =~ s/minimum 0/<strong style="color: $nearfreezeTemp">minimum 0<\/strong>/g;
$fullforecast =~ s/High 0/<strong style="color: $nearfreezeTemp">High 0<\/strong>/g;
$fullforecast =~ s/high 0/<strong style="color: $nearfreezeTemp">high 0<\/strong>/g;
$fullforecast =~ s/Maximum 0/<strong style="color: $nearfreezeTemp">Maximum 0<\/strong>/g;
$fullforecast =~ s/maximum 0/<strong style="color: $nearfreezeTemp">maximum 0<\/strong>/g;
$fullforecast =~ s/Low zero/<strong style="color: $nearfreezeTemp">Low zero<\/strong>/g;
$fullforecast =~ s/low zero/<strong style="color: $nearfreezeTemp">low zero<\/strong>/g;
$fullforecast =~ s/Minimum zéro/<strong style="color: $nearfreezeTemp">Minimum zéro<\/strong>/g;
$fullforecast =~ s/minimum zéro/<strong style="color: $nearfreezeTemp">minimum zéro<\/strong>/g;
$fullforecast =~ s/High zero/<strong style="color: $nearfreezeTemp">High zero<\/strong>/g;
$fullforecast =~ s/high zero/<strong style="color: $nearfreezeTemp">high zero<\/strong>/g;
$fullforecast =~ s/Maximum zéro/<strong style="color: $nearfreezeTemp">Maximum zéro<\/strong>/g;
$fullforecast =~ s/maximum zéro/<strong style="color: $nearfreezeTemp">maximum zéro<\/strong>/g;
$fullforecast =~ s/minus 1\./<strong style="color: $nearfreezeTemp">minus 1<\/strong>\./g;
$fullforecast =~ s/minus 2\./<strong style="color: $freezingTemp">minus 2<\/strong>\./g;
$fullforecast =~ s/minus 3\./<strong style="color: $freezingTemp">minus 3<\/strong>\./g;
$fullforecast =~ s/minus 4\./<strong style="color: $freezingTemp">minus 4<\/strong>\./g;
$fullforecast =~ s/minus 5\./<strong style="color: $freezingTemp">minus 5<\/strong>\./g;
$fullforecast =~ s/minus 6\./<strong style="color: $nearfreezeTemp">minus 6<\/strong>\./g;
$fullforecast =~ s/minus 7\./<strong style="color: $freezingTemp">minus 7<\/strong>\./g;
$fullforecast =~ s/minus 8\./<strong style="color: $freezingTemp">minus 8<\/strong>\./g;
$fullforecast =~ s/minus 9\./<strong style="color: $freezingTemp">minus 9<\/strong>\./g;
$fullforecast =~ s/minus 1 /<strong style="color: $nearfreezeTemp;">minus 1 <\/strong>/g;
$fullforecast =~ s/minus 2 /<strong style="color: $freezingTemp;">minus 2 <\/strong>/g;
$fullforecast =~ s/minus 3 /<strong style="color: $freezingTemp;">minus 3 <\/strong>/g;
$fullforecast =~ s/minus 4 /<strong style="color: $freezingTemp;">minus 4 <\/strong>/g;
$fullforecast =~ s/minus 5 /<strong style="color: $freezingTemp;">minus 5 <\/strong>/g;
$fullforecast =~ s/minus 6 /<strong style="color: $freezingTemp;">minus 6 <\/strong>/g;
$fullforecast =~ s/minus 7 /<strong style="color: $freezingTemp;">minus 7 <\/strong>/g;
$fullforecast =~ s/minus 8 /<strong style="color: $freezingTemp;">minus 8 <\/strong>/g;
$fullforecast =~ s/minus 9 /<strong style="color: $freezingTemp;">minus 9 <\/strong>/g;
$fullforecast =~ s/minus 10/<strong style="color: $freezingTemp;">minus 10<\/strong>/g;
$fullforecast =~ s/minus 11/<strong style="color: $freezingTemp;">minus 11<\/strong>/g;
$fullforecast =~ s/minus 12/<strong style="color: $freezingTemp;">minus 12<\/strong>/g;
$fullforecast =~ s/minus 13/<strong style="color: $freezingTemp;">minus 13<\/strong>/g;
$fullforecast =~ s/minus 14/<strong style="color: $freezingTemp;">minus 14<\/strong>/g;
$fullforecast =~ s/minus 15/<strong style="color: $freezingTemp;">minus 15<\/strong>/g;
$fullforecast =~ s/minus 16/<strong style="color: $freezingTemp;">minus 16<\/strong>/g;
$fullforecast =~ s/minus 17/<strong style="color: $freezingTemp;">minus 17<\/strong>/g;
$fullforecast =~ s/minus 18/<strong style="color: $freezingTemp;">minus 18<\/strong>/g;
$fullforecast =~ s/minus 19/<strong style="color: $freezingTemp;">minus 19<\/strong>/g;
$fullforecast =~ s/minus 20/<strong style="color: $freezingTemp;">minus 20<\/strong>/g;
$fullforecast =~ s/minus 21/<strong style="color: $freezingTemp;">minus 21<\/strong>/g;
$fullforecast =~ s/minus 22/<strong style="color: $freezingTemp;">minus 22<\/strong>/g;
$fullforecast =~ s/minus 23/<strong style="color: $freezingTemp;">minus 23<\/strong>/g;
$fullforecast =~ s/minus 24/<strong style="color: $freezingTemp;">minus 24<\/strong>/g;
$fullforecast =~ s/minus 25/<strong style="color: $freezingTemp;">minus 25<\/strong>/g;
$fullforecast =~ s/minus 26/<strong style="color: $freezingTemp;">minus 26<\/strong>/g;
$fullforecast =~ s/minus 27/<strong style="color: $freezingTemp;">minus 27<\/strong>/g;
$fullforecast =~ s/minus 28/<strong style="color: $freezingTemp;">minus 28<\/strong>/g;
$fullforecast =~ s/minus 29/<strong style="color: $freezingTemp;">minus 29<\/strong>/g;
$fullforecast =~ s/minus 30/<strong style="color: $freezingTemp;">minus 30<\/strong>/g;
$fullforecast =~ s/minus 31/<strong style="color: $freezingTemp;">minus 31<\/strong>/g;
$fullforecast =~ s/minus 32/<strong style="color: $freezingTemp;">minus 32<\/strong>/g;
$fullforecast =~ s/minus 33/<strong style="color: $freezingTemp;">minus 33<\/strong>/g;
$fullforecast =~ s/minus 34/<strong style="color: $freezingTemp;">minus 34<\/strong>/g;
$fullforecast =~ s/minus 35/<strong style="color: $freezingTemp;">minus 35<\/strong>/g;
$fullforecast =~ s/minus 36/<strong style="color: $freezingTemp;">minus 36<\/strong>/g;
$fullforecast =~ s/minus 37/<strong style="color: $freezingTemp;">minus 37<\/strong>/g;
$fullforecast =~ s/minus 38/<strong style="color: $freezingTemp;">minus 38<\/strong>/g;
$fullforecast =~ s/minus 39/<strong style="color: $freezingTemp;">minus 39<\/strong>/g;
$fullforecast =~ s/minus 40/<strong style="color: $freezingTemp;">minus 40<\/strong>/g;

$fullforecast =~ s/moins 1\./<strong style="color: $nearfreezeTemp">moins 1<\/strong>\./g;
$fullforecast =~ s/moins 2\./<strong style="color: $freezingTemp">moins 2<\/strong>\./g;
$fullforecast =~ s/moins 3\./<strong style="color: $freezingTemp">moins 3<\/strong>\./g;
$fullforecast =~ s/moins 4\./<strong style="color: $freezingTemp">moins 4<\/strong>\./g;
$fullforecast =~ s/moins 5\./<strong style="color: $freezingTemp">moins 5<\/strong>\./g;
$fullforecast =~ s/moins 6\./<strong style="color: $nearfreezeTemp">moins 6<\/strong>\./g;
$fullforecast =~ s/moins 7\./<strong style="color: $freezingTemp">moins 7<\/strong>\./g;
$fullforecast =~ s/moins 8\./<strong style="color: $freezingTemp">moins 8<\/strong>\./g;
$fullforecast =~ s/moins 9\./<strong style="color: $freezingTemp">moins 9<\/strong>\./g;
$fullforecast =~ s/moins 1 /<strong style="color: $nearfreezeTemp;">moins 1 <\/strong>/g;
$fullforecast =~ s/moins 2 /<strong style="color: $freezingTemp;">moins 2 <\/strong>/g;
$fullforecast =~ s/moins 3 /<strong style="color: $freezingTemp;">moins 3 <\/strong>/g;
$fullforecast =~ s/moins 4 /<strong style="color: $freezingTemp;">moins 4 <\/strong>/g;
$fullforecast =~ s/moins 5 /<strong style="color: $freezingTemp;">moins 5 <\/strong>/g;
$fullforecast =~ s/moins 6 /<strong style="color: $freezingTemp;">moins 6 <\/strong>/g;
$fullforecast =~ s/moins 7 /<strong style="color: $freezingTemp;">moins 7 <\/strong>/g;
$fullforecast =~ s/moins 8 /<strong style="color: $freezingTemp;">moins 8 <\/strong>/g;
$fullforecast =~ s/moins 9 /<strong style="color: $freezingTemp;">moins 9 <\/strong>/g;
$fullforecast =~ s/moins 10/<strong style="color: $freezingTemp;">moins 10<\/strong>/g;
$fullforecast =~ s/moins 11/<strong style="color: $freezingTemp;">moins 11<\/strong>/g;
$fullforecast =~ s/moins 12/<strong style="color: $freezingTemp;">moins 12<\/strong>/g;
$fullforecast =~ s/moins 13/<strong style="color: $freezingTemp;">moins 13<\/strong>/g;
$fullforecast =~ s/moins 14/<strong style="color: $freezingTemp;">moins 14<\/strong>/g;
$fullforecast =~ s/moins 15/<strong style="color: $freezingTemp;">moins 15<\/strong>/g;
$fullforecast =~ s/moins 16/<strong style="color: $freezingTemp;">moins 16<\/strong>/g;
$fullforecast =~ s/moins 17/<strong style="color: $freezingTemp;">moins 17<\/strong>/g;
$fullforecast =~ s/moins 18/<strong style="color: $freezingTemp;">moins 18<\/strong>/g;
$fullforecast =~ s/moins 19/<strong style="color: $freezingTemp;">moins 19<\/strong>/g;
$fullforecast =~ s/moins 20/<strong style="color: $freezingTemp;">moins 20<\/strong>/g;
$fullforecast =~ s/moins 21/<strong style="color: $freezingTemp;">moins 21<\/strong>/g;
$fullforecast =~ s/moins 22/<strong style="color: $freezingTemp;">moins 22<\/strong>/g;
$fullforecast =~ s/moins 23/<strong style="color: $freezingTemp;">moins 23<\/strong>/g;
$fullforecast =~ s/moins 24/<strong style="color: $freezingTemp;">moins 24<\/strong>/g;
$fullforecast =~ s/moins 25/<strong style="color: $freezingTemp;">moins 25<\/strong>/g;
$fullforecast =~ s/moins 26/<strong style="color: $freezingTemp;">moins 26<\/strong>/g;
$fullforecast =~ s/moins 27/<strong style="color: $freezingTemp;">moins 27<\/strong>/g;
$fullforecast =~ s/moins 28/<strong style="color: $freezingTemp;">moins 28<\/strong>/g;
$fullforecast =~ s/moins 29/<strong style="color: $freezingTemp;">moins 29<\/strong>/g;
$fullforecast =~ s/moins 30/<strong style="color: $freezingTemp;">moins 30<\/strong>/g;
$fullforecast =~ s/moins 31/<strong style="color: $freezingTemp;">moins 31<\/strong>/g;
$fullforecast =~ s/moins 32/<strong style="color: $freezingTemp;">moins 32<\/strong>/g;
$fullforecast =~ s/moins 33/<strong style="color: $freezingTemp;">moins 33<\/strong>/g;
$fullforecast =~ s/moins 34/<strong style="color: $freezingTemp;">moins 34<\/strong>/g;
$fullforecast =~ s/moins 35/<strong style="color: $freezingTemp;">moins 35<\/strong>/g;
$fullforecast =~ s/moins 36/<strong style="color: $freezingTemp;">moins 36<\/strong>/g;
$fullforecast =~ s/moins 37/<strong style="color: $freezingTemp;">moins 37<\/strong>/g;
$fullforecast =~ s/moins 38/<strong style="color: $freezingTemp;">moins 38<\/strong>/g;
$fullforecast =~ s/moins 39/<strong style="color: $freezingTemp;">moins 39<\/strong>/g;
$fullforecast =~ s/moins 40/<strong style="color: $freezingTemp;">moins 40<\/strong>/g;




#HOT STUFF
$fullforecast =~ s/High 30/<strong style="color: $hotTemp">High 30<\/strong>/g;
$fullforecast =~ s/High 31/<strong style="color: $hotTemp">High 31<\/strong>/g;
$fullforecast =~ s/High 32/<strong style="color: $hotTemp">High 32<\/strong>/g;
$fullforecast =~ s/High 33/<strong style="color: $hotTemp">High 33<\/strong>/g;
$fullforecast =~ s/High 34/<strong style="color: $hotTemp">High 34<\/strong>/g;
$fullforecast =~ s/High 35/<strong style="color: $hotTemp">High 35<\/strong>/g;
$fullforecast =~ s/High 36/<strong style="color: $hotTemp">High 36<\/strong>/g;
$fullforecast =~ s/High 37/<strong style="color: $hotTemp">High 37<\/strong>/g;
$fullforecast =~ s/High 38/<strong style="color: $hotTemp">High 38<\/strong>/g;
$fullforecast =~ s/High 39/<strong style="color: $hotTemp">High 39<\/strong>/g;
$fullforecast =~ s/High 40/<strong style="color: $exhotTemp">High 40<\/strong>/g;
$fullforecast =~ s/High 41/<strong style="color: $exhotTemp">High 41<\/strong>/g;
$fullforecast =~ s/High 42/<strong style="color: $exhotTemp">High 42<\/strong>/g;
$fullforecast =~ s/High 43/<strong style="color: $exhotTemp">High 43<\/strong>/g;
$fullforecast =~ s/High 44/<strong style="color: $exhotTemp">High 44<\/strong>/g;
$fullforecast =~ s/High 45/<strong style="color: $exhotTemp">High 45<\/strong>/g;
$fullforecast =~ s/High 46/<strong style="color: $exhotTemp">High 46<\/strong>/g;
$fullforecast =~ s/High 47/<strong style="color: $exhotTemp">High 47<\/strong>/g;
$fullforecast =~ s/High 48/<strong style="color: $exhotTemp">High 48<\/strong>/g;
$fullforecast =~ s/High 49/<strong style="color: $exhotTemp">High 49<\/strong>/g;
$fullforecast =~ s/High 50/<strong style="color: $exhotTemp">High 50<\/strong>/g;
$fullforecast =~ s/High 51/<strong style="color: $exhotTemp">High 51<\/strong>/g;

$fullforecast =~ s/high 30/<strong style="color: $hotTemp">high 30<\/strong>/g;
$fullforecast =~ s/high 31/<strong style="color: $hotTemp">high 31<\/strong>/g;
$fullforecast =~ s/high 32/<strong style="color: $hotTemp">high 32<\/strong>/g;
$fullforecast =~ s/high 33/<strong style="color: $hotTemp">high 33<\/strong>/g;
$fullforecast =~ s/high 34/<strong style="color: $hotTemp">high 34<\/strong>/g;
$fullforecast =~ s/high 35/<strong style="color: $hotTemp">high 35<\/strong>/g;
$fullforecast =~ s/high 36/<strong style="color: $hotTemp">high 36<\/strong>/g;
$fullforecast =~ s/high 37/<strong style="color: $hotTemp">high 37<\/strong>/g;
$fullforecast =~ s/high 38/<strong style="color: $hotTemp">high 38<\/strong>/g;
$fullforecast =~ s/high 39/<strong style="color: $hotTemp">high 39<\/strong>/g;
$fullforecast =~ s/high 40/<strong style="color: $exhotTemp">high 40<\/strong>/g;
$fullforecast =~ s/high 41/<strong style="color: $exhotTemp">high 41<\/strong>/g;
$fullforecast =~ s/high 42/<strong style="color: $exhotTemp">high 42<\/strong>/g;
$fullforecast =~ s/high 43/<strong style="color: $exhotTemp">high 43<\/strong>/g;
$fullforecast =~ s/high 44/<strong style="color: $exhotTemp">high 44<\/strong>/g;
$fullforecast =~ s/high 45/<strong style="color: $exhotTemp">high 45<\/strong>/g;
$fullforecast =~ s/high 46/<strong style="color: $exhotTemp">high 46<\/strong>/g;
$fullforecast =~ s/high 47/<strong style="color: $exhotTemp">high 47<\/strong>/g;
$fullforecast =~ s/high 48/<strong style="color: $exhotTemp">high 48<\/strong>/g;
$fullforecast =~ s/high 49/<strong style="color: $exhotTemp">high 49<\/strong>/g;
$fullforecast =~ s/high 50/<strong style="color: $exhotTemp">high 50<\/strong>/g;
$fullforecast =~ s/high 51/<strong style="color: $exhotTemp">high 51<\/strong>/g;

$fullforecast =~ s/Maximum 30/<strong style="color: $hotTemp">Maximum 30<\/strong>/g;
$fullforecast =~ s/Maximum 31/<strong style="color: $hotTemp">Maximum 31<\/strong>/g;
$fullforecast =~ s/Maximum 32/<strong style="color: $hotTemp">Maximum 32<\/strong>/g;
$fullforecast =~ s/Maximum 33/<strong style="color: $hotTemp">Maximum 33<\/strong>/g;
$fullforecast =~ s/Maximum 34/<strong style="color: $hotTemp">Maximum 34<\/strong>/g;
$fullforecast =~ s/Maximum 35/<strong style="color: $hotTemp">Maximum 35<\/strong>/g;
$fullforecast =~ s/Maximum 36/<strong style="color: $hotTemp">Maximum 36<\/strong>/g;
$fullforecast =~ s/Maximum 37/<strong style="color: $hotTemp">Maximum 37<\/strong>/g;
$fullforecast =~ s/Maximum 38/<strong style="color: $hotTemp">Maximum 38<\/strong>/g;
$fullforecast =~ s/Maximum 39/<strong style="color: $hotTemp">Maximum 39<\/strong>/g;
$fullforecast =~ s/Maximum 40/<strong style="color: $exhotTemp">Maximum 40<\/strong>/g;
$fullforecast =~ s/Maximum 41/<strong style="color: $exhotTemp">Maximum 41<\/strong>/g;
$fullforecast =~ s/Maximum 42/<strong style="color: $exhotTemp">Maximum 42<\/strong>/g;
$fullforecast =~ s/Maximum 43/<strong style="color: $exhotTemp">Maximum 43<\/strong>/g;
$fullforecast =~ s/Maximum 44/<strong style="color: $exhotTemp">Maximum 44<\/strong>/g;
$fullforecast =~ s/Maximum 45/<strong style="color: $exhotTemp">Maximum 45<\/strong>/g;
$fullforecast =~ s/Maximum 46/<strong style="color: $exhotTemp">Maximum 46<\/strong>/g;
$fullforecast =~ s/Maximum 47/<strong style="color: $exhotTemp">Maximum 47<\/strong>/g;
$fullforecast =~ s/Maximum 48/<strong style="color: $exhotTemp">Maximum 48<\/strong>/g;
$fullforecast =~ s/Maximum 49/<strong style="color: $exhotTemp">Maximum 49<\/strong>/g;
$fullforecast =~ s/Maximum 50/<strong style="color: $exhotTemp">Maximum 50<\/strong>/g;
$fullforecast =~ s/Maximum 51/<strong style="color: $exhotTemp">Maximum 51<\/strong>/g;

$fullforecast =~ s/maximum 30/<strong style="color: $hotTemp">maximum 30<\/strong>/g;
$fullforecast =~ s/maximum 31/<strong style="color: $hotTemp">maximum 31<\/strong>/g;
$fullforecast =~ s/maximum 32/<strong style="color: $hotTemp">maximum 32<\/strong>/g;
$fullforecast =~ s/maximum 33/<strong style="color: $hotTemp">maximum 33<\/strong>/g;
$fullforecast =~ s/maximum 34/<strong style="color: $hotTemp">maximum 34<\/strong>/g;
$fullforecast =~ s/maximum 35/<strong style="color: $hotTemp">maximum 35<\/strong>/g;
$fullforecast =~ s/maximum 36/<strong style="color: $hotTemp">maximum 36<\/strong>/g;
$fullforecast =~ s/maximum 37/<strong style="color: $hotTemp">maximum 37<\/strong>/g;
$fullforecast =~ s/maximum 38/<strong style="color: $hotTemp">maximum 38<\/strong>/g;
$fullforecast =~ s/maximum 39/<strong style="color: $hotTemp">maximum 39<\/strong>/g;
$fullforecast =~ s/maximum 40/<strong style="color: $exhotTemp">maximum 40<\/strong>/g;
$fullforecast =~ s/maximum 41/<strong style="color: $exhotTemp">maximum 41<\/strong>/g;
$fullforecast =~ s/maximum 42/<strong style="color: $exhotTemp">maximum 42<\/strong>/g;
$fullforecast =~ s/maximum 43/<strong style="color: $exhotTemp">maximum 43<\/strong>/g;
$fullforecast =~ s/maximum 44/<strong style="color: $exhotTemp">maximum 44<\/strong>/g;
$fullforecast =~ s/maximum 45/<strong style="color: $exhotTemp">maximum 45<\/strong>/g;
$fullforecast =~ s/maximum 46/<strong style="color: $exhotTemp">maximum 46<\/strong>/g;
$fullforecast =~ s/maximum 47/<strong style="color: $exhotTemp">maximum 47<\/strong>/g;
$fullforecast =~ s/maximum 48/<strong style="color: $exhotTemp">maximum 48<\/strong>/g;
$fullforecast =~ s/maximum 49/<strong style="color: $exhotTemp">maximum 49<\/strong>/g;
$fullforecast =~ s/maximum 50/<strong style="color: $exhotTemp">maximum 50<\/strong>/g;
$fullforecast =~ s/maximum 51/<strong style="color: $exhotTemp">maximum 51<\/strong>/g;

$fullforecast =~ s/Humidex 40/<strong style="color: $exHumidex">Humidex 40<\/strong>/g;
$fullforecast =~ s/Humidex 41/<strong style="color: $exHumidex">Humidex 41<\/strong>/g;
$fullforecast =~ s/Humidex 42/<strong style="color: $exHumidex">Humidex 42<\/strong>/g;
$fullforecast =~ s/Humidex 43/<strong style="color: $exHumidex">Humidex 43<\/strong>/g;
$fullforecast =~ s/Humidex 44/<strong style="color: $exHumidex">Humidex 44<\/strong>/g;
$fullforecast =~ s/Humidex 45/<strong style="color: $exHumidex">Humidex 45<\/strong>/g;
$fullforecast =~ s/Humidex 46/<strong style="color: $exHumidex">Humidex 46<\/strong>/g;
$fullforecast =~ s/Humidex 47/<strong style="color: $exHumidex">Humidex 47<\/strong>/g;
$fullforecast =~ s/Humidex 48/<strong style="color: $exHumidex">Humidex 48<\/strong>/g;
$fullforecast =~ s/Humidex 49/<strong style="color: $exHumidex">Humidex 49<\/strong>/g;
$fullforecast =~ s/Humidex 50/<strong style="color: $exHumidex">Humidex 50<\/strong>/g;
$fullforecast =~ s/Humidex 51/<strong style="color: $exHumidex">Humidex 51<\/strong>/g;
$fullforecast =~ s/Humidex 52/<strong style="color: $exHumidex">Humidex 52<\/strong>/g;
$fullforecast =~ s/Humidex 53/<strong style="color: $exHumidex">Humidex 53<\/strong>/g;
$fullforecast =~ s/Humidex 54/<strong style="color: $exHumidex">Humidex 54<\/strong>/g;
$fullforecast =~ s/Humidex 55/<strong style="color: $exHumidex">Humidex 55<\/strong>/g;
$fullforecast =~ s/Humidex 56/<strong style="color: $exHumidex">Humidex 56<\/strong>/g;

$fullforecast =~ s/humidex 40/<strong style="color: $exHumidex">humidex 40<\/strong>/g;
$fullforecast =~ s/humidex 41/<strong style="color: $exHumidex">humidex 41<\/strong>/g;
$fullforecast =~ s/humidex 42/<strong style="color: $exHumidex">humidex 42<\/strong>/g;
$fullforecast =~ s/humidex 43/<strong style="color: $exHumidex">humidex 43<\/strong>/g;
$fullforecast =~ s/humidex 44/<strong style="color: $exHumidex">humidex 44<\/strong>/g;
$fullforecast =~ s/humidex 45/<strong style="color: $exHumidex">humidex 45<\/strong>/g;
$fullforecast =~ s/humidex 46/<strong style="color: $exHumidex">humidex 46<\/strong>/g;
$fullforecast =~ s/humidex 47/<strong style="color: $exHumidex">humidex 47<\/strong>/g;
$fullforecast =~ s/humidex 48/<strong style="color: $exHumidex">humidex 48<\/strong>/g;
$fullforecast =~ s/humidex 49/<strong style="color: $exHumidex">humidex 49<\/strong>/g;
$fullforecast =~ s/humidex 50/<strong style="color: $exHumidex">humidex 50<\/strong>/g;
$fullforecast =~ s/humidex 51/<strong style="color: $exHumidex">humidex 51<\/strong>/g;
$fullforecast =~ s/humidex 52/<strong style="color: $exHumidex">humidex 52<\/strong>/g;
$fullforecast =~ s/humidex 53/<strong style="color: $exHumidex">humidex 53<\/strong>/g;
$fullforecast =~ s/humidex 54/<strong style="color: $exHumidex">humidex 54<\/strong>/g;
$fullforecast =~ s/humidex 55/<strong style="color: $exHumidex">humidex 55<\/strong>/g;
$fullforecast =~ s/humidex 56/<strong style="color: $exHumidex">humidex 56<\/strong>/g;

#RAINY STUFF
$fullforecast =~ s/Rain at times heavy/<strong style="color: $hRainColor">Rain at times heavy<\/strong>/g;
$fullforecast =~ s/rain at times heavy/<strong style="color: $hRainColor">rain at times heavy<\/strong>/g;
$fullforecast =~ s/Pluie parfois forte/<strong style="color: $hRainColor">Pluie parfois forte<\/strong>/g;
$fullforecast =~ s/pluie parfois forte/<strong style="color: $hRainColor">pluie parfois forte<\/strong>/g;

$fullforecast =~ s/heavy rain/<strong style="color: $hRainColor">heavy rain<\/strong>/g;
$fullforecast =~ s/Heavy rain/<strong style="color: $hRainColor">Heavy rain<\/strong>/g;
$fullforecast =~ s/pluie forte/<strong style="color: $hRainColor">pluie forte<\/strong>/g;
$fullforecast =~ s/Pluie forte/<strong style="color: $hRainColor">Pluie forte<\/strong>/g;

$fullforecast =~ s/Amount 5 mm/<strong style="color: $hRainColor">Amount 5 mm<\/strong>/g;
$fullforecast =~ s/Amount 10 mm/<strong style="color: $hRainColor">Amount 10 mm<\/strong>/g;
$fullforecast =~ s/Amount 20 mm/<strong style="color: $hRainColor">Amount 20 mm<\/strong>/g;
$fullforecast =~ s/Amount 25 mm/<strong style="color: $hRainColor">Amount 25 mm<\/strong>/g;
$fullforecast =~ s/Amount 30 mm/<strong style="color: $hRainColor">Amount 30 mm<\/strong>/g;
$fullforecast =~ s/Amount 35 mm/<strong style="color: $hRainColor">Amount 35 mm<\/strong>/g;
$fullforecast =~ s/Amount 40 mm/<strong style="color: $vhRainColor">Amount 40 mm<\/strong>/g;
$fullforecast =~ s/Amount 45 mm/<strong style="color: $vhRainColor">Amount 45 mm<\/strong>/g;
$fullforecast =~ s/Amount 50 mm/<strong style="color: $vhRainColor">Amount 50 mm<\/strong>/g;
$fullforecast =~ s/Amount 55 mm/<strong style="color: $vhRainColor">Amount 55 mm<\/strong>/g;
$fullforecast =~ s/Amount 60 mm/<strong style="color: $vhRainColor">Amount 60 mm<\/strong>/g;
$fullforecast =~ s/Amount 65 mm/<strong style="color: $vhRainColor">Amount 65 mm<\/strong>/g;

$fullforecast =~ s/Hauteur prévue de 5 mm/<strong style="color: $hRainColor">Hauteur prévue de 5 mm<\/strong>/g;
$fullforecast =~ s/Hauteur prévue de 10 mm/<strong style="color: $hRainColor">Hauteur prévue de 10 mm<\/strong>/g;
$fullforecast =~ s/Hauteur prévue de 20 mm/<strong style="color: $hRainColor">Hauteur prévue de 20 mm<\/strong>/g;
$fullforecast =~ s/Hauteur prévue de 25 mm/<strong style="color: $hRainColor">Hauteur prévue de 25 mm<\/strong>/g;
$fullforecast =~ s/Hauteur prévue de 30 mm/<strong style="color: $hRainColor">Hauteur prévue de 30 mm<\/strong>/g;
$fullforecast =~ s/Hauteur prévue de 35 mm/<strong style="color: $hRainColor">Hauteur prévue de 35 mm<\/strong>/g;
$fullforecast =~ s/Hauteur prévue de 40 mm/<strong style="color: $vhRainColor">Hauteur prévue de 40 mm<\/strong>/g;
$fullforecast =~ s/Hauteur prévue de 45 mm/<strong style="color: $vhRainColor">Hauteur prévue de 45 mm<\/strong>/g;
$fullforecast =~ s/Hauteur prévue de 50 mm/<strong style="color: $vhRainColor">Hauteur prévue de 50 mm<\/strong>/g;
$fullforecast =~ s/Hauteur prévue de 55 mm/<strong style="color: $vhRainColor">Hauteur prévue de 55 mm<\/strong>/g;
$fullforecast =~ s/Hauteur prévue de 60 mm/<strong style="color: $vhRainColor">Hauteur prévue de 60 mm<\/strong>/g;
$fullforecast =~ s/Hauteur prévue de 65 mm/<strong style="color: $vhRainColor">Hauteur prévue de 65 mm<\/strong>/g;

$fullforecast =~ s/Amount 10 to 20 mm/<strong style="color: $hRainColor">Amount 10 to 20 mm<\/strong>/g;
$fullforecast =~ s/Amount 15 to 25 mm/<strong style="color: $hRainColor">Amount 15 to 25 mm<\/strong>/g;
$fullforecast =~ s/Amount 20 to 25 mm/<strong style="color: $hRainColor">Amount 20 to 25 mm<\/strong>/g;
$fullforecast =~ s/Amount 20 to 30 mm/<strong style="color: $hRainColor">Amount 20 to 30 mm<\/strong>/g;
$fullforecast =~ s/Amount 25 to 30 mm/<strong style="color: $hRainColor">Amount 25 to 30 mm<\/strong>/g;
$fullforecast =~ s/Amount 30 to 40 mm/<strong style="color: $vhRainColor">Amount 30 to 40 mm<\/strong>/g;
$fullforecast =~ s/Amount 35 to 40 mm/<strong style="color: $vhRainColor">Amount 35 to 40 mm<\/strong>/g;
$fullforecast =~ s/Amount 40 to 45 mm/<strong style="color: $vhRainColor">Amount 40 to 45 mm<\/strong>/g;
$fullforecast =~ s/Amount 40 to 50 mm/<strong style="color: $vhRainColor">Amount 40 to 50 mm<\/strong>/g;
$fullforecast =~ s/Amount 45 to 50 mm/<strong style="color: $vhRainColor">Amount 45 to 50 mm<\/strong>/g;
$fullforecast =~ s/Amount 50 to 70 mm/<strong style="color: $vhRainColor">Amount 50 to 70 mm<\/strong>/g;

$fullforecast =~ s/Hauteur prévue de 15 à 25 mm/<strong style="color: $hRainColor">Hauteur prévue de 15 à 25 mm<\/strong>/g;
$fullforecast =~ s/Hauteur prévue de 20 à 25 mm/<strong style="color: $hRainColor">Hauteur prévue de 20 à 25 mm<\/strong>/g;
$fullforecast =~ s/Hauteur prévue de 25 à 30 mm/<strong style="color: $hRainColor">Hauteur prévue de 25 à 30 mm<\/strong>/g;
$fullforecast =~ s/Hauteur prévue de 30 à 40 mm/<strong style="color: $vhRainColor">Hauteur prévue de 30 à 40 mm<\/strong>/g;
$fullforecast =~ s/Hauteur prévue de 35 à 40 mm/<strong style="color: $vhRainColor">Hauteur prévue de 35 à 40 mm<\/strong>/g;
$fullforecast =~ s/Hauteur prévue de 40 à 45 mm/<strong style="color: $vhRainColor">Hauteur prévue de 40 à 45 mm<\/strong>/g;
$fullforecast =~ s/Hauteur prévue de 40 à 50 mm/<strong style="color: $vhRainColor">Hauteur prévue de 40 à 50 mm<\/strong>/g;
$fullforecast =~ s/Hauteur prévue de 45 à 50 mm/<strong style="color: $vhRainColor">Hauteur prévue de 45 à 50 mm<\/strong>/g;
$fullforecast =~ s/Hauteur prévue de 50 à 70 mm/<strong style="color: $vhRainColor">Hauteur prévue de 50 à 70 mm<\/strong>/g;

#WINDY STUFF
$fullforecast =~ s/very windy/<strong style="color: $windyColor">very windy<\/strong>/g;
$fullforecast =~ s/Very windy/<strong style="color: $windyColor">Very windy<\/strong>/g;
$fullforecast =~ s/windy/<strong style="color: $windyColor">windy<\/strong>/g;
$fullforecast =~ s/Windy/<strong style="color: $windyColor">Windy<\/strong>/g;


$fullforecast =~ s/Très venteux/<strong style="color: $windyColor">Très venteux<\/strong>/g;
$fullforecast =~ s/très venteux/<strong style="color: $windyColor">très venteux<\/strong>/g;
$fullforecast =~ s/venteux/<strong style="color: $windyColor">venteux<\/strong>/g;
$fullforecast =~ s/Venteux/<strong style="color: $windyColor">Venteux<\/strong>/g;

$fullforecast =~ s/30 to 50/<strong style="color: $windyColor">30 to 50<\/strong>/g;
$fullforecast =~ s/40 to 60/<strong style="color: $windyColor">40 to 60<\/strong>/g;
$fullforecast =~ s/50 to 70/<strong style="color: $windyColor">50 to 70<\/strong>/g;
$fullforecast =~ s/60 to 80/<strong style="color: $windyColor">60 to 80<\/strong>/g;
$fullforecast =~ s/60 to 90/<strong style="color: $windyColor">60 to 90<\/strong>/g;
$fullforecast =~ s/70 to 90/<strong style="color: $windyColor">70 to 90<\/strong>/g;
$fullforecast =~ s/70 to 100/<strong style="color: $windyColor">70 to 100<\/strong>/g;
$fullforecast =~ s/80 to 100/<strong style="color: $windyColor">80 to 100<\/strong>/g;
$fullforecast =~ s/90 to 110/<strong style="color: $windyColor">90 to 110<\/strong>/g;
$fullforecast =~ s/90 to 120/<strong style="color: $windyColor">90 to 120<\/strong>/g;
$fullforecast =~ s/100 to 120/<strong style="color: $windyColor">100 to 120<\/strong>/g;

$fullforecast =~ s/30 à 50/<strong style="color: $windyColor">30 à 50<\/strong>/g;
$fullforecast =~ s/40 à 60/<strong style="color: $windyColor">40 à 60<\/strong>/g;
$fullforecast =~ s/50 à 70/<strong style="color: $windyColor">50 à 70<\/strong>/g;
$fullforecast =~ s/60 à 80/<strong style="color: $windyColor">60 à 80<\/strong>/g;
$fullforecast =~ s/60 à 90/<strong style="color: $windyColor">60 à 90<\/strong>/g;
$fullforecast =~ s/70 à 90/<strong style="color: $windyColor">70 à 90<\/strong>/g;
$fullforecast =~ s/70 à 100/<strong style="color: $windyColor">70 à 100<\/strong>/g;
$fullforecast =~ s/80 à 100/<strong style="color: $windyColor">80 à 100<\/strong>/g;
$fullforecast =~ s/90 à 110/<strong style="color: $windyColor">90 à 110<\/strong>/g;
$fullforecast =~ s/90 à 120/<strong style="color: $windyColor">90 à 120<\/strong>/g;
$fullforecast =~ s/100 à 120/<strong style="color: $windyColor">100 à 120<\/strong>/g;

$fullforecast =~ s/15 km\/h/<strong style="color: $windyColor">15 km\/h<\/strong>/g;
$fullforecast =~ s/20 km\/h/<strong style="color: $windyColor">20 km\/h<\/strong>/g;
$fullforecast =~ s/25 km\/h/<strong style="color: $windyColor">25 km\/h<\/strong>/g;
$fullforecast =~ s/30 km\/h/<strong style="color: $windyColor">30 km\/h<\/strong>/g;
$fullforecast =~ s/35 km\/h/<strong style="color: $windyColor">35 km\/h<\/strong>/g;
$fullforecast =~ s/40 km\/h/<strong style="color: $windyColor">40 km\/h<\/strong>/g;
$fullforecast =~ s/45 km\/h/<strong style="color: $windyColor">45 km\/h<\/strong>/g;
$fullforecast =~ s/50 km\/h/<strong style="color: $windyColor">50 km\/h<\/strong>/g;
$fullforecast =~ s/55 km\/h/<strong style="color: $windyColor">55 km\/h<\/strong>/g;
$fullforecast =~ s/60 km\/h/<strong style="color: $windyColor">60 km\/h<\/strong>/g;
$fullforecast =~ s/65 km\/h/<strong style="color: $windyColor">65 km\/h<\/strong>/g;
$fullforecast =~ s/70 km\/h/<strong style="color: $windyColor">70 km\/h<\/strong>/g;
$fullforecast =~ s/75 km\/h/<strong style="color: $windyColor">75 km\/h<\/strong>/g;
$fullforecast =~ s/80 km\/h/<strong style="color: $windyColor">80 km\/h<\/strong>/g;
$fullforecast =~ s/85 km\/h/<strong style="color: $windyColor">85 km\/h<\/strong>/g;
$fullforecast =~ s/90 km\/h/<strong style="color: $windyColor">90 km\/h<\/strong>/g;
$fullforecast =~ s/95 km\/h/<strong style="color: $windyColor">95 km\/h<\/strong>/g;
$fullforecast =~ s/100 km\/h/<strong style="color: $windyColor">100 km\/h<\/strong>/g;
$fullforecast =~ s/105 km\/h/<strong style="color: $windyColor">105 km\/h<\/strong>/g;
$fullforecast =~ s/110 km\/h/<strong style="color: $windyColor">110 km\/h<\/strong>/g;
$fullforecast =~ s/115 km\/h/<strong style="color: $windyColor">115 km\/h<\/strong>/g;
$fullforecast =~ s/120 km\/h/<strong style="color: $windyColor">120 km\/h<\/strong>/g;
$fullforecast =~ s/125 km\/h/<strong style="color: $windyColor">125 km\/h<\/strong>/g;
$fullforecast =~ s/130 km\/h/<strong style="color: $windyColor">130 km\/h<\/strong>/g;
$fullforecast =~ s/135 km\/h/<strong style="color: $windyColor">135 km\/h<\/strong>/g;
$fullforecast =~ s/140 km\/h/<strong style="color: $windyColor">140 km\/h<\/strong>/g;
$fullforecast =~ s/145 km\/h/<strong style="color: $windyColor">145 km\/h<\/strong>/g;
$fullforecast =~ s/150 km\/h/<strong style="color: $windyColor">150 km\/h<\/strong>/g;
$fullforecast =~ s/155 km\/h/<strong style="color: $windyColor">155 km\/h<\/strong>/g;

$fullforecast =~ s/km\/h/<strong style="color: $windyColor">km\/h<\/strong>/g;


$fullforecast =~ s/gusting to 40/<strong style="color: $windyColor">gusting to 40<\/strong>/g;
$fullforecast =~ s/gusting to 45/<strong style="color: $windyColor">gusting to 45<\/strong>/g;
$fullforecast =~ s/gusting to 50/<strong style="color: $windyColor">gusting to 50<\/strong>/g;
$fullforecast =~ s/gusting to 55/<strong style="color: $windyColor">gusting to 55<\/strong>/g;
$fullforecast =~ s/gusting to 60/<strong style="color: $windyColor">gusting to 60<\/strong>/g;
$fullforecast =~ s/gusting to 65/<strong style="color: $windyColor">gusting to 65<\/strong>/g;
$fullforecast =~ s/gusting to 70/<strong style="color: $windyColor">gusting to 70<\/strong>/g;
$fullforecast =~ s/gusting to 75/<strong style="color: $windyColor">gusting to 75<\/strong>/g;
$fullforecast =~ s/gusting to 80/<strong style="color: $windyColor">gusting to 80<\/strong>/g;
$fullforecast =~ s/gusting to 85/<strong style="color: $windyColor">gusting to 85<\/strong>/g;
$fullforecast =~ s/gusting to 90/<strong style="color: $windyColor">gusting to 90<\/strong>/g;
$fullforecast =~ s/gusting to 95/<strong style="color: $windyColor">gusting to 95<\/strong>/g;

$fullforecast =~ s/rafales à 40/<strong style="color: $windyColor">rafales à 40<\/strong>/g;
$fullforecast =~ s/rafales à 45/<strong style="color: $windyColor">rafales à 45<\/strong>/g;
$fullforecast =~ s/rafales à 50/<strong style="color: $windyColor">rafales à 50<\/strong>/g;
$fullforecast =~ s/rafales à 55/<strong style="color: $windyColor">rafales à 55<\/strong>/g;
$fullforecast =~ s/rafales à 60/<strong style="color: $windyColor">rafales à 60<\/strong>/g;
$fullforecast =~ s/rafales à 65/<strong style="color: $windyColor">rafales à 65<\/strong>/g;
$fullforecast =~ s/rafales à 70/<strong style="color: $windyColor">rafales à 70<\/strong>/g;
$fullforecast =~ s/rafales à 75/<strong style="color: $windyColor">rafales à 75<\/strong>/g;
$fullforecast =~ s/rafales à 80/<strong style="color: $windyColor">rafales à 80<\/strong>/g;
$fullforecast =~ s/rafales à 85/<strong style="color: $windyColor">rafales à 85<\/strong>/g;
$fullforecast =~ s/rafales à 90/<strong style="color: $windyColor">rafales à 90<\/strong>/g;
$fullforecast =~ s/rafales à 95/<strong style="color: $windyColor">rafales à 95<\/strong>/g;

$fullforecast =~ s/gusty winds/<strong style="color: $windyColor">gusty winds<\/strong>/g;
$fullforecast =~ s/Gusty winds/<strong style="color: $windyColor">Gusty winds<\/strong>/g;

return $fullforecast;
}


1;