#!/usr/bin/perl
# use module
use FindBin; ## MAKE SURE TO ADD THE LOCAL PATH FOR THE MODULES
use File::Spec;
use lib File::Spec->catdir($FindBin::Bin);
use XML::LibXML;
use XML::LibXML::XPathContext;
use Data::Dumper;
use HTTP::Date;
use Time::Piece;
use utf8;
use Encode;
use ECFGMarine;
use ECFGGeneral;
use ECFGWarnings;
use ECFGTseshaht;
#use warnings;
#use diagnostics;
## Version of the Script
my $perlversion = $ENV{'perlversion'};

## Time the script was run
my $time = localtime->strftime('%b %d %Y %H:%M:%S %Z');

## Adding trailing slash from user configuration
my $perlWebPath = $ENV{'perlwebPath'};
$perlWebPath = $perlWebPath . '/';

## XML file is the source of all data from Environment Canada
my $xmlFile = $ENV{'perlxmlFile'};

## Switch to determine if using Indigenous Translation
my $enableIndigenous = $ENV{'perlenableIndigenous'};

## Switch to determine if we are translating to Nuuchahnulth
my $enableTseshaht = $ENV{'perlenableTseshaht'};

## Switch to determine if we are translating to Nuuchahnulth
my $enableMarine = $ENV{'perlenableMarine'};

## Temporary text file 
my $outputForecastOnlyfile = $ENV{'perlfinalForecasttmp'};

## Placeholder as we were doing current conditions at one point.
my $outputConditionsandForecastfile = 'ECCurCondTmp.txt';

## Environment Canada Beginning of URL to the source forecast file.
#my $forecastURL = $ENV{'perlforecastURL'};
my $forecastURL = '';

## Coordinates for the desired forecast location URL.
my $latLong = $ENV{'perllatLong'};

## Recombining the URL into a full address
#$forecastURL = $forecastURL . $latLong;

## Name of the actual forecast location, display name and footer messages
my $forecastPlaceName = $ENV{'perlforecastPlaceName'};
my $forecastName = $ENV{'perlforecastName'};
my $footerMsg = $ENV{'perlfooterMsg'};

##### User input text variables that might use languages with special characters need to be decoded from UTF8 so that they can be processed and then re-encoded into UTF8 at the very end.

utf8::decode($forecastPlaceName);
utf8::decode($forecastName);
utf8::decode($footerMsg);

#####

#my $warnLink = $ENV{'perlwarnLink'};
my $warnLink = '';
my $thunderLink = $ENV{'perlthunderLink'};

##STYLES
my $boldDays = $ENV{'perlboldDays'};
my $textColor = $ENV{'perltextColor'};


##COLOURS 
my $freezeDrizzleWarn = $ENV{'perlfreezeDrizzleWarn'};
my $freezeRainWarn = $ENV{'perlfreezeRainWarn'};
my $freezingTemp = $ENV{'perlfreezingTemp'};
my $nearfreezeTemp = $ENV{'perlnearfreezeTemp'};
my $hotTemp = $ENV{'perlhotTemp'};
my $exhotTemp = $ENV{'perlexhotTemp'};
my $exHumidex = $ENV{'perlexHumidex'};
my $thunderWarn = $ENV{'perlthunderWarn'};
my $flurriesColor = $ENV{'perlflurriesColor'};
my $windyColor = $ENV{'perlwindyColor'};
my $hRainColor = $ENV{'perlhRainColor'};
my $vhRainColor = $ENV{'perlvhRainColor'};
my $warningColor = $ENV{'perlwarningColor'};
my $endedColor = $ENV{'perlendedColor'};
my $yellowWarnColor = $ENV{'perlyellowWarnColor'};
my $orangeWarnColor = $ENV{'perlorangeWarnColor'};
my $redWarnColor = $ENV{'perlredWarnColor'};


my $comma = ";";

my $forecastlinkpreamble = "<strong><a target='_blank' id='curforcst' href='";
my $forecastlinkpostamble = "'>";
my $forecastnamepostamble = "</a></strong>";

$xmlFile = $perlWebPath . $xmlFile;
$outputForecastOnlyfile = $perlWebPath . $outputForecastOnlyfile;
$outputConditionsandForecastfile = $perlWebPath . $outputConditionsandForecastfile;

# reading XML file and registering a new path context from the ECCC context
# https://grantm.github.io/perl-libxml-by-example/namespaces.html

my $dom = XML::LibXML->load_xml(location => $xmlFile, no_blanks => 1);
my $xpc = XML::LibXML::XPathContext->new($dom);
$xpc->registerNs('eccc', 'http://www.w3.org/2005/Atom');

#my $uri = $xpc->lookupNs('eccc');
#print $uri;



#Storing the whole document from the <feed> element onward
#my($fullXMLDoc) = $xpc->findnodes('//eccc:feed') or die "No metadata";

#print "yes";
#print 'XPath: /title   Matched: ', $stuff;
#print "no/n";

#print "hello";


##GET ALL ID TAGS SO THEY CAN ACT AS KEYS TO IDENTIFY EVERY
#ENTRY IN THE DOCUMENT UNIQUELY

foreach my $el ($xpc->findnodes('//eccc:id', $xmlFile)) {
    my $value = $el->to_literal or next;
    push(@weatherkeys, $value);
    
}



## IF THE CURRENT CONDITIONS ARE OFFLINE THEN WE DON"T DO ANYTHING HERE AND JUST SWITCH TO GETTING THE FIRST (0) LINE SO IT DOESN"T GET THE FORECAST BY MISTAKE

my %weatherkeyfinal;
    
foreach (@weatherkeys) {
    if (index($_, 'fc0:') != -1) {
    $weatherkeyfinal[0] = $_;
    }
    if (index($_, 'fc1:') != -1) {
    $weatherkeyfinal[1] = $_;
    }
    if (index($_, 'fc2:') != -1) {
    $weatherkeyfinal[2] = $_;
    }
    if (index($_, 'fc3:') != -1) {
    $weatherkeyfinal[3] = $_;
    }
    if (index($_, 'fc4:') != -1) {
    $weatherkeyfinal[4] = $_;
    }
    if (index($_, 'fc5:') != -1) {
    $weatherkeyfinal[5] = $_;
    }
    if (index($_, 'fc6:') != -1) {
    $weatherkeyfinal[6] = $_;
    }
    if (index($_, 'fc7:') != -1) {
    $weatherkeyfinal[7] = $_;
    }
    if (index($_, 'fc8:') != -1) {
    $weatherkeyfinal[8] = $_;
    }
    if (index($_, 'fc9:') != -1) {
    $weatherkeyfinal[9] = $_;
    }
    if (index($_, 'fc10:') != -1) {
    $weatherkeyfinal[10] = $_;
    }
    if (index($_, 'fc11:') != -1) {
    $weatherkeyfinal[11] = $_;
    }
     if (index($_, 'fc12:') != -1) {
    $weatherkeyfinal[12] = $_;
    }
     if (index($_, 'fc13:') != -1) {
    $weatherkeyfinal[13] = $_;
    }
    if (index($_, 'cc') != -1) {
    $currentconditionskey = $_;
    }
    if (index($_, 'w1') != -1) {
    $warning[0] = $_;
    }
    if (index($_, 'w2') != -1) {
    $warning[1] = $_;
    }
    if (index($_, 'w3') != -1) {
    $warning[2] = $_;
    }
    if (index($_, 'regular_forecast:') != -1) {
    $weatherkeyfinal[14] = $_;
    }
    if (index($_, 'waves:') != -1) {
    $weatherkeyfinal[15] = $_;
    }
    if (index($_, 'extended_forecast:') != -1) {
    $weatherkeyfinal[16] = $_;
    }
    
    }


#my @nodes = $xpc->findnodes("/books/book/authors/author/ firstname[text( )='Tom']/../ lastname[text( )='Christiansen']/ ancestor::book/title/text( )");

my $allforecast = '';


my %titles_by_id;
my %summary_by_id;

## Getting all of the entries from the XML file (ECCCC context is set at the top thanks to the xmlns attribute in the document.)

for my $entry ($xpc->findnodes('//eccc:entry')) {

#Getting stuff we need from each "node" based on looping through each entry that we just stored.

    my ($id_node)    = $xpc->findnodes('eccc:id',    $entry);
    my ($title_node) = $xpc->findnodes('eccc:title', $entry);
    my ($summary_node) = $xpc->findnodes('eccc:summary', $entry);
    my ($cat_node) = $xpc->findnodes('eccc:category', $entry);
    
    
#Checking the Term for each entry so we can grab the links from them.

    if ($cat_node && $cat_node->hasAttribute('term')) {
        my $term = $cat_node->getAttribute('term');
        
        if ($term eq "Warnings and Watches") {
        my ($link_node) = $xpc->findnodes('eccc:link', $entry);
        $warnLink = $link_node->getAttribute('href');
        #print $warnLink;        
       
        }
        
        if ($term eq "Current Condtions") {
        my ($link_node) = $xpc->findnodes('eccc:link', $entry);
        my $conditionsLink = $link_node->getAttribute('href');
       
        }
        
        if ($term eq "Weather Forecasts") {
        my ($link_node) = $xpc->findnodes('eccc:link', $entry);
        $forecastURL = $link_node->getAttribute('href');
        print $forecastURL;
        }
        
        
    }

# Now create variables and arrays for the titles and summaries based on each id.

    next unless $id_node && $title_node;

    my $id    = $id_node->textContent;
    my $title = $title_node->textContent;
    my $summary = $summary_node->textContent;

    $titles_by_id{$id} = $title;
    $summary_by_id{$id} = $summary;
}



foreach (@weatherkeyfinal) {
$allforecast = $allforecast . $titles_by_id{$_};
$allforecast = $allforecast . $summary_by_id{$_};
}








my $forecastlink = $forecastlinkpreamble . $forecastURL . $forecastlinkpostamble . $forecastName . $forecastnamepostamble;
my %weatherkeyfinal;
my %warning;





#print $allforecast;
$currentconditions = $summary_by_id{$currentconditionskey};
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
#print "\n";

######
######
#### SECTION 2 - NOW WE DO THE FORECAST ###
######
######

my $fullforecast = '';



$fullforecast = $forecastlink . " - ";

#Build warning at top with the name of the place.

my $warn2 = "_";
my $warn3 = "_";


$warn1 = $titles_by_id{$warning[0]};

#Build warning2 at top with the name of the place.
$warn2 = $titles_by_id{$warning[1]};

#Build warning2 at top with the name of the place.
$warn3 = $titles_by_id{$warning[2]};

$fullforecast = $fullforecast . $warn1 . " - " . $warn2 . " - " . $warn3;

#print $fullforecast;
#Build in the warning content if there is any.

$warn1content = $summary_by_id{$warning[0]};
$warn1content =~ s/Issued:(.*)/<a target='_blank' href="$warnLink">Statement Issued $1 <\/a> - - /g;
#Build in the warning2 content if there is any.
$warn2content = $summary_by_id{$warning[1]};
$warn2content =~ s/Issued:(.*)/<a target='_blank' href="$warnLink">Statement Issued $1 <\/a> - - /g;
#Build in the warning3 content if there is any.
$warn3content = $summary_by_id{$warning[2]};
$warn3content =~ s/Issued:(.*)/<a target='_blank' href="$warnLink">Statement Issued $1 <\/a> - - /g;



$fullforecast = $fullforecast . $warn1content . $warn2content . $warn3content;


$issued = $summary_by_id{$weatherkeyfinal[0]};
$issued =~ s/^(.*)Forecast/Forecast/g;
$issued =~ s/^(.*)Prévisions/Prévisions/g;
$fullforecast = $fullforecast . "<hr><em>" . $issued . "</em> - ";


=for comment
IF ENVIRONMENT CANADA IS NOT SHOWING CURRENT CONDITIONS IT WILL BREAK THE RSS FEED AND SHIFT EVERYTHING UP A LEVEL IN THE XML  THERE ARE TWO IDENTICAL SECTIONS HERE, THE FIRST WITH THE VALUES SHIFTED, THE SECOND WITHOUT


$day1 = $data->{channel}->{item}->[1]->{title};
$day1 =~ s/:(.*)$/: /g;
$fullforecast = $fullforecast . $day1;
$day1dc = $data->{channel}->{item}->[1]->{description};
$day1dc =~ s/Forecast(.*)$//g;
$day1dc =~ s/Prévisions(.*)$//g;
$fullforecast = $fullforecast . $day1dc;

$day2 = $data->{channel}->{item}->[2]->{title};
$day2 =~ s/:(.*)$/: /g;
$fullforecast = $fullforecast . $day2;
$day2dc = $data->{channel}->{item}->[2]->{description};
$day2dc =~ s/Forecast(.*)$//g;
$day2dc =~ s/Prévisions(.*)$//g;
$fullforecast = $fullforecast . $day2dc;

$day3 = $data->{channel}->{item}->[3]->{title};
$day3 =~ s/:(.*)$/: /g;
$fullforecast = $fullforecast . $day3;
$day3dc = $data->{channel}->{item}->[3]->{description};
$day3dc =~ s/Forecast(.*)$//g;
$day3dc =~ s/Prévisions(.*)$//g;
$fullforecast = $fullforecast . $day3dc;

$day4 = $data->{channel}->{item}->[4]->{title};
$day4 =~ s/:(.*)$/: /g;
$fullforecast = $fullforecast . $day4;
$day4dc = $data->{channel}->{item}->[4]->{description};
$day4dc =~ s/Forecast(.*)$//g;
$day4dc =~ s/Prévisions(.*)$//g;
$fullforecast = $fullforecast . $day4dc;

$day5 = $data->{channel}->{item}->[5]->{title};
$day5 =~ s/:(.*)$/: /g;
$fullforecast = $fullforecast . $day5;
$day5dc = $data->{channel}->{item}->[5]->{description};
$day5dc =~ s/Forecast(.*)$//g;
$day5dc =~ s/Prévisions(.*)$//g;
$fullforecast = $fullforecast . $day5dc;

$day6 = $data->{channel}->{item}->[6]->{title};
$day6 =~ s/:(.*)$/: /g;
$fullforecast = $fullforecast . $day6;
$day6dc = $data->{channel}->{item}->[6]->{description};
$day6dc =~ s/Forecast(.*)$//g;
$day6dc =~ s/Prévisions(.*)$//g;
$fullforecast = $fullforecast . $day6dc;

$day7 = $data->{channel}->{item}->[7]->{title};
$day7 =~ s/:(.*)$/: /g;
$fullforecast = $fullforecast . $day7;
$day7dc = $data->{channel}->{item}->[7]->{description};
$day7dc =~ s/Forecast(.*)$//g;
$day7dc =~ s/Prévisions(.*)$//g;
$fullforecast = $fullforecast . $day7dc;
=cut

=for comment
IF ENVIRONMENT CANADA IS NOT SHOWING CURRENT CONDITIONS IT WILL BREAK THE RSS FEED AND SHIFT EVERYTHING UP A LEVEL IN THE XML  THERE ARE TWO IDENTICAL SECTIONS HERE, THE FIRST WITH THE VALUES SHIFTED, THE SECOND WITHOUT
=cut

$day1 = $titles_by_id{$weatherkeyfinal[0]};
$day1 =~ s/:(.*)$/: /g;
$fullforecast = $fullforecast . $day1;
$day1dc = $summary_by_id{$weatherkeyfinal[0]};
$day1dc =~ s/Forecast(.*)$//g;
$day1dc =~ s/Prévisions(.*)$//g;
$fullforecast = $fullforecast . $day1dc;


$day2 = $titles_by_id{$weatherkeyfinal[1]};
$day2 =~ s/:(.*)$/: /g;
$fullforecast = $fullforecast . $day2;
$day2dc = $summary_by_id{$weatherkeyfinal[1]};
$day2dc =~ s/Forecast(.*)$//g;
$day2dc =~ s/Prévisions(.*)$//g;
$fullforecast = $fullforecast . $day2dc;

$day3 = $titles_by_id{$weatherkeyfinal[2]};
$day3 =~ s/:(.*)$/: /g;
$fullforecast = $fullforecast . $day3;
$day3dc = $summary_by_id{$weatherkeyfinal[2]};
$day3dc =~ s/Forecast(.*)$//g;
$day3dc =~ s/Prévisions(.*)$//g;
$fullforecast = $fullforecast . $day3dc;

$day4 = $summary_by_id{$weatherkeyfinal[3]};
$day4 =~ s/:(.*)$/: /g;
$fullforecast = $fullforecast . $day4;
$day4dc = $summary_by_id{$weatherkeyfinal[3]};
$day4dc =~ s/Forecast(.*)$//g;
$day4dc =~ s/Prévisions(.*)$//g;
$fullforecast = $fullforecast . $day4dc;

$day5 = $titles_by_id{$weatherkeyfinal[4]};
$day5 =~ s/:(.*)$/: /g;
$fullforecast = $fullforecast . $day5;
$day5dc = $summary_by_id{$weatherkeyfinal[4]};
$day5dc =~ s/Forecast(.*)$//g;
$day5dc =~ s/Prévisions(.*)$//g;
$fullforecast = $fullforecast . $day5dc;

$day6 = $titles_by_id{$weatherkeyfinal[5]};
$day6 =~ s/:(.*)$/: /g;
$fullforecast = $fullforecast . $day6;
$day6dc = $summary_by_id{$weatherkeyfinal[5]};
$day6dc =~ s/Forecast(.*)$//g;
$day6dc =~ s/Prévisions(.*)$//g;
$fullforecast = $fullforecast . $day6dc;

$day7 = $titles_by_id{$weatherkeyfinal[6]};
$day7 =~ s/:(.*)$/: /g;
$fullforecast = $fullforecast . $day7;
$day7dc = $summary_by_id{$weatherkeyfinal[6]};
$day7dc =~ s/Forecast(.*)$//g;
$day7dc =~ s/Prévisions(.*)$//g;
$fullforecast = $fullforecast . $day7dc;

$day8 = $titles_by_id{$weatherkeyfinal[7]};
$day8 =~ s/:(.*)$/: /g;
$fullforecast = $fullforecast . $day8;
$day8dc = $summary_by_id{$weatherkeyfinal[7]};
$day8dc =~ s/Forecast(.*)$//g;
$day8dc =~ s/Prévisions(.*)$//g;
$fullforecast = $fullforecast . $day8dc;

$day9 = $titles_by_id{$weatherkeyfinal[8]};
$day9 =~ s/:(.*)$/: /g;
$fullforecast = $fullforecast . $day9;
$day9dc = $summary_by_id{$weatherkeyfinal[8]};
$day9dc =~ s/Forecast(.*)$//g;
$day9dc =~ s/Prévisions(.*)$//g;
$fullforecast = $fullforecast . $day9dc;

$day10 = $titles_by_id{$weatherkeyfinal[9]};
$day10 =~ s/:(.*)$/: /g;
$fullforecast = $fullforecast . $day10;
$day10dc = $summary_by_id{$weatherkeyfinal[9]};
$day10dc =~ s/Forecast(.*)$//g;
$day10dc =~ s/Prévisions(.*)$//g;
$fullforecast = $fullforecast . $day10dc;

$day11 = $titles_by_id{$weatherkeyfinal[10]};
$day11 =~ s/:(.*)$/: /g;
$fullforecast = $fullforecast . $day11;
$day11dc = $summary_by_id{$weatherkeyfinal[10]};
$day11dc =~ s/Forecast(.*)$//g;
$day11dc =~ s/Prévisions(.*)$//g;
$fullforecast = $fullforecast . $day11dc;

$day12 = $titles_by_id{$weatherkeyfinal[11]};
$day12 =~ s/:(.*)$/: /g;
$fullforecast = $fullforecast . $day12;
$day12dc = $summary_by_id{$weatherkeyfinal[11]};
$day12dc =~ s/Forecast(.*)$//g;
$day12dc =~ s/Prévisions(.*)$//g;
$fullforecast = $fullforecast . $day12dc;

$day13 = $titles_by_id{$weatherkeyfinal[12]};
$day13 =~ s/:(.*)$/: /g;
$fullforecast = $fullforecast . $day13;
$day13dc = $summary_by_id{$weatherkeyfinal[12]};
$day13dc =~ s/Forecast(.*)$//g;
$day13dc =~ s/Prévisions(.*)$//g;
$fullforecast = $fullforecast . $day13dc;

$day14 = $titles_by_id{$weatherkeyfinal[13]};
$day14 =~ s/:(.*)$/: /g;
$fullforecast = $fullforecast . $day14;
$day14dc = $summary_by_id{$weatherkeyfinal[13]};
$day14dc =~ s/Forecast(.*)$//g;
$day14dc =~ s/Prévisions(.*)$//g;
$fullforecast = $fullforecast . $day14dc;

#### BELOW THIS IS THE MARINE FORECAST SECTION AND ONLY APPLIES TO THE MARINE FORECAST


if ($enableMarine eq 'Yes') {
$marineRegForecast = $titles_by_id{$weatherkeyfinal[14]};
### GETTING RID OF EVERYTHING AFTER THE PERIOD IN THE MARINE FORECAST TITLE
$marineRegForecast =~ s/\.(.*)$/ - /g;
$issuedmarineRegForecast = $summary_by_id{$weatherkeyfinal[14]};
##SEARCH FOR THE WORD ISSUED AND EVERYTHING AFTER IT THEN GRAB JUST THAT ADD IN THE WORD ISSUED AGAIN AND END UP WITH JUST THE ISSUED TIME
## GETTING RID OF WHAT WE DO NOT WANT IN THE STRING
$issuedmarineRegForecast =~ s/Issued(.*)$/$1/;
$marineRegForecast = "<em><strong> Marine Forecast Issued " . $1 . "</strong></em>: " . $marineRegForecast;
$fullforecast = $fullforecast . $marineRegForecast;
$marineRegForecastdc = $summary_by_id{$weatherkeyfinal[14]};
### GETTING RID OF THE "ISSUED" TEXT AT THE END OF THE SUMMARY
$marineRegForecastdc =~ s/Issued(.*)$//g;
$fullforecast = $fullforecast . $marineRegForecastdc;

$marineWaves = $titles_by_id{$weatherkeyfinal[15]};
$marineWaves =~ s/\.(.*)$/-/g;
$issuedmarineWaves = $summary_by_id{$weatherkeyfinal[15]};
$issuedmarineWaves =~ s/Issued(.*)$/$1/;
$marineWaves = "<em><strong> Waves Forecast Issued " . $1 . "</strong></em>: " . $marineWaves;
$fullforecast = $fullforecast . $marineWaves;
$marineWavesdc = $summary_by_id{$weatherkeyfinal[15]};
$marineWavesdc  =~ s/Issued(.*)$//g;
$fullforecast = $fullforecast . $marineWavesdc;

$marineExtForecast = $titles_by_id{$weatherkeyfinal[16]};
$marineExtForecast =~ s/-(.*)$/ - /g;
$issuedmarineExtForecast = $summary_by_id{$weatherkeyfinal[16]};
$issuedmarineExtForecast =~ s/Issued(.*)$/$1/;
$marineExtForecast = "<em><strong> Extended Marine Forecast Issued " . $1 . "</strong></em>: " . $marineExtForecast;
$fullforecast = $fullforecast . $marineExtForecast;
$marineExtForecastdc = $summary_by_id{$weatherkeyfinal[16]};
$marineExtForecastdc =~ s/Issued(.*)$//g;
$fullforecast = $fullforecast . $marineExtForecastdc;
$fullforecast =~ s/<br\/>//g;
}




$issued = $summary_by_id{$weatherkeyfinal[0]};
$issued =~ s/^(.*)Forecast/Forecast/g;


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

#General Weather Changes in ECFGGeneral.pm

$fullforecast = general_weather($fullforecast,$warnLink,$thunderLink,$boldDays,$textColor,$freezeDrizzleWarn,$freezeRainWarn,$freezingTemp,$nearfreezeTemp,$hotTemp,$exhotTemp,$exHumidex,$thunderWarn,$flurriesColor,$windyColor,$hRainColor,$vhRainColor,$warningColor,$endedColor,$yellowWarnColor,$orangeWarnColor,$redWarnColor,$comma,$forecastlink,$warning[0],$warning[1],$warning[2],$forecastPlaceName,$forecastName,$footerMsg,$mainStyleElement,$daystrongStyle,$drizzstrongStyle,$frainstrongStyle,$flurstrongStyle,$snowflstrongStyle,$snowstrongStyle,$ftempstrongStyle,$htempstrongStyle,$thunderstrongStyle);


#Marine Weather Changes in ECFGMarine.pm


$fullforecast = marine_weather($fullforecast,$warnLink,$thunderLink,$boldDays,$textColor,$freezeDrizzleWarn,$freezeRainWarn,$freezingTemp,$nearfreezeTemp,$hotTemp,$exhotTemp,$exHumidex,$thunderWarn,$flurriesColor,$windyColor,$hRainColor,$vhRainColor,$warningColor,$endedColor,$yellowWarnColor,$orangeWarnColor,$redWarnColor,$comma,$forecastlink,$warning[0],$warning[1],$warning[2],$forecastPlaceName,$forecastName,$footerMsg,$mainStyleElement,$daystrongStyle,$drizzstrongStyle,$frainstrongStyle,$flurstrongStyle,$snowflstrongStyle,$snowstrongStyle,$ftempstrongStyle,$htempstrongStyle,$thunderstrongStyle);


#Weather Warnings in ECFGWarnings.pm

$fullforecast = warnings_weather($fullforecast,$warnLink,$thunderLink,$boldDays,$textColor,$freezeDrizzleWarn,$freezeRainWarn,$freezingTemp,$nearfreezeTemp,$hotTemp,$exhotTemp,$exHumidex,$thunderWarn,$flurriesColor,$windyColor,$hRainColor,$vhRainColor,$warningColor,$endedColor,$yellowWarnColor,$orangeWarnColor,$redWarnColor,$comma,$forecastlink,$warning[0],$warning[1],$warning[2],$forecastPlaceName,$forecastName,$footerMsg,$mainStyleElement,$daystrongStyle,$drizzstrongStyle,$frainstrongStyle,$flurstrongStyle,$snowflstrongStyle,$snowstrongStyle,$ftempstrongStyle,$htempstrongStyle,$thunderstrongStyle);




## INDIGENOUS TRANSLATION SECTION First Check to see if Indigenous Translation is enabled.

if ($enableIndigenous eq 'Yes') {

# A reference for UTF8 characters to make inserting various letters and symbols easier.
# W3SCHOOLS is a good reference! https://www.w3schools.com/charsets/ref_utf_diacritical.asp
# &ccaron; = č
# &scaron; = š
# &#411; = ƛ
# &lstrok; = ł
# &#x313; = adds upper comma
# &#803; = adds dot below
# &#695; = adds a w
# &#x301; = right accent above
# &#x300; = left accent (grave) above
# &#660; = glottal stop
# &#705; = reverse glottal stop ʕ
# &#x780; = caron above
#my $indigenous = " Indigenous Languages are Enabled.";
#$fullforecast = $fullforecast . $indigenous;

## Which language are we using, there is no else.

	if ($enableTseshaht eq 'Yes') {
	
	#$fullforecast = $fullforecast . "TEST VALUES: Forecast - rain - showers - Showers - cloudy - Cloudy periods - wind - Windy - Snow - Fog - Frost - Thunderstorms - Hail - ";
	## Sunny Translated to "It is a beautiful day today" https://nuuchahnulth.org/language/phrases/it-beautiful-day-today
	# Hupacasath https://www.hupacasath.ca/about-us/language-culture/
	# https://www.hupacasath.ca/wp-content/uploads/2022/01/waterwashighway_outlines-1.pdf
	# https://www.hupacasath.ca/wp-content/uploads/2022/01/HupacasathFOURSEASONS1.pdf
	# Best Tseshaht Dictionary https://www.firstvoices.com/explore/FV/sections/Data/c̕išaa%CA%94atḥ/Nuučaan̓u%C9%AB/c̕išaa%CA%94atḥ/learn/words?category=d9e9a334-e02a-474f-be58-e2492ed71d24
	
	#Weather Translations for ECFGTseshaht.pm

$fullforecast = tseshaht_weather($fullforecast,$warnLink,$thunderLink,$boldDays,$textColor,$freezeDrizzleWarn,$freezeRainWarn,$freezingTemp,$nearfreezeTemp,$hotTemp,$exhotTemp,$exHumidex,$thunderWarn,$flurriesColor,$windyColor,$hRainColor,$vhRainColor,$warningColor,$endedColor,$yellowWarnColor,$orangeWarnColor,$redWarnColor,$comma,$forecastlink,$warning[0],$warning[1],$warning[2],$forecastPlaceName,$forecastName,$footerMsg,$mainStyleElement,$daystrongStyle,$drizzstrongStyle,$frainstrongStyle,$flurstrongStyle,$snowflstrongStyle,$snowstrongStyle,$ftempstrongStyle,$htempstrongStyle,$thunderstrongStyle);
	}
}
## If Indigenous language is not enabled, don't need to do much but for debugging, adding a message is good, or future feature.

else {

my $indigenous = "";
$fullforecast = $fullforecast . $indigenous;

}

$fullforecast =~ s/<br\/>//g;

## Getting rid of the <br>

if ($enableIndigenous eq 'No') {
my $copyrightEC = "<span style='font-size: xx-small;'><br>" . $footerMsg . " - Generated " . $time . " - Powered by <a href='https://github.com/chrisale/ECForecastGrabber' target='_blank'> ECForecastGrabber-" . $perlversion . "</a></span>";
$fullforecast = $fullforecast . $copyrightEC;
}
else {
my $copyrightEC = "<span style='font-size: xx-small;'>" . $footerMsg . " - Generated " . $time . " - Powered by <a href='https://github.com/chrisale/ECForecastGrabber' target='_blank'> ECForecastGrabber-" . $perlversion . "</a></span>";
$fullforecast = $fullforecast . $copyrightEC;
}

##NOW WE STICK THEM ALL IN A FINAL COMMA DELIMITED LIST AND PUT THEM IN A FILE READY TO INGEST

my $finalconditions = "ECTime;" . $obstime . "ECTemp;" . $temp . "ECPressure;" . $pressure . "ECTrend;" . $pressuretrend . "ECHumidity;" . $humidity . "ECChill;" . $chill . "ECDew;" . $dew . "ECWind;" . $wind . "ECAirQ;" . $airq . "ECForecast;" . $fullforecast;

#$finalconditions = "ECTime;" . $obstime . "ECTemp;" . $temp . "ECPressure;" . $pressure . "ECTrend;" . $pressuretrend . "ECHumidity;" . $humidity . "ECChill;" . "N/A;" . "ECDew;" . $dew . "ECWind;" . $wind . "ECAirQ;" . $airq . "ECForecast;" . $fullforecast;

### VALID HTML PAGE PREAMBLE AND POSTAMBLE

my $htmlPreamble = "<!DOCTYPE html><html lang='en'><head><title>EC Forecast Grabber for ". $forecastPlaceName . "</title><meta charset='utf-8' http-equiv='refresh' content='15'/>" . $mainStyleElement . "</head><body>";
my $htmlPostamble = "</body></html>";




##NOW make the final output. 
$finalconditions = $htmlPreamble . $fullforecast . $htmlPostamble;

##Encoding the output in UTF8 for language support.
utf8::encode($finalconditions);
#$finalconditions = encode("UTF-8", $finalconditions).

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
