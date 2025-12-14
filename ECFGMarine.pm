#!/usr/bin/perl
# use moduleuse XML::Simple;
package ECFGMarine;
use XML::Simple;
use Data::Dumper;
use HTTP::Date;
use utf8;
use Encode;
use Exporter;

our @ISA= qw(Exporter);

# these CAN be exported.
our @EXPORT_OK = qw( marine_weather export_me_too );

# these are exported by default.
our @EXPORT = qw( marine_weather );

sub marine_weather {
#print "hello";

	my ($fullforecast,$warnLink,$thunderLink,$boldDays,$textColor,$freezeDrizzleWarn,$freezeRainWarn,$freezingTemp,$nearfreezeTemp,$hotTemp,$exhotTemp,$exHumidex,$thunderWarn,$flurriesColor,$windyColor,$hRainColor,$vhRainColor,$warningColor,$endedColor,$yellowWarnColor,$orangeWarnColor,$redWarnColor,$comma,$forecastlink,$warnings,$warnings2,$warnings3,$forecastPlaceName,$forecastName,$footerMsg,$mainStyleElement,$daystrongStyle,$drizzstrongStyle,$frainstrongStyle,$flurstrongStyle,$snowflstrongStyle,$snowstrongStyle,$ftempstrongStyle,$htempstrongStyle,$thunderstrongStyle) = @_;

#MARINE WINDS
$fullforecast =~ s/variable 5 to 10/<strong style="color: $windyColor">variable 5 to 10 <\/strong>/g;
$fullforecast =~ s/variable 5 to 15/<strong style="color: $windyColor">variable 5 to 15 <\/strong>/g;
$fullforecast =~ s/variable 10 to 20/<strong style="color: $windyColor">variable 10 to 20 <\/strong>/g;

$fullforecast =~ s/ north 5 to 10/<strong style="color: $windyColor"> north 5 to 10<\/strong>/g;
$fullforecast =~ s/ north 5 to 15/<strong style="color: $windyColor"> north 5 to 15<\/strong>/g;
$fullforecast =~ s/ north 10 to 20/<strong style="color: $windyColor"> north 10 to 20<\/strong>/g;
$fullforecast =~ s/ north 15 to 25/<strong style="color: $windyColor"> north 15 to 25<\/strong>/g;
$fullforecast =~ s/ north 20 to 30/<strong style="color: $windyColor"> north 20 to 30<\/strong>/g;
$fullforecast =~ s/ north 25 to 35/<strong style="color: $windyColor"> north 25 to 35<\/strong>/g;
$fullforecast =~ s/ north 30 to 40/<strong style="color: $windyColor"> north 30 to 40<\/strong>/g;
$fullforecast =~ s/ north 35 to 45/<strong style="color: $windyColor"> north 35 to 45<\/strong>/g;
$fullforecast =~ s/ north 40 to 50/<strong style="color: $windyColor"> north 40 to 50<\/strong>/g;
$fullforecast =~ s/ north 45 to 55/<strong style="color: $windyColor"> north 45 to 55<\/strong>/g;
$fullforecast =~ s/ north 50 to 60/<strong style="color: $windyColor"> north 50 to 60<\/strong>/g;
$fullforecast =~ s/ north 55 to 65/<strong style="color: $windyColor"> north 55 to 65<\/strong>/g;
$fullforecast =~ s/ north 70 to 75/<strong style="color: $windyColor"> north 70 to 75<\/strong>/g;
$fullforecast =~ s/ north 80 to 90/<strong style="color: $windyColor"> north 80 to 90<\/strong>/g;

$fullforecast =~ s/northeast 5 to 10/<strong style="color: $windyColor">northeast 5 to 10<\/strong>/g;
$fullforecast =~ s/northeast 5 to 15/<strong style="color: $windyColor">northeast 5 to 15<\/strong>/g;
$fullforecast =~ s/northeast 10 to 20/<strong style="color: $windyColor">northeast 10 to 20<\/strong>/g;
$fullforecast =~ s/northeast 15 to 25/<strong style="color: $windyColor">northeast 15 to 25<\/strong>/g;
$fullforecast =~ s/northeast 20 to 30/<strong style="color: $windyColor">northeast 20 to 30<\/strong>/g;
$fullforecast =~ s/northeast 25 to 35/<strong style="color: $windyColor">northeast 25 to 35<\/strong>/g;
$fullforecast =~ s/northeast 30 to 40/<strong style="color: $windyColor">northeast 30 to 40<\/strong>/g;
$fullforecast =~ s/northeast 35 to 45/<strong style="color: $windyColor">northeast 35 to 45<\/strong>/g;
$fullforecast =~ s/northeast 40 to 50/<strong style="color: $windyColor">northeast 40 to 50<\/strong>/g;
$fullforecast =~ s/northeast 45 to 55/<strong style="color: $windyColor">northeast 45 to 55<\/strong>/g;
$fullforecast =~ s/northeast 50 to 60/<strong style="color: $windyColor">northeast 50 to 60<\/strong>/g;
$fullforecast =~ s/northeast 55 to 65/<strong style="color: $windyColor">northeast 55 to 65<\/strong>/g;
$fullforecast =~ s/northeast 70 to 75/<strong style="color: $windyColor">northeast 70 to 75<\/strong>/g;
$fullforecast =~ s/northeast 80 to 90/<strong style="color: $windyColor">northeast 80 to 90<\/strong>/g;

$fullforecast =~ s/ east 5 to 10/<strong style="color: $windyColor"> east 5 to 10<\/strong>/g;
$fullforecast =~ s/ east 5 to 15/<strong style="color: $windyColor"> east 5 to 15<\/strong>/g;
$fullforecast =~ s/ east 10 to 20/<strong style="color: $windyColor"> east 10 to 20<\/strong>/g;
$fullforecast =~ s/ east 15 to 25/<strong style="color: $windyColor"> east 15 to 25<\/strong>/g;
$fullforecast =~ s/ east 20 to 30/<strong style="color: $windyColor"> east 20 to 30<\/strong>/g;
$fullforecast =~ s/ east 25 to 35/<strong style="color: $windyColor"> east 25 to 35<\/strong>/g;
$fullforecast =~ s/ east 30 to 40/<strong style="color: $windyColor"> east 30 to 40<\/strong>/g;
$fullforecast =~ s/ east 35 to 45/<strong style="color: $windyColor"> east 35 to 45<\/strong>/g;
$fullforecast =~ s/ east 40 to 50/<strong style="color: $windyColor"> east 40 to 50<\/strong>/g;
$fullforecast =~ s/ east 45 to 55/<strong style="color: $windyColor"> east 45 to 55<\/strong>/g;
$fullforecast =~ s/ east 50 to 60/<strong style="color: $windyColor"> east 50 to 60<\/strong>/g;
$fullforecast =~ s/ east 55 to 65/<strong style="color: $windyColor"> east 55 to 65<\/strong>/g;
$fullforecast =~ s/ east 70 to 75/<strong style="color: $windyColor"> east 70 to 75<\/strong>/g;
$fullforecast =~ s/ east 80 to 90/<strong style="color: $windyColor"> east 80 to 90<\/strong>/g;

$fullforecast =~ s/southeast 5 to 10/<strong style="color: $windyColor">southeast 5 to 10<\/strong>/g;
$fullforecast =~ s/southeast 5 to 15/<strong style="color: $windyColor">southeast 5 to 15<\/strong>/g;
$fullforecast =~ s/southeast 10 to 20/<strong style="color: $windyColor">southeast 10 to 20<\/strong>/g;
$fullforecast =~ s/southeast 15 to 25/<strong style="color: $windyColor">southeast 15 to 25<\/strong>/g;
$fullforecast =~ s/southeast 20 to 30/<strong style="color: $windyColor">southeast 20 to 30<\/strong>/g;
$fullforecast =~ s/southeast 25 to 35/<strong style="color: $windyColor">southeast 25 to 35<\/strong>/g;
$fullforecast =~ s/southeast 30 to 40/<strong style="color: $windyColor">southeast 30 to 40<\/strong>/g;
$fullforecast =~ s/southeast 35 to 45/<strong style="color: $windyColor">southeast 35 to 45<\/strong>/g;
$fullforecast =~ s/southeast 40 to 50/<strong style="color: $windyColor">southeast 40 to 50<\/strong>/g;
$fullforecast =~ s/southeast 45 to 55/<strong style="color: $windyColor">southeast 45 to 55<\/strong>/g;
$fullforecast =~ s/southeast 50 to 60/<strong style="color: $windyColor">southeast 50 to 60<\/strong>/g;
$fullforecast =~ s/southeast 55 to 65/<strong style="color: $windyColor">southeast 55 to 65<\/strong>/g;
$fullforecast =~ s/southeast 70 to 75/<strong style="color: $windyColor">southeast 70 to 75<\/strong>/g;
$fullforecast =~ s/southeast 80 to 90/<strong style="color: $windyColor">southeast 80 to 90<\/strong>/g;

$fullforecast =~ s/ south 5 to 10/<strong style="color: $windyColor"> south 5 to 10<\/strong>/g;
$fullforecast =~ s/ south 5 to 15/<strong style="color: $windyColor"> south 5 to 15<\/strong>/g;
$fullforecast =~ s/ south 10 to 20/<strong style="color: $windyColor"> south 10 to 20<\/strong>/g;
$fullforecast =~ s/ south 15 to 25/<strong style="color: $windyColor"> south 15 to 25<\/strong>/g;
$fullforecast =~ s/ south 20 to 30/<strong style="color: $windyColor"> south 20 to 30<\/strong>/g;
$fullforecast =~ s/ south 25 to 35/<strong style="color: $windyColor"> south 25 to 35<\/strong>/g;
$fullforecast =~ s/ south 30 to 40/<strong style="color: $windyColor"> south 30 to 40<\/strong>/g;
$fullforecast =~ s/ south 35 to 45/<strong style="color: $windyColor"> south 35 to 45<\/strong>/g;
$fullforecast =~ s/ south 40 to 50/<strong style="color: $windyColor"> south 40 to 50<\/strong>/g;
$fullforecast =~ s/ south 45 to 55/<strong style="color: $windyColor"> south 45 to 55<\/strong>/g;
$fullforecast =~ s/ south 50 to 60/<strong style="color: $windyColor"> south 50 to 60<\/strong>/g;
$fullforecast =~ s/ south 55 to 65/<strong style="color: $windyColor"> south 55 to 65<\/strong>/g;
$fullforecast =~ s/ south 70 to 75/<strong style="color: $windyColor"> south 70 to 75<\/strong>/g;
$fullforecast =~ s/ south 80 to 90/<strong style="color: $windyColor"> south 80 to 90<\/strong>/g;

$fullforecast =~ s/southwest 5 to 10/<strong style="color: $windyColor">southwest 5 to 10<\/strong>/g;
$fullforecast =~ s/southwest 5 to 15/<strong style="color: $windyColor">southwest 5 to 15<\/strong>/g;
$fullforecast =~ s/southwest 10 to 20/<strong style="color: $windyColor">southwest 10 to 20<\/strong>/g;
$fullforecast =~ s/southwest 15 to 25/<strong style="color: $windyColor">southwest 15 to 25<\/strong>/g;
$fullforecast =~ s/southwest 20 to 30/<strong style="color: $windyColor">southwest 20 to 30<\/strong>/g;
$fullforecast =~ s/southwest 25 to 35/<strong style="color: $windyColor">southwest 25 to 35<\/strong>/g;
$fullforecast =~ s/southwest 30 to 40/<strong style="color: $windyColor">southwest 30 to 40<\/strong>/g;
$fullforecast =~ s/southwest 35 to 45/<strong style="color: $windyColor">southwest 35 to 45<\/strong>/g;
$fullforecast =~ s/southwest 40 to 50/<strong style="color: $windyColor">southwest 40 to 50<\/strong>/g;
$fullforecast =~ s/southwest 45 to 55/<strong style="color: $windyColor">southwest 45 to 55<\/strong>/g;
$fullforecast =~ s/southwest 50 to 60/<strong style="color: $windyColor">southwest 50 to 60<\/strong>/g;
$fullforecast =~ s/southwest 55 to 65/<strong style="color: $windyColor">southwest 55 to 65<\/strong>/g;
$fullforecast =~ s/southwest 70 to 75/<strong style="color: $windyColor">southwest 70 to 75<\/strong>/g;
$fullforecast =~ s/southwest 80 to 90/<strong style="color: $windyColor">southwest 80 to 90<\/strong>/g;

$fullforecast =~ s/ west 5 to 10/<strong style="color: $windyColor"> west 5 to 10<\/strong>/g;
$fullforecast =~ s/ west 5 to 15/<strong style="color: $windyColor"> west 5 to 15<\/strong>/g;
$fullforecast =~ s/ west 10 to 20/<strong style="color: $windyColor"> west 10 to 20<\/strong>/g;
$fullforecast =~ s/ west 15 to 25/<strong style="color: $windyColor"> west 15 to 25<\/strong>/g;
$fullforecast =~ s/ west 20 to 30/<strong style="color: $windyColor"> west 20 to 30<\/strong>/g;
$fullforecast =~ s/ west 25 to 35/<strong style="color: $windyColor"> west 25 to 35<\/strong>/g;
$fullforecast =~ s/ west 30 to 40/<strong style="color: $windyColor"> west 30 to 40<\/strong>/g;
$fullforecast =~ s/ west 35 to 45/<strong style="color: $windyColor"> west 35 to 45<\/strong>/g;
$fullforecast =~ s/ west 40 to 50/<strong style="color: $windyColor"> west 40 to 50<\/strong>/g;
$fullforecast =~ s/ west 45 to 55/<strong style="color: $windyColor"> west 45 to 55<\/strong>/g;
$fullforecast =~ s/ west 50 to 60/<strong style="color: $windyColor"> west 50 to 60<\/strong>/g;
$fullforecast =~ s/ west 55 to 65/<strong style="color: $windyColor"> west 55 to 65<\/strong>/g;
$fullforecast =~ s/ west 70 to 75/<strong style="color: $windyColor"> west 70 to 75<\/strong>/g;
$fullforecast =~ s/ west 80 to 90/<strong style="color: $windyColor"> west 80 to 90<\/strong>/g;

$fullforecast =~ s/northwest 5 to 10/<strong style="color: $windyColor">northwest 5 to 10<\/strong>/g;
$fullforecast =~ s/northwest 5 to 15/<strong style="color: $windyColor">northwest 5 to 15<\/strong>/g;
$fullforecast =~ s/northwest 10 to 20/<strong style="color: $windyColor">northwest 10 to 20<\/strong>/g;
$fullforecast =~ s/northwest 15 to 25/<strong style="color: $windyColor">northwest 15 to 25<\/strong>/g;
$fullforecast =~ s/northwest 20 to 30/<strong style="color: $windyColor">northwest 20 to 30<\/strong>/g;
$fullforecast =~ s/northwest 25 to 35/<strong style="color: $windyColor">northwest 25 to 35<\/strong>/g;
$fullforecast =~ s/northwest 30 to 40/<strong style="color: $windyColor">northwest 30 to 40<\/strong>/g;
$fullforecast =~ s/northwest 35 to 45/<strong style="color: $windyColor">northwest 35 to 45<\/strong>/g;
$fullforecast =~ s/northwest 40 to 50/<strong style="color: $windyColor">northwest 40 to 50<\/strong>/g;
$fullforecast =~ s/northwest 45 to 55/<strong style="color: $windyColor">northwest 45 to 55<\/strong>/g;
$fullforecast =~ s/northwest 50 to 60/<strong style="color: $windyColor">northwest 50 to 60<\/strong>/g;
$fullforecast =~ s/northwest 55 to 65/<strong style="color: $windyColor">northwest 55 to 65<\/strong>/g;
$fullforecast =~ s/northwest 70 to 75/<strong style="color: $windyColor">northwest 70 to 75<\/strong>/g;
$fullforecast =~ s/northwest 80 to 90/<strong style="color: $windyColor">northwest 80 to 90<\/strong>/g;

$fullforecast =~ s/ north 5/<strong style="color: $windyColor"> north 5<\/strong>/g;
$fullforecast =~ s/ north 10/<strong style="color: $windyColor"> north 10<\/strong>/g;
$fullforecast =~ s/ north 15/<strong style="color: $windyColor"> north 15<\/strong>/g;
$fullforecast =~ s/ north 20/<strong style="color: $windyColor"> north 20<\/strong>/g;
$fullforecast =~ s/ north 25/<strong style="color: $windyColor"> north 25<\/strong>/g;
$fullforecast =~ s/ north 30/<strong style="color: $windyColor"> north 30<\/strong>/g;
$fullforecast =~ s/ north 35/<strong style="color: $windyColor"> north 35<\/strong>/g;
$fullforecast =~ s/ north 40/<strong style="color: $windyColor"> north 40<\/strong>/g;
$fullforecast =~ s/ north 45/<strong style="color: $windyColor"> north 45<\/strong>/g;
$fullforecast =~ s/ north 50/<strong style="color: $windyColor"> north 50<\/strong>/g;
$fullforecast =~ s/ north 55/<strong style="color: $windyColor"> north 55<\/strong>/g;
$fullforecast =~ s/ north 60/<strong style="color: $windyColor"> north 60<\/strong>/g;
$fullforecast =~ s/ north 65/<strong style="color: $windyColor"> north 65<\/strong>/g;
$fullforecast =~ s/ north 70/<strong style="color: $windyColor"> north 70<\/strong>/g;

$fullforecast =~ s/northeast 5/<strong style="color: $windyColor">northeast 5<\/strong>/g;
$fullforecast =~ s/northeast 10/<strong style="color: $windyColor">northeast 10<\/strong>/g;
$fullforecast =~ s/northeast 15/<strong style="color: $windyColor">northeast 15<\/strong>/g;
$fullforecast =~ s/northeast 20/<strong style="color: $windyColor">northeast 20<\/strong>/g;
$fullforecast =~ s/northeast 25/<strong style="color: $windyColor">northeast 25<\/strong>/g;
$fullforecast =~ s/northeast 30/<strong style="color: $windyColor">northeast 30<\/strong>/g;
$fullforecast =~ s/northeast 35/<strong style="color: $windyColor">northeast 35<\/strong>/g;
$fullforecast =~ s/northeast 40/<strong style="color: $windyColor">northeast 40<\/strong>/g;
$fullforecast =~ s/northeast 45/<strong style="color: $windyColor">northeast 45<\/strong>/g;
$fullforecast =~ s/northeast 50/<strong style="color: $windyColor">northeast 50<\/strong>/g;
$fullforecast =~ s/northeast 55/<strong style="color: $windyColor">northeast 55<\/strong>/g;
$fullforecast =~ s/northeast 60/<strong style="color: $windyColor">northeast 60<\/strong>/g;
$fullforecast =~ s/northeast 65/<strong style="color: $windyColor">northeast 65<\/strong>/g;
$fullforecast =~ s/northeast 70/<strong style="color: $windyColor">northeast 70<\/strong>/g;

$fullforecast =~ s/ east 5/<strong style="color: $windyColor"> east 5<\/strong>/g;
$fullforecast =~ s/ east 10/<strong style="color: $windyColor"> east 10<\/strong>/g;
$fullforecast =~ s/ east 15/<strong style="color: $windyColor"> east 15<\/strong>/g;
$fullforecast =~ s/ east 20/<strong style="color: $windyColor"> east 20<\/strong>/g;
$fullforecast =~ s/ east 25/<strong style="color: $windyColor"> east 25<\/strong>/g;
$fullforecast =~ s/ east 30/<strong style="color: $windyColor"> east 30<\/strong>/g;
$fullforecast =~ s/ east 35/<strong style="color: $windyColor"> east 35<\/strong>/g;
$fullforecast =~ s/ east 40/<strong style="color: $windyColor"> east 40<\/strong>/g;
$fullforecast =~ s/ east 45/<strong style="color: $windyColor"> east 45<\/strong>/g;
$fullforecast =~ s/ east 50/<strong style="color: $windyColor"> east 50<\/strong>/g;
$fullforecast =~ s/ east 55/<strong style="color: $windyColor"> east 55<\/strong>/g;
$fullforecast =~ s/ east 60/<strong style="color: $windyColor"> east 60<\/strong>/g;
$fullforecast =~ s/ east 65/<strong style="color: $windyColor"> east 65<\/strong>/g;
$fullforecast =~ s/ east 70/<strong style="color: $windyColor"> east 70<\/strong>/g;

$fullforecast =~ s/southeast 5/<strong style="color: $windyColor">southeast 5<\/strong>/g;
$fullforecast =~ s/southeast 10/<strong style="color: $windyColor">southeast 10<\/strong>/g;
$fullforecast =~ s/southeast 15/<strong style="color: $windyColor">southeast 15<\/strong>/g;
$fullforecast =~ s/southeast 20/<strong style="color: $windyColor">southeast 20<\/strong>/g;
$fullforecast =~ s/southeast 25/<strong style="color: $windyColor">southeast 25<\/strong>/g;
$fullforecast =~ s/southeast 30/<strong style="color: $windyColor">southeast 30<\/strong>/g;
$fullforecast =~ s/southeast 35/<strong style="color: $windyColor">southeast 35<\/strong>/g;
$fullforecast =~ s/southeast 40/<strong style="color: $windyColor">southeast 40<\/strong>/g;
$fullforecast =~ s/southeast 45/<strong style="color: $windyColor">southeast 45<\/strong>/g;
$fullforecast =~ s/southeast 50/<strong style="color: $windyColor">southeast 50<\/strong>/g;
$fullforecast =~ s/southeast 55/<strong style="color: $windyColor">southeast 55<\/strong>/g;
$fullforecast =~ s/southeast 60/<strong style="color: $windyColor">southeast 60<\/strong>/g;
$fullforecast =~ s/southeast 65/<strong style="color: $windyColor">southeast 65<\/strong>/g;
$fullforecast =~ s/southeast 70/<strong style="color: $windyColor">southeast 70<\/strong>/g;

$fullforecast =~ s/ south 5/<strong style="color: $windyColor"> south 5<\/strong>/g;
$fullforecast =~ s/ south 10/<strong style="color: $windyColor"> south 10<\/strong>/g;
$fullforecast =~ s/ south 15/<strong style="color: $windyColor"> south 15<\/strong>/g;
$fullforecast =~ s/ south 20/<strong style="color: $windyColor"> south 20<\/strong>/g;
$fullforecast =~ s/ south 25/<strong style="color: $windyColor"> south 25<\/strong>/g;
$fullforecast =~ s/ south 30/<strong style="color: $windyColor"> south 30<\/strong>/g;
$fullforecast =~ s/ south 35/<strong style="color: $windyColor"> south 35<\/strong>/g;
$fullforecast =~ s/ south 40/<strong style="color: $windyColor"> south 40<\/strong>/g;
$fullforecast =~ s/ south 45/<strong style="color: $windyColor"> south 45<\/strong>/g;
$fullforecast =~ s/ south 50/<strong style="color: $windyColor"> south 50<\/strong>/g;
$fullforecast =~ s/ south 55/<strong style="color: $windyColor"> south 55<\/strong>/g;
$fullforecast =~ s/ south 60/<strong style="color: $windyColor"> south 60<\/strong>/g;
$fullforecast =~ s/ south 65/<strong style="color: $windyColor"> south 65<\/strong>/g;
$fullforecast =~ s/ south 70/<strong style="color: $windyColor"> south 70<\/strong>/g;

$fullforecast =~ s/southwest 5/<strong style="color: $windyColor">southwest 5<\/strong>/g;
$fullforecast =~ s/southwest 10/<strong style="color: $windyColor">southwest 10<\/strong>/g;
$fullforecast =~ s/southwest 15/<strong style="color: $windyColor">southwest 15<\/strong>/g;
$fullforecast =~ s/southwest 20/<strong style="color: $windyColor">southwest 20<\/strong>/g;
$fullforecast =~ s/southwest 25/<strong style="color: $windyColor">southwest 25<\/strong>/g;
$fullforecast =~ s/southwest 30/<strong style="color: $windyColor">southwest 30<\/strong>/g;
$fullforecast =~ s/southwest 35/<strong style="color: $windyColor">southwest 35<\/strong>/g;
$fullforecast =~ s/southwest 40/<strong style="color: $windyColor">southwest 40<\/strong>/g;
$fullforecast =~ s/southwest 45/<strong style="color: $windyColor">southwest 45<\/strong>/g;
$fullforecast =~ s/southwest 50/<strong style="color: $windyColor">southwest 50<\/strong>/g;
$fullforecast =~ s/southwest 55/<strong style="color: $windyColor">southwest 55<\/strong>/g;
$fullforecast =~ s/southwest 60/<strong style="color: $windyColor">southwest 60<\/strong>/g;
$fullforecast =~ s/southwest 65/<strong style="color: $windyColor">southwest 65<\/strong>/g;
$fullforecast =~ s/southwest 70/<strong style="color: $windyColor">southwest 70<\/strong>/g;

$fullforecast =~ s/ west 5/<strong style="color: $windyColor"> west 5<\/strong>/g;
$fullforecast =~ s/ west 10/<strong style="color: $windyColor"> west 10<\/strong>/g;
$fullforecast =~ s/ west 15/<strong style="color: $windyColor"> west 15<\/strong>/g;
$fullforecast =~ s/ west 20/<strong style="color: $windyColor"> west 20<\/strong>/g;
$fullforecast =~ s/ west 25/<strong style="color: $windyColor"> west 25<\/strong>/g;
$fullforecast =~ s/ west 30/<strong style="color: $windyColor"> west 30<\/strong>/g;
$fullforecast =~ s/ west 35/<strong style="color: $windyColor"> west 35<\/strong>/g;
$fullforecast =~ s/ west 40/<strong style="color: $windyColor"> west 40<\/strong>/g;
$fullforecast =~ s/ west 45/<strong style="color: $windyColor"> west 45<\/strong>/g;
$fullforecast =~ s/ west 50/<strong style="color: $windyColor"> west 50<\/strong>/g;
$fullforecast =~ s/ west 55/<strong style="color: $windyColor"> west 55<\/strong>/g;
$fullforecast =~ s/ west 60/<strong style="color: $windyColor"> west 60<\/strong>/g;
$fullforecast =~ s/ west 65/<strong style="color: $windyColor"> west 65<\/strong>/g;
$fullforecast =~ s/ west 70/<strong style="color: $windyColor"> west 70<\/strong>/g;

$fullforecast =~ s/northwest 5/<strong style="color: $windyColor">northwest 5<\/strong>/g;
$fullforecast =~ s/northwest 10/<strong style="color: $windyColor">northwest 10<\/strong>/g;
$fullforecast =~ s/northwest 15/<strong style="color: $windyColor">northwest 15<\/strong>/g;
$fullforecast =~ s/northwest 20/<strong style="color: $windyColor">northwest 20<\/strong>/g;
$fullforecast =~ s/northwest 25/<strong style="color: $windyColor">northwest 25<\/strong>/g;
$fullforecast =~ s/northwest 30/<strong style="color: $windyColor">northwest 30<\/strong>/g;
$fullforecast =~ s/northwest 35/<strong style="color: $windyColor">northwest 35<\/strong>/g;
$fullforecast =~ s/northwest 40/<strong style="color: $windyColor">northwest 40<\/strong>/g;
$fullforecast =~ s/northwest 45/<strong style="color: $windyColor">northwest 45<\/strong>/g;
$fullforecast =~ s/northwest 50/<strong style="color: $windyColor">northwest 50<\/strong>/g;
$fullforecast =~ s/northwest 55/<strong style="color: $windyColor">northwest 55<\/strong>/g;
$fullforecast =~ s/northwest 60/<strong style="color: $windyColor">northwest 60<\/strong>/g;
$fullforecast =~ s/northwest 65/<strong style="color: $windyColor">northwest 65<\/strong>/g;
$fullforecast =~ s/northwest 70/<strong style="color: $windyColor">northwest 70<\/strong>/g;

#MARINE LOCATIONS
$fullforecast =~ s/Barkley Sound/<strong style="color: $daystrongStyle">Barkley Sound<\/strong>/g;
$fullforecast =~ s/Estevan Point/<strong style="color: $daystrongStyle">Estevan Point<\/strong>/g;

#MARINE WAVES
$fullforecast =~ s/building to/<strong style="color: $hRainColor">building to<\/strong>/g;
$fullforecast =~ s/Seas 1 to 2/<strong style="color: $hRainColor">Seas 1 to 2<\/strong>/g;
$fullforecast =~ s/Seas 2 to 3/<strong style="color: $hRainColor">Seas 2 to 3<\/strong>/g;
$fullforecast =~ s/Seas 3 to 4/<strong style="color: $hRainColor">Seas 3 to 4<\/strong>/g;
$fullforecast =~ s/Seas 3 to 5/<strong style="color: $hRainColor">Seas 3 to 5<\/strong>/g;
$fullforecast =~ s/Seas 4 to 5/<strong style="color: $hRainColor">Seas 4 to 5<\/strong>/g;
$fullforecast =~ s/Seas 4 to 6/<strong style="color: $hRainColor">Seas 4 to 6<\/strong>/g;
$fullforecast =~ s/Seas 5 to 6/<strong style="color: $hRainColor">Seas 5 to 6<\/strong>/g;

$fullforecast =~ s/subsiding to 1 to 3/<strong style="color: $hRainColor">subsiding to 1 to 3<\/strong>/g;
$fullforecast =~ s/subsiding to 2 to 4/<strong style="color: $hRainColor">subsiding to 2 to 4<\/strong>/g;
$fullforecast =~ s/subsiding to 3 to 5/<strong style="color: $hRainColor">subsiding to 3 to 5<\/strong>/g;
$fullforecast =~ s/subsiding to 4 to 6/<strong style="color: $hRainColor">subsiding to 4 to 6<\/strong>/g;
$fullforecast =~ s/subsiding to 5 to 7/<strong style="color: $hRainColor">subsiding to 5 to 7<\/strong>/g;
$fullforecast =~ s/subsiding to 6 to 8/<strong style="color: $hRainColor">subsiding to 6 to 8<\/strong>/g;


$fullforecast =~ s/subsiding to 1/<strong style="color: $hRainColor">subsiding to 1<\/strong>/g;
$fullforecast =~ s/subsiding to 2/<strong style="color: $hRainColor">subsiding to 2<\/strong>/g;
$fullforecast =~ s/subsiding to 3/<strong style="color: $hRainColor">subsiding to 3<\/strong>/g;
$fullforecast =~ s/subsiding to 4/<strong style="color: $hRainColor">subsiding to 4<\/strong>/g;
$fullforecast =~ s/subsiding to 5/<strong style="color: $hRainColor">subsiding to 5<\/strong>/g;
$fullforecast =~ s/subsiding to 6/<strong style="color: $hRainColor">subsiding to 6<\/strong>/g;

### WARNINGS FOR MARINE FORECASTS

$fullforecast =~ s/SMALL CRAFT WARNING IN EFFECT, $forecastPlaceName/<strong><a target='_blank' style="color: $warningColor;" href="$warnLink">SMALL CRAFT WARNING IN EFFECT <\/a><\/strong>/g;
$fullforecast =~ s/STRONG WIND WARNING IN EFFECT, $forecastPlaceName/<strong><a target='_blank' style="color: $warningColor;" href="$warnLink">STRONG WIND WARNING IN EFFECT <\/a><\/strong>/g;
$fullforecast =~ s/GALE WARNING IN EFFECT, $forecastPlaceName/<strong><a target='_blank' style="color: $warningColor;" href="$warnLink">GALE WARNING IN EFFECT <\/a><\/strong>/g;
$fullforecast =~ s/STORM WARNING IN EFFECT, $forecastPlaceName/<strong><a target='_blank' style="color: $warningColor;" href="$warnLink">STORM WARNING IN EFFECT <\/a><\/strong>/g;
$fullforecast =~ s/HURRICANE FORCE WIND WARNING IN EFFECT, $forecastPlaceName/<strong><a target='_blank' style="color: $warningColor;" href="$warnLink">HURRICANE FORCE WIND WARNING IN EFFECT <\/a><\/strong>/g;
$fullforecast =~ s/FREEZING SPRAY WARNING IN EFFECT, $forecastPlaceName/<strong><a target='_blank' style="color: $warningColor;" href="$warnLink">FREEZING SPRAY WARNING IN EFFECT <\/a><\/strong>/g;

$fullforecast =~ s/GALE WARNING ENDED , $forecastPlaceName/<strong><a target='_blank' style="color: $endedColor;" href="$warnLink">GALE WARNING ENDED <\/a><\/strong>/g;
$fullforecast =~ s/SMALL CRAFT WARNING ENDED , $forecastPlaceName/<strong><a target='_blank' style="color: $endedColor;" href="$warnLink">SMALL CRAFT WARNING ENDED <\/a><\/strong>/g;
$fullforecast =~ s/STRONG WIND WARNING ENDED , $forecastPlaceName/<strong><a target='_blank' style="color: $endedColor;" href="$warnLink">STRONG WIND WARNING ENDED <\/a><\/strong>/g;
$fullforecast =~ s/STORM WARNING ENDED , $forecastPlaceName/<strong><a target='_blank' style="color: $endedColor;" href="$warnLink">STORM WARNING ENDED <\/a><\/strong>/g;
$fullforecast =~ s/HURRICANE FORCE WIND WARNING ENDED , $forecastPlaceName/<strong><a target='_blank' style="color: $endedColor;" href="$warnLink">HURRICANE FORCE WIND WARNING ENDED <\/a><\/strong>/g;
$fullforecast =~ s/FREEZING SPRAY WARNING ENDED , $forecastPlaceName/<strong><a target='_blank' style="color: $endedColor;" href="$warnLink">FREEZING SPRAY WARNING ENDED <\/a><\/strong>/g;


return $fullforecast;
}

sub export_me_too {
    # stuff
}

1;