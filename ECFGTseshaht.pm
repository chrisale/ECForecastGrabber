#!/usr/bin/perl
# use moduleuse XML::Simple;
package ECFGTseshaht;
use XML::Simple;
use Data::Dumper;
use HTTP::Date;
use utf8;
use Encode;
use Exporter;

our @ISA= qw(Exporter);

# these CAN be exported.
our @EXPORT_OK = qw( tseshaht_weather );

# these are exported by default.
our @EXPORT = qw( tseshaht_weather );

sub tseshaht_weather {
#print "hello";

	my ($fullforecast,$warnLink,$thunderLink,$boldDays,$textColor,$freezeDrizzleWarn,$freezeRainWarn,$freezingTemp,$nearfreezeTemp,$hotTemp,$exhotTemp,$exHumidex,$thunderWarn,$flurriesColor,$windyColor,$hRainColor,$vhRainColor,$warningColor,$endedColor,$comma,$forecastlink,$warnings,$warnings2,$warnings3,$forecastPlaceName,$forecastName,$footerMsg) = @_;

	$fullforecast =~ s/Forecast/&#660;aaqinh&#803;a n&#x313;aas&#660;ii/gi; # "What is the day doing?"
	$fullforecast =~ s/Sunny/&#411;&#x313;upaa/gi; # "It is nice weatther"
	$fullforecast =~ s/ Sun / hupa&lstrok; /gi; # "sun"
	$fullforecast =~ s/Cloud/&lstrok;iw&#x313;ah&#803;mis/gi; # "Cloud" łiw̓aḥmis
	$fullforecast =~ s/Cloudy/&lstrok;iw&#x313;ah&#803;mis/gi; # "Cloudy" łiw̓aḥmis
	$fullforecast =~ s/Clearing/hinaayi&lstrok;/gi; # "Sky or Ceiling" hinaayił
	$fullforecast =~ s/Clear/hinaayi&lstrok;/gi; # "Sky or Ceiling" hinaayił
	$fullforecast =~ s/Raining/m&#x313;i&#411;aama/gi; # "It is raining"
	$fullforecast =~ s/Rain/m&#x313;i&#411;aa/gi; # "Rain" m̓iƛaa
	$fullforecast =~ s/Showers/m&#x313;i&#411;m&#x313;i&#411;&scaron;/gi; # "It is raining off and on"
	$fullforecast =~ s/Cloudy periods/&lstrok;iw&#x313;ah&#803;akma/gi; # "It is cloudy"
	$fullforecast =~ s/Cloudy/&lstrok;iw&#x313;ah&#803;akma/gi; # "It is cloudy"
	$fullforecast =~ s/thunderstorms/wiiqsiima/gi; # "It is stormy"
	$fullforecast =~ s/Windy/yu&#660;i/gi; # "It is windy"
	$fullforecast =~ s/Wind/yu&#660;i/gi; # "It is windy"
	$fullforecast =~ s/Snowing/k&#695;isaama/gi; # "It is snowing"
	$fullforecast =~ s/Snow/k&#x313;&#x695;iis/gi; # "It is snowing"
	$fullforecast =~ s/Flurries/k&#695;isaama/gi; # "It is snowing"
	$fullforecast =~ s/Fog/&#660;u&ccaron;qakma/gi; # "It is foggy"
	$fullforecast =~ s/Frost/k&#695;imacyuma/gi; # "It is frosty"
	$fullforecast =~ s/Hail/kacaama/gi; # "It is hailing "
	$fullforecast =~ s/Winter/c&#x313;u&#660;i&ccaron;h&#803;/gi; # "Winter"
	$fullforecast =~ s/December/y&#x313;uk&#695;iiqsu/gi; # "December" yukwiiqsu
	$fullforecast =~ s/January/m&#x313;aam&#x313;iiqsu/gi; # "January" maamiiqsu
	$fullforecast =~ s/February/&#x705;etim&lstrok;/gi; # "February" ʕetimł
	$fullforecast =~ s/Spring/&#411;aq&#660;ii&ccaron;h&#803;/gi; # "SPring" ƛaqʔiičḥ
	$fullforecast =~ s/March/&#x705;aayaqim&lstrok;/gi; # "March" ʕaayaqimł
	$fullforecast =~ s/April/huyaaqim&lstrok;/gi; # "April" huyaaqimł 
	$fullforecast =~ s/April/paawaacim&lstrok;/gi; # "April" paawaacimł
	$fullforecast =~ s/Sunset/huupatu/gi; # "Sunset" huupatu
	$fullforecast =~ s/Summer/&#411;&#x313;up&#x313;ii&ccaron;h&#803;/gi; # "Summer" /upiičḥ
	$fullforecast =~ s/Morning/ku&#660;a&lstrok;/gi; # "Morning" kuʔał
	$fullforecast =~ s/Noon/&#660;apw&#x313;inn&#x313;aas/gi; # "Noon" ʔapw̓in n̓aas
	$fullforecast =~ s/June/qawas&#x313;im&lstrok;/gi; # "June" qawaimł̣
	$fullforecast =~ s/July/&#x705;asac&#x313;im&lstrok;/gi; # "July" ʕasaimł
	$fullforecast =~ s/August/sac&#x313;upim&lstrok;/gi; # "August" sacupimł
	$fullforecast =~ s/Fall/&#x705;ay&#x313ii&ccaron;h&#803;/gi; # "Fall" ʕayiičḥ
	$fullforecast =~ s/Autumn/&#x705;ay&#x313ii&ccaron;h&#803;/gi; # "Autumn" ʕayiičḥ
	$fullforecast =~ s/September/hink&#313;uu&#660;asim&lstrok;/gi; # "September" hinķuuʔasimł
	$fullforecast =~ s/October/&ccaron;&#x313;ayaaqim&lstrok;/gi; # "October" č̓ayaaqimł
	$fullforecast =~ s/November/yaxs&#708;i&#411;iml&lstrok;/gi; # "October" yaxšiƛimł
	$fullforecast =~ s/Storm/&lstrok;aqqii&#660;a&#x411;ma &lstrok;iw&#x313ah&#803;mis nu&ccaron;ii&#x411;i/gi; # "Storm" łaqqii?aƛma łiw'ah.mis nuc^ii?i A Stationary cloud hanging around the top of mountain all dayl it is going to be stormy.	
	
	##Have to do the names twice, before and after adding the links which cannot be translated.
	
	$fullforecast =~ s/Tseshaht/c&#x313;i&scaron;aa&#660;ath&#803;/gi; # "Proper spelling of Tseshaht c̓išaaʔatḥ " &ccaron;
	$fullforecast =~ s/Hupacasath/hupa&ccaron;&#x313;as&#660;ath&#803;/gi; # "Proper spelling of Hupacasath "  nuučaan̓uł
	$fullforecast =~ s/Nuuchanulth/nuu&ccaron;aan&#x313;u&lstrok;/gi; # "Proper spelling of Nuu-cha-nulth "
	$fullforecast =~ s/Territory/hahuu&lstrok;i/gi; # "Proper spelling of Nuu-cha-nulth "
	my $nuuchahnulth = " Displayed in Nuuchanulth using <a href='https://www.hupacasath.ca/about-us/language-culture/' target='_blank'>Hupacasath</a>, <a href='https://tseshaht.com/history-culture/language/' target='_blank'>Tseshaht</a>, <a href='https://nuuchahnulth.org/language/alpha/alpha-1' target='_blank'>Nuuchanulth</a> sources including <a href='https://www.firstvoices.com/home' target='_blank'>FirstVoices</a>. Go to the <a href='/translations/' target='_blank'>Translations page</a> for the current list of words being substituted.</a> Please contact me if you see any errors or have any suggestions for improvements.</span>";
	$fullforecast = $fullforecast . $nuuchahnulth;
	
	$fullforecast =~ s/>Tseshaht/>c&#x313;i&scaron;aa&#660;ath&#803;/gi; # "Proper spelling of Tseshaht c̓išaaʔatḥ " &ccaron;
	$fullforecast =~ s/>Hupacasath/>hupa&ccaron;&#x313;as&#660;ath&#803;/gi; # "Proper spelling of Hupacasath "  nuučaan̓uł
	$fullforecast =~ s/Nuuchanulth/nuu&ccaron;aan&#x313;u&lstrok;/gi; # "Proper spelling of Nuu-cha-nulth "
	$fullforecast =~ s/Territory/hahuu&lstrok;i/gi; # "Proper spelling of Nuu-cha-nulth "
	#$fullforecast = $fullforecast . " - TEST VALUES: Forecast - rain - showers - Showers - cloudy - Cloudy periods - wind - Windy - Snow - Fog - Frost - Thunderstorms - Hail - ";

return $fullforecast;
}


1;