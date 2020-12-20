#!/usr/bin/perl
# use module
use XML::Simple;
use Data::Dumper;
use HTTP::Date;
#use warnings;
#use diagnostics;

## Adding trailing slash from user configuration

my $perlWebPath = $ENV{'perlwebPath'}.'/';

## XML file is the source of all data from Environment Canada

my $xmlFile = $ENV{'perlxmlFile'};


## Temporary text file 
my $outputForecastOnlyfile = $ENV{'perlfinalForecasttmp'};

## Placeholder as we were doing current conditions at one point.
my $outputConditionsandForecastfile = 'ECCurCondTmp.txt';

my $forecastURL = $ENV{'perlforecastURL'};
my $forecastPlaceName = $ENV{'perlforecastPlaceName'};
my $warnLink = $ENV{'perlwarnLink'};
my $thunderLink = $ENV{'perlthunderLink'};
my $forecastName = $ENV{'perlforecastName'};
my $footerMsg = $ENV{'perlfooterMsg'};

##STYLES
my $boldDays = $ENV{'perlboldDays'};
my $textColor = $ENV{'perltextColor'};


##COLOURS 
my $freezeDrizzleWarn = $ENV{'perlfreezeDrizzleWarn'};
my $freezeRainWarn = $ENV{'perlfreezeRainWarn'};
my $freezingTemp = $ENV{'perlfreezingTemp'};
my $hotTemp = $ENV{'perlhotTemp'};
my $thunderWarn = $ENV{'perlthunderWarn'};
my $flurriesColor = $ENV{'perlflurriesColor'};
my $windyColor = $ENV{'perlwindyColor'};
my $hRainColor = $ENV{'perlhRainColor'};
my $vhRainColor = $ENV{'perlvhRainColor'};

my $comma = ";";
$xml = new XML::Simple;
my $forecastlinkpreamble = "<p><strong><a target='_blank' id='curforcst' href='";
my $forecastlinkpostamble = "'>";
my $forecastnamepostamble = "</a></strong>";
my $forecastlink = $forecastlinkpreamble . $forecastURL . $forecastlinkpostamble . $forecastName . $forecastnamepostamble;

$xmlFile = $perlWebPath . $xmlFile;
$outputForecastOnlyfile = $perlWebPath . $outputForecastOnlyfile;
$outputConditionsandForecastfile = $perlWebPath . $outputConditionsandForecastfile;

# read XML file
my $data = $xml->XMLin($xmlFile);

## IF THE CURRENT CONDITIONS ARE OFFLINE THEN WE DON"T DO ANYTHING HERE AND JUST SWITCH TO GETTING THE FIRST (0) LINE SO IT DOESN"T GET THE FORECAST BY MISTAKE
## GRABBING THE PROPER PART OF THE XML DOCUMENT STRUCTURE FOR CURRENT CONDITIONS
#$currentconditions = $data->{channel}->{item}->[0]->{description};
## GRABBING THE PROPER PART OF THE XML DOCUMENT STRUCTURE FOR CURRENT CONDITIONS
$getkeys = $data->{entry};
while( my ($k, $v) = each %$getkeys ) {
       # print "$k\n";
        push(@weatherkeys, $k);
    }
foreach (@weatherkeys) {
      if (index($_, 'fc1:') != -1) {
    $weatherkeyfinal[0] = $_;
    }
     if (index($_, 'fc2:') != -1) {
    $weatherkeyfinal[1] = $_;
    }
    if (index($_, 'fc3:') != -1) {
    $weatherkeyfinal[2] = $_;
    }
    if (index($_, 'fc4:') != -1) {
    $weatherkeyfinal[3] = $_;
    }
    if (index($_, 'fc5:') != -1) {
    $weatherkeyfinal[4] = $_;
    }
    if (index($_, 'fc6:') != -1) {
    $weatherkeyfinal[5] = $_;
    }
    if (index($_, 'fc7:') != -1) {
    $weatherkeyfinal[6] = $_;
    }
    if (index($_, 'fc8:') != -1) {
    $weatherkeyfinal[7] = $_;
    }
    if (index($_, 'fc9:') != -1) {
    $weatherkeyfinal[8] = $_;
    }
    if (index($_, 'fc10:') != -1) {
    $weatherkeyfinal[9] = $_;
    }
    if (index($_, 'fc11:') != -1) {
    $weatherkeyfinal[10] = $_;
    }
     if (index($_, 'fc12:') != -1) {
    $weatherkeyfinal[11] = $_;
    }
     if (index($_, 'fc13:') != -1) {
    $weatherkeyfinal[12] = $_;
    }
    if (index($_, 'cc') != -1) {
    $currentconditionskey = $_;
    }
    if (index($_, 'w1') != -1) {
    $warnings = $_;
    }
    }
#print @weatherkeyfinal[2];
#print $weathercc;
#print $weatherwarn;
$allforecast = '';
foreach (@weatherkeyfinal) {
$allforecast = $allforecast . $data->{entry}{$_}{title};
$allforecast = $allforecast . $data->{entry}{$_}{summary}{content};
}
#print $allforecast;
$currentconditions = $data->{entry}{$currentconditionskey}{summary}{content};
#print $currentconditions;
## GETTING RID OF WHAT WE DO NOT WANT IN THE STRING
$currentconditions =~ s/<b>//g;
$currentconditions =~ s/<\/b>//g;
$currentconditions =~ s/<br\/>//g;
$currentconditions =~ s/<\/b>//g;
$currentconditions =~ s/\&deg;C//g;
$currentconditions =~ s/kPa/,/g;
$currentconditions =~ s/steady/Tendency: steady/g;
$currentconditions =~ s/falling/Tendency: falling/g;
$currentconditions =~ s/rising/Tendency: rising/g;
$currentconditions =~ s/\%//g;
$currentconditions =~ s/km\/h//g;

## REPLACING THE LINE BREAKS WITH COMMAS FOR EASIER SPLITTING - 
## final 'g' does 'global' search and is required

$currentconditions =~ s/\n/,/g;

#print $currentconditions;

## SPLITTING THE FINAL STRING
my @values = split(',', $currentconditions);

## ASSIGNING STRING ARRAY TO FINAL PAIRS AND SPLITTING AGAIN INTO FINAL VALUE VARIABLES AND REMOVING WHITESPACES


$obstime = $values[0];
$obstime = $obstime . $comma;

$temp = $values[1];
my @tempval = split(':', $temp);
$temp = $tempval[1];
$temp =~ s/\s+//g;
$temp = $temp . $comma;

$pressure = $values[2];
my @pressureval = split(':', $pressure);
$pressure = $pressureval[1];
$pressure =~ s/\s+//g;
$pressure = $pressure . $comma;

$pressuretrend = $values[3];
my @pressuretrendval = split(':', $pressuretrend);
$pressuretrend = $pressuretrendval[1];
$pressuretrend =~ s/\s+//g;
$pressuretrend = $pressuretrend . $comma;


$humidity = $values[4];
my @humidityval = split(':', $humidity);
$humidity = $humidityval[1];
$humidity =~ s/\s+//g;
$humidity = $humidity . $comma;


$chill = $values[5];
my @chillval = split(':', $chill);
#print $chillval[0];

if ($chillval[0] eq 'Dewpoint') {
$chill = 'NA';
$chill =~ s/\s+//g;
$chill = $chill . $comma;

$dew = $chillval[1];
$dew =~ s/\s+//g;
$dew = $dew . $comma;

$wind = $values[6];
my @windval = split(':', $wind);
$wind = $windval[1];
$wind =~ s/\s+//g;
$wind = $wind . $comma;


$airq = $values[7];
my @airqval = split(':', $airq);
$airq = $airqval[1];
$airq =~ s/\s+//g;
$airq = $airq . $comma;

} else {

$chill = $values[5];
my @chillval = split(':', $chill);
$chill = $chillval[1];
$chill =~ s/\s+//g;
$chill = $chill . $comma;


$dew = $values[6];
my @dewval = split(':', $dew);
$dew = $dewval[1];
$dew =~ s/\s+//g;
$dew = $dew . $comma;


$wind = $values[7];
my @windval = split(':', $wind);
$wind = $windval[1];
$wind =~ s/\s+//g;
$wind = $wind . $comma;


$airq = $values[8];
my @airqval = split(':', $airq);
$airq = $airqval[1];
$airq =~ s/\s+//g;
$airq = $airq . $comma;
}


######
######
#### SECTION 2 - NOW WE DO THE FORECAST ###
######
######


# read XML file
$data = $xml->XMLin($xmlFile);

## GRABBING THE PROPER PART OF THE XML DOCUMENT STRUCTURE FOR CURRENT CONDITIONS
$fullforecast = '';
#$warnLink = $data->{channel}->{item}->[0]->{link};

$fullforecast = $forecastlink . " - ";


$warn = $data->{entry}{$warnings}{title};
$fullforecast = $fullforecast . $warn;

$warn2 = $data->{entry}{$warnings}{summary}{content};
$fullforecast = $fullforecast . $warn2 . "</p><p>";

$issued = $data->{entry}{$weatherkeyfinal[0]}{summary}{content};
$issued =~ s/^(.*)Forecast/Forecast/g;
$fullforecast = $fullforecast . "<em>" . $issued . "</em> - ";


=for comment
IF ENVIRONMENT CANADA IS NOT SHOWING CURRENT CONDITIONS IT WILL BREAK THE RSS FEED AND SHIFT EVERYTHING UP A LEVEL IN THE XML  THERE ARE TWO IDENTICAL SECTIONS HERE, THE FIRST WITH THE VALUES SHIFTED, THE SECOND WITHOUT


$day1 = $data->{channel}->{item}->[1]->{title};
$day1 =~ s/:(.*)$/: /g;
$fullforecast = $fullforecast . $day1;
$day1dc = $data->{channel}->{item}->[1]->{description};
$day1dc =~ s/Forecast(.*)$//g;
$fullforecast = $fullforecast . $day1dc;

$day2 = $data->{channel}->{item}->[2]->{title};
$day2 =~ s/:(.*)$/: /g;
$fullforecast = $fullforecast . $day2;
$day2dc = $data->{channel}->{item}->[2]->{description};
$day2dc =~ s/Forecast(.*)$//g;
$fullforecast = $fullforecast . $day2dc;

$day3 = $data->{channel}->{item}->[3]->{title};
$day3 =~ s/:(.*)$/: /g;
$fullforecast = $fullforecast . $day3;
$day3dc = $data->{channel}->{item}->[3]->{description};
$day3dc =~ s/Forecast(.*)$//g;
$fullforecast = $fullforecast . $day3dc;

$day4 = $data->{channel}->{item}->[4]->{title};
$day4 =~ s/:(.*)$/: /g;
$fullforecast = $fullforecast . $day4;
$day4dc = $data->{channel}->{item}->[4]->{description};
$day4dc =~ s/Forecast(.*)$//g;
$fullforecast = $fullforecast . $day4dc;

$day5 = $data->{channel}->{item}->[5]->{title};
$day5 =~ s/:(.*)$/: /g;
$fullforecast = $fullforecast . $day5;
$day5dc = $data->{channel}->{item}->[5]->{description};
$day5dc =~ s/Forecast(.*)$//g;
$fullforecast = $fullforecast . $day5dc;

$day6 = $data->{channel}->{item}->[6]->{title};
$day6 =~ s/:(.*)$/: /g;
$fullforecast = $fullforecast . $day6;
$day6dc = $data->{channel}->{item}->[6]->{description};
$day6dc =~ s/Forecast(.*)$//g;
$fullforecast = $fullforecast . $day6dc;

$day7 = $data->{channel}->{item}->[7]->{title};
$day7 =~ s/:(.*)$/: /g;
$fullforecast = $fullforecast . $day7;
$day7dc = $data->{channel}->{item}->[7]->{description};
$day7dc =~ s/Forecast(.*)$//g;
$fullforecast = $fullforecast . $day7dc;
=cut

=for comment
IF ENVIRONMENT CANADA IS NOT SHOWING CURRENT CONDITIONS IT WILL BREAK THE RSS FEED AND SHIFT EVERYTHING UP A LEVEL IN THE XML  THERE ARE TWO IDENTICAL SECTIONS HERE, THE FIRST WITH THE VALUES SHIFTED, THE SECOND WITHOUT
=cut

#print $weatherkeyfinal[0];
#print $weatherkeyfinal[3];
$day1 = $data->{entry}{$weatherkeyfinal[0]}{title};
$day1 =~ s/:(.*)$/: /g;
$fullforecast = $fullforecast . $day1;
$day1dc = $data->{entry}{$weatherkeyfinal[0]}{summary}{content};
$day1dc =~ s/Forecast(.*)$//g;
$fullforecast = $fullforecast . $day1dc;


$day2 = $data->{entry}{$weatherkeyfinal[1]}{title};
$day2 =~ s/:(.*)$/: /g;
$fullforecast = $fullforecast . $day2;
$day2dc = $data->{entry}{$weatherkeyfinal[1]}{summary}{content};
$day2dc =~ s/Forecast(.*)$//g;
$fullforecast = $fullforecast . $day2dc;

$day3 = $data->{entry}{$weatherkeyfinal[2]}{title};
$day3 =~ s/:(.*)$/: /g;
$fullforecast = $fullforecast . $day3;
$day3dc = $data->{entry}{$weatherkeyfinal[2]}{summary}{content};
$day3dc =~ s/Forecast(.*)$//g;
$fullforecast = $fullforecast . $day3dc;

$day4 = $data->{entry}{$weatherkeyfinal[3]}{title};
$day4 =~ s/:(.*)$/: /g;
$fullforecast = $fullforecast . $day4;
$day4dc = $data->{entry}{$weatherkeyfinal[3]}{summary}{content};
$day4dc =~ s/Forecast(.*)$//g;
$fullforecast = $fullforecast . $day4dc;

$day5 = $data->{entry}{$weatherkeyfinal[4]}{title};
$day5 =~ s/:(.*)$/: /g;
$fullforecast = $fullforecast . $day5;
$day5dc = $data->{entry}{$weatherkeyfinal[4]}{summary}{content};
$day5dc =~ s/Forecast(.*)$//g;
$fullforecast = $fullforecast . $day5dc;

$day6 = $data->{entry}{$weatherkeyfinal[5]}{title};
$day6 =~ s/:(.*)$/: /g;
$fullforecast = $fullforecast . $day6;
$day6dc = $data->{entry}{$weatherkeyfinal[5]}{summary}{content};
$day6dc =~ s/Forecast(.*)$//g;
$fullforecast = $fullforecast . $day6dc;

$day7 = $data->{entry}{$weatherkeyfinal[6]}{title};
$day7 =~ s/:(.*)$/: /g;
$fullforecast = $fullforecast . $day7;
$day7dc = $data->{entry}{$weatherkeyfinal[6]}{summary}{content};
$day7dc =~ s/Forecast(.*)$//g;
$fullforecast = $fullforecast . $day7dc;

$day8 = $data->{entry}{$weatherkeyfinal[7]}{title};
$day8 =~ s/:(.*)$/: /g;
$fullforecast = $fullforecast . $day8;
$day8dc = $data->{entry}{$weatherkeyfinal[7]}{summary}{content};
$day8dc =~ s/Forecast(.*)$//g;
$fullforecast = $fullforecast . $day8dc;

$day9 = $data->{entry}{$weatherkeyfinal[8]}{title};
$day9 =~ s/:(.*)$/: /g;
$fullforecast = $fullforecast . $day9;
$day9dc = $data->{entry}{$weatherkeyfinal[8]}{summary}{content};
$day9dc =~ s/Forecast(.*)$//g;
$fullforecast = $fullforecast . $day9dc;

$day10 = $data->{entry}{$weatherkeyfinal[9]}{title};
$day10 =~ s/:(.*)$/: /g;
$fullforecast = $fullforecast . $day10;
$day10dc = $data->{entry}{$weatherkeyfinal[9]}{summary}{content};
$day10dc =~ s/Forecast(.*)$//g;
$fullforecast = $fullforecast . $day10dc;

$day11 = $data->{entry}{$weatherkeyfinal[10]}{title};
$day11 =~ s/:(.*)$/: /g;
$fullforecast = $fullforecast . $day11;
$day11dc = $data->{entry}{$weatherkeyfinal[10]}{summary}{content};
$day11dc =~ s/Forecast(.*)$//g;
$fullforecast = $fullforecast . $day11dc;

$day12 = $data->{entry}{$weatherkeyfinal[11]}{title};
$day12 =~ s/:(.*)$/: /g;
$fullforecast = $fullforecast . $day12;
$day12dc = $data->{entry}{$weatherkeyfinal[11]}{summary}{content};
$day12dc =~ s/Forecast(.*)$//g;
$fullforecast = $fullforecast . $day12dc;

$day13 = $data->{entry}{$weatherkeyfinal[12]}{title};
$day13 =~ s/:(.*)$/: /g;
$fullforecast = $fullforecast . $day13;
$day13dc = $data->{entry}{$weatherkeyfinal[12]}{summary}{content};
$day13dc =~ s/Forecast(.*)$//g;
$fullforecast = $fullforecast . $day13dc;


## GETTING RID OF WHAT WE DO NOT WANT IN THE STRING AND ADDING SOME FEATURES TO THE TEXT. 
####### BUILDING INLINE STYLE ATTRIBUTE VALUES

my $mainStyleElement = "<style>.warning {color: #ff0000; font-size:large;} </style>";

my $mainparaStyle = "style='color:" . $textColor . ";'";
my $daystrongStyle = "style='font-weight:" . $boldDays . ";'";
my $drizzstrongStyle = "style='color:" . $freezeDrizzleWarn . ";'";
my $frainstrongStyle = "style='color:" . $freezeRainWarn . ";'";
my $flurstrongStyle = "style='color:" . $flurriesColor . ";'";
my $snowflstrongStyle = "style='color:" . $freezingTemp . ";'";
my $snowstrongStyle = "style='color:" . $freezingTemp . ";'";
my $ftempstrongStyle = "style='color:" . $freezingTemp . ";'";
my $htempstrongStyle = "style='color:" . $hotTemp . ";'";
my $thunderstrongStyle = "style='color:" . $thunderWarn . ";'";




$fullforecast =~ s/<p><em>/<p $mainparaStyle ><em>/g;
$fullforecast =~ s/Forecast issued/ Forecast Issued/g;
$fullforecast =~ s/Today/ Today: /g;
$fullforecast =~ s/Day:/ <strong $daystrongStyle > Day:<\/strong>/g;
$fullforecast =~ s/Tomorrow/ <strong $daystrongStyle > Tomorrow:<\/strong>/g;
$fullforecast =~ s/Tonight/ <strong $daystrongStyle > Tonight:<\/strong>/g;
$fullforecast =~ s/Night:/<strong $daystrongStyle > Night:<\/strong>/g;
$fullforecast =~ s/Monday:/<strong $daystrongStyle > Monday:<\/strong>/g;
$fullforecast =~ s/Monday night:/<strong $daystrongStyle > Monday night:<\/strong>/g;
$fullforecast =~ s/Tuesday:/<strong $daystrongStyle > Tuesday:<\/strong>/g;
$fullforecast =~ s/Tuesday night:/<strong $daystrongStyle > Tuesday night:<\/strong>/g;
$fullforecast =~ s/Wednesday:/<strong $daystrongStyle > Wednesday:<\/strong>/g;
$fullforecast =~ s/Wednesday night:/<strong $daystrongStyle > Wednesday night:<\/strong>/g;
$fullforecast =~ s/Thursday:/<strong $daystrongStyle > Thursday:<\/strong>/g;
$fullforecast =~ s/Thursday night:/<strong $daystrongStyle > Thursday night:<\/strong>/g;
$fullforecast =~ s/Friday:/<strong $daystrongStyle > Friday:<\/strong>/g;
$fullforecast =~ s/Friday night:/<strong $daystrongStyle > Friday night:<\/strong>/g;
$fullforecast =~ s/Saturday:/<strong $daystrongStyle > Saturday:<\/strong>/g;
$fullforecast =~ s/Saturday night:/<strong $daystrongStyle > Saturday night:<\/strong>/g;
$fullforecast =~ s/Sunday:/<strong $daystrongStyle > Sunday:<\/strong>/g;
$fullforecast =~ s/Sunday night:/<strong $daystrongStyle > Sunday night:<\/strong>/g;
$fullforecast =~ s/thunderstorm/<a href="$thunderLink" target="_blank"><strong style="color: $thunderWarn">thunderstorm<\/strong><\/a>/g;
$fullforecast =~ s/thunderstorms/<a href="$thunderLink"  target="_blank"><strong style="color: $thunderWarn">thunderstorms<\/strong><\/a>/g;
$fullforecast =~ s/thundershowers/<a href="$thunderLink"  target="_blank"><strong style="color: $thunderWarn">thundershowers<\/strong><\/a>/g;
$fullforecast =~ s/thundershowers/<a href="$thunderLink"  target="_blank"><strong style="color: $thunderWarn">thundershowers<\/strong><\/a>/g;
$fullforecast =~ s/Normals/<strong> Normals:<\/strong>/g;
#COLD STUFF
$fullforecast =~ s/Freezing drizzle/<strong $drizzstrongStyle >Freezing drizzle<\/strong>/g;
$fullforecast =~ s/freezing drizzle/<strong $drizzstrongStyle >freezing drizzle<\/strong>/g;
$fullforecast =~ s/Freezing rain/<strong $frainstrongStyle >Freezing rain<\/strong>/g;
$fullforecast =~ s/freezing rain/<strong $frainstrongStyle >freezing rain<\/strong>/g;
$fullforecast =~ s/Flurries/<strong $flurstrongStyle >Flurries<\/strong>/g;
$fullforecast =~ s/flurries/<strong $flurstrongStyle >flurries<\/strong>/g;
$fullforecast =~ s/Snowfall/<strong $snowflstrongStyle >Snowfall<\/strong>/g;
$fullforecast =~ s/snowfall/<strong $snowflstrongStyle >snowfall<\/strong>/g;
$fullforecast =~ s/Snow/<strong $snowstrongStyle >Snow<\/strong>/g;
$fullforecast =~ s/snow/<strong $snowstrongStyle >snow<\/strong>/g;
$fullforecast =~ s/plus 1/<strong style="color: $freezingTemp">plus 1<\/strong>/g;
$fullforecast =~ s/Low 0/<strong style="color: $freezingTemp">Low 0<\/strong>/g;
$fullforecast =~ s/low 0/<strong style="color: $freezingTemp">low 0<\/strong>/g;
$fullforecast =~ s/Low zero/<strong style="color: $freezingTemp">Low zero<\/strong>/g;
$fullforecast =~ s/low zero/<strong style="color: $freezingTemp">low zero<\/strong>/g;
$fullforecast =~ s/minus 10/<strong style="color: blue;">minus 10<\/strong>/g;
$fullforecast =~ s/minus 11/<strong style="color: blue;">minus 11<\/strong>/g;
$fullforecast =~ s/minus 12/<strong style="color: blue;">minus 12<\/strong>/g;
$fullforecast =~ s/minus 13/<strong style="color: blue;">minus 13<\/strong>/g;
$fullforecast =~ s/minus 14/<strong style="color: blue;">minus 14<\/strong>/g;
$fullforecast =~ s/minus 15/<strong style="color: blue;">minus 15<\/strong>/g;
$fullforecast =~ s/minus 16/<strong style="color: blue;">minus 16<\/strong>/g;
$fullforecast =~ s/minus 17/<strong style="color: blue;">minus 17<\/strong>/g;
$fullforecast =~ s/minus 18/<strong style="color: blue;">minus 18<\/strong>/g;
$fullforecast =~ s/minus 19/<strong style="color: blue;">minus 19<\/strong>/g;
$fullforecast =~ s/minus 20/<strong style="color: blue;">minus 20<\/strong>/g;
$fullforecast =~ s/minus 21/<strong style="color: blue;">minus 21<\/strong>/g;
$fullforecast =~ s/minus 22/<strong style="color: blue;">minus 22<\/strong>/g;
$fullforecast =~ s/minus 23/<strong style="color: blue;">minus 23<\/strong>/g;
$fullforecast =~ s/minus 24/<strong style="color: blue;">minus 24<\/strong>/g;
$fullforecast =~ s/minus 25/<strong style="color: blue;">minus 25<\/strong>/g;
$fullforecast =~ s/minus 26/<strong style="color: blue;">minus 26<\/strong>/g;
$fullforecast =~ s/minus 27/<strong style="color: blue;">minus 27<\/strong>/g;
$fullforecast =~ s/minus 28/<strong style="color: blue;">minus 28<\/strong>/g;
$fullforecast =~ s/minus 29/<strong style="color: blue;">minus 29<\/strong>/g;
$fullforecast =~ s/minus 30/<strong style="color: blue;">minus 30<\/strong>/g;
$fullforecast =~ s/minus 31/<strong style="color: blue;">minus 31<\/strong>/g;
$fullforecast =~ s/minus 32/<strong style="color: blue;">minus 32<\/strong>/g;
$fullforecast =~ s/minus 33/<strong style="color: blue;">minus 33<\/strong>/g;
$fullforecast =~ s/minus 34/<strong style="color: blue;">minus 34<\/strong>/g;
$fullforecast =~ s/minus 35/<strong style="color: blue;">minus 35<\/strong>/g;
$fullforecast =~ s/minus 36/<strong style="color: blue;">minus 36<\/strong>/g;
$fullforecast =~ s/minus 37/<strong style="color: blue;">minus 37<\/strong>/g;
$fullforecast =~ s/minus 38/<strong style="color: blue;">minus 38<\/strong>/g;
$fullforecast =~ s/minus 39/<strong style="color: blue;">minus 39<\/strong>/g;
$fullforecast =~ s/minus 40/<strong style="color: blue;">minus 40<\/strong>/g;
$fullforecast =~ s/minus 1/<strong style="color: $freezingTemp">minus 1<\/strong>/g;
$fullforecast =~ s/minus 2/<strong style="color: $freezingTemp">minus 2<\/strong>/g;
$fullforecast =~ s/minus 3/<strong style="color: $freezingTemp">minus 3<\/strong>/g;
$fullforecast =~ s/minus 4/<strong style="color: $freezingTemp">minus 4<\/strong>/g;
$fullforecast =~ s/minus 5/<strong style="color: $freezingTemp">minus 5<\/strong>/g;
$fullforecast =~ s/minus 6/<strong style="color: $freezingTemp">minus 6<\/strong>/g;
$fullforecast =~ s/minus 7/<strong style="color: $freezingTemp">minus 7<\/strong>/g;
$fullforecast =~ s/minus 8/<strong style="color: $freezingTemp">minus 8<\/strong>/g;
$fullforecast =~ s/minus 9/<strong style="color: $freezingTemp">minus 9<\/strong>/g;



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
$fullforecast =~ s/High 40/<strong style="color: $hotTemp">High 40<\/strong>/g;
$fullforecast =~ s/High 41/<strong style="color: $hotTemp">High 41<\/strong>/g;
#WINDY STUFF
$fullforecast =~ s/windy/<strong style="color: $windyColor">windy<\/strong>/g;
$fullforecast =~ s/Windy/<strong style="color: $windyColor">Windy<\/strong>/g;
$fullforecast =~ s/15 km\/h/<strong style="color: $windyColor">15 km\/h<\/strong>/g;
$fullforecast =~ s/20 km\/h/<strong style="color: $windyColor">20 km\/h<\/strong>/g;
$fullforecast =~ s/25 km\/h/<strong style="color: $windyColor">25 km\/h<\/strong>/g;
$fullforecast =~ s/30 km\/h/<strong style="color: $windyColor">30 km\/h<\/strong>/g;
$fullforecast =~ s/35 km\/h/<strong style="color: $windyColor">35 km\/h<\/strong>/g;
$fullforecast =~ s/40 km\/h/<strong style="color: $windyColor">40 km\/h<\/strong>/g;

$fullforecast =~ s/gusty winds/<strong style="color: $windyColor">gusty winds<\/strong>/g;
$fullforecast =~ s/Gusty winds/<strong style="color: $windyColor">Gusty winds<\/strong>/g;
#RAINY STUFF
$fullforecast =~ s/Rain at times heavy/<strong style="color: $hRainColor">Rain at times heavy<\/strong>/g;
$fullforecast =~ s/rain at times heavy/<strong style="color: $hRainColor">rain at times heavy<\/strong>/g;
$fullforecast =~ s/heavy rain/<strong style="color: $hRainColor">heavy rain<\/strong>/g;
$fullforecast =~ s/Heavy rain/<strong style="color: $hRainColor">Heavy rain<\/strong>/g;
$fullforecast =~ s/20 mm/<strong style="color: $hRainColor">20 mm<\/strong>/g;
$fullforecast =~ s/25 mm/<strong style="color: $hRainColor">25 mm<\/strong>/g;
$fullforecast =~ s/15 to 20 mm/<strong style="color: $hRainColor">15 to 20 mm<\/strong>/g;
$fullforecast =~ s/15 to 25 mm/<strong style="color: $hRainColor">15 to 25 mm<\/strong>/g;
$fullforecast =~ s/20 to 25 mm/<strong style="color: $hRainColor">20 to 25 mm<\/strong>/g;
$fullforecast =~ s/25 to 30 mm/<strong style="color: $vhRainColor">25 to 30 mm<\/strong>/g;
$fullforecast =~ s/30 to 40 mm/<strong style="color: $vhRainColor">30 to 40 mm<\/strong>/g;
$fullforecast =~ s/35 to 40 mm/<strong style="color: $vhRainColor">35 to 40 mm<\/strong>/g;
$fullforecast =~ s/40 to 45 mm/<strong style="color: $vhRainColor">40 to 45 mm<\/strong>/g;
$fullforecast =~ s/45 to 50 mm/<strong style="color: $vhRainColor">45 to 50 mm<\/strong>/g;
#WARNINGS
$fullforecast =~ s/No watches or warnings in effect. $forecastPlaceName//g;
$fullforecast =~ s/SNOWFALL WARNING ENDED, $forecastPlaceName/<strong class="warning"><a target='_blank' href="$warnLink">SNOWFALL WARNING ENDED<\/a><\/strong>/g;
$fullforecast =~ s/WIND WARNING ENDED, $forecastPlaceName/<strong class="warning"><a target='_blank' href="$warnLink">WIND WARNING ENDED<\/a><\/strong>/g;
$fullforecast =~ s/RAINFALL WARNING ENDED, $forecastPlaceName/<strong class="warning"><a target='_blank' href="$warnLink">RAINFALL WARNING ENDED<\/a><\/strong>/g;
$fullforecast =~ s/FREEZING RAIN WARNING ENDED, $forecastPlaceName/<strong class="warning"><a target='_blank' href="$warnLink">FREEZING RAIN WARNING ENDED<\/a><\/strong>/g;
$fullforecast =~ s/FREEZING DRIZZLE WARNING ENDED, $forecastPlaceName/<strong class="warning"><a target='_blank' href="$warnLink">FREEZING DRIZZLE WARNING ENDED<\/a><\/strong>/g;
$fullforecast =~ s/WINTER STORM WARNING ENDED, $forecastPlaceName/<strong class="warning"><a target='_blank' href="$warnLink">WINTER STORM ENDED<\/a><\/strong>/g;
$fullforecast =~ s/WIND WARNING , $forecastPlaceName/<strong class="warning"><a class="warning" href="$warnLink">WIND WARNING IN EFFECT<\/a><\/strong>/g;
$fullforecast =~ s/FREEZING RAIN WARNING , $forecastPlaceName/<strong class="warning"><a target='_blank' href="$warnLink">FREEZING RAIN WARNING IN EFFECT<\/a><\/strong>/g;
$fullforecast =~ s/FREEZING DRIZZLE WARNING , $forecastPlaceName/<strong class="warning"><a target='_blank' href="$warnLink">FREEZING DRIZZLE WARNING IN EFFECT<\/a><\/strong>/g;
$fullforecast =~ s/WINTER STORM WARNING , $forecastPlaceName/<strong class="warning"><a target='_blank' href="$warnLink">WINTER STORM WARNING IN EFFECT<\/a><\/strong>/g;
$fullforecast =~ s/WINTER STORM WATCH , $forecastPlaceName/<strong class="warning"><a target='_blank' href="$warnLink">WINTER STORM WATCH IN EFFECT<\/a><\/strong>/g;
$fullforecast =~ s/RAINFALL WARNING , $forecastPlaceName/<strong class="warning"><a target='_blank' href="$warnLink">RAINFALL WARNING IN EFFECT<\/a><\/strong>/g;
$fullforecast =~ s/SNOWFALL WARNING , $forecastPlaceName/<strong class="warning"><a target='_blank' href="$warnLink">SNOWFALL WARNING  IN EFFECT<\/a><\/strong>/g;
$fullforecast =~ s/SPECIAL WEATHER STATEMENT , $forecastPlaceName/<strong ><a target='_blank' href="$warnLink">SPECIAL WEATHER STATEMENT IN EFFECT<\/a><\/strong>/g;
$fullforecast =~ s/SPECIAL AIR QUALITY STATEMENT , $forecastPlaceName/<strong class="warning"><a target='_blank' href="$warnLink">SPECIAL AIR QUALITY STATEMENT IN EFFECT<\/a><\/strong>/g;
$fullforecast =~ s/SEVERE THUNDERSTORM WATCH , $forecastPlaceName/<strong class="warning"><a target='_blank' href="$warnLink">SEVERE THUNDERSTORM WATCH IN EFFECT<\/a><\/strong>/g;
$fullforecast =~ s/SEVERE THUNDERSTORM WARNING , $forecastPlaceName/<strong class="warning"><a target='_blank' href="$warnLink">SEVERE THUNDERSTORM WARNING IN EFFECT<\/a><\/strong>/g;
$fullforecast =~ s/HEAT WARNING , $forecastPlaceName/<strong class="warning"><a target='_blank' href="$warnLink">HEAT WARNING IN EFFECT<\/a><\/strong>/g;
$fullforecast =~ s/Persons in or near this area should be on the lookout for adverse weather conditions and take necessary safety precautions./<br\/>/g;
$fullforecast =~ s/No watches or warnings in effect./<strong><a target='_blank' href="$warnLink">No watches or warnings in effect.<\/a><\/strong>/g;
$fullforecast =~ s/FOG ADVISORY IN EFFECT, $forecastPlaceName/<strong><a target='_blank' href="$warnLink">FOG ADVISORY IN EFFECT<\/a><\/strong>/g;
$fullforecast =~ s/SMOG WARNING , $forecastPlaceName/<strong><a target='_blank' href="$warnLink">SMOG WARNING<\/a><\/strong>/g;

my $copyrightEC = "<span style='font-size: xx-small;'>" . $footerMsg . " - Powered by <a href='https://github.com/chrisale/ECForecastGrabber' target='_blank'> ECForecastGrabber</a></span>";
$fullforecast = $fullforecast . $copyrightEC;

##NOW WE STICK THEM ALL IN A FINAL COMMA DELIMITED LIST AND PUT THEM IN A FILE READY TO INGEST
my $finalconditions = "ECTime;" . $obstime . "ECTemp;" . $temp . "ECPressure;" . $pressure . "ECTrend;" . $pressuretrend . "ECHumidity;" . $humidity . "ECChill;" . $chill . "ECDew;" . $dew . "ECWind;" . $wind . "ECAirQ;" . $airq . "ECForecast;" . $fullforecast;
#$finalconditions = "ECTime;" . $obstime . "ECTemp;" . $temp . "ECPressure;" . $pressure . "ECTrend;" . $pressuretrend . "ECHumidity;" . $humidity . "ECChill;" . "N/A;" . "ECDew;" . $dew . "ECWind;" . $wind . "ECAirQ;" . $airq . "ECForecast;" . $fullforecast;

### VALID HTML PAGE PREAMBLE AND POSTAMBLE
my $htmlPreamble = "<!DOCTYPE html><html lang='en'><head><title>EC Forecast Grabber</title><meta charset='utf-8' />" . $mainStyleElement . "</head><body>";
my $htmlPostamble = "</body></html>";

##NOW make one 
$finalconditions = $htmlPreamble . $fullforecast . $htmlPostamble;
#$finalconditions = "ECTime;" . $obstime . "ECTemp;" . $temp . "ECPressure;" . $pressure . "ECTrend;" . $pressuretrend . "ECHumidity;" . $humidity . "ECChill;" . "N/A;" . "ECDew;" . $dew . "ECWind;" . $wind . "ECAirQ;" . $airq . "ECForecast;" . $fullforecast;


#print $finalconditions;
#unlink($outputConditionsandForecastfile);
unlink($outputForecastOnlyfile);

#open(curdata, ">>$outputConditionsandForecastfile");
#print curdata ($finalconditions);
#close(curdata);

open(forecastData, ">>$outputForecastOnlyfile");
print forecastData ($finalconditions);
close(forecastData);
