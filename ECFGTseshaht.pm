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

	$fullforecast =~ s/Forecast/<span title="What is the day doing?">&#660;aaqinh&#803;a n&#x313;aas&#660;ii<\/span>/gi; # "What is the day doing?"
	$fullforecast =~ s/ night/<span title="night"> &#660;ath&#803;ii<\/span>/gi; # "night" ʔatḥii
	$fullforecast =~ s/Sunny/<span title="It is nice weatther">&#411;&#x313;upaa<\/span>/gi; # "It is nice weatther"
	$fullforecast =~ s/ Sun /<span title="Sun"> hupa&lstrok; <\/span>/gi; # "sun"
	$fullforecast =~ s/Clearing/<span title="Sky or Ceiling">hinaayi&lstrok;<\/span>/gi; # "Sky or Ceiling" hinaayił
	$fullforecast =~ s/ Clear/<span title="good clear night"> ku&#411;uh&#803;ak<\/span>/gi; # "good clear night" kuuhak
	$fullforecast =~ s/Raining/<span title="It is raining">m&#x313;i&#411;aama<\/span>/gi; # "It is raining"
	$fullforecast =~ s/ rain/<span title="Rain"> m&#x313;i&#411;aa<\/span>/gi; # "Rain" m̓iƛaa
	$fullforecast =~ s/Showers/<span title="It is raining off and on">m&#x313;i&#411;m&#x313;i&#411;&scaron;<\/span>/gi; # "It is raining off and on"
	$fullforecast =~ s/Cloudy periods/<span title="Times of covered skies"> &lstrok;iw&#x313;ah&#803;akma<\/span>/gi; # "It is cloudy"
	$fullforecast =~ s/partly cloudy/<span title="Parts of covered skies"> naa&#660;uuksta &lstrok;iw&#x313;ah&#803;akma <\/span>/gi; # "Part CLoud"
	$fullforecast =~ s/ cloudy /<span title="covered skies"> &lstrok;iw&#x313;ah&#803;akma <\/span>/gi; # "It is cloudy"
	$fullforecast =~ s/ cloud/<span title="It is cloudy"> &lstrok;iw&#x313;ah&#803;akma<\/span>/gi; # "It is cloudy"
	$fullforecast =~ s/thunderstorms/<span title="It is stormy">wiiqsiima<\/span>/gi; # "It is stormy"
	$fullforecast =~ s/Windy/<span title="It is windy">yu&#660;i<\/span>/gi; # "It is windy"
	$fullforecast =~ s/ Wind /<span title="It is windy"> yu&#660;i <\/span>/gi; # "It is windy"
	$fullforecast =~ s/Snowing/<span title="It is snowing">k&#695;isaama<\/span>/gi; # "It is snowing"
	$fullforecast =~ s/ Snow /<span title="It is snowing"> k&#x313;&#x695;iis <\/span>/gi; # "It is snowing"
	$fullforecast =~ s/Flurries/<span title="It is snowing">k&#695;isaama<\/span>/gi; # "It is snowing"
	$fullforecast =~ s/Fog/<span title="It is foggy">&#660;u&ccaron;qakma<\/span>/gi; # "It is foggy"
	$fullforecast =~ s/Frost/<span title="It is frosty">k&#695;imacyuma<\/span>/gi; # "It is frosty"
	$fullforecast =~ s/Hail/<span title="It is hailing">kacaama<\/span>/gi; # "It is hailing "
	$fullforecast =~ s/Winter/<span title="Winter">c&#x313;u&#660;i&ccaron;h&#803;<\/span>/gi; # "Winter"
	$fullforecast =~ s/December/<span title="Youngest Sibling Moon">y&#x313;uk&#695;iiqsu<\/span>/gi; # "December" yukwiiqsu
	$fullforecast =~ s/January/<span title="Elder Sibling Moon">m&#x313;aam&#x313;iiqsu<\/span>/gi; # "January" maamiiqsu
	$fullforecast =~ s/February/<span title="False Spawning Moon">&#x705;etim&lstrok;<\/span>/gi; # "February" ʕetimł
	$fullforecast =~ s/Spring/<span title="Spring">&#411;aq&#660;ii&ccaron;h&#803;<\/span>/gi; # "SPring" ƛaqʔiičḥ
	$fullforecast =~ s/March/<span title="Spawning Moon">&#x705;aayaqim&lstrok;<\/span>/gi; # "Spawning Moon" ʕaayaqimł
	$fullforecast =~ s/April/<span title="Flying Geese Moon">huyaaqim&lstrok;<\/span>/gi; # "Flying Geese Moon" huyaaqimł 
	$fullforecast =~ s/ May /<span title="Nesting Moon"> paawaacim&lstrok; <\/span>/gi; # "Nesting Moon" paawaacimł
	$fullforecast =~ s/Sunset/<span title="Sunset">huupatu<\/span>/gi; # "Sunset" huupatu
	$fullforecast =~ s/Summer/<span title="Summer">&#411;&#x313;up&#x313;ii&ccaron;h&#803;<\/span>/gi; # "Summer" /upiičḥ
	$fullforecast =~ s/Morning/<span title="Morning">ku&#660;a&lstrok;<\/span>/gi; # "Morning" kuʔał
	$fullforecast =~ s/Noon/<span title="Middle or Noon">&#660;apw&#x313;in n&#x313;aas<\/span>/gi; # "Noon" ʔapw̓in n̓aas
	$fullforecast =~ s/June/<span title="Berry Moon">qawas&#x313;im&lstrok;<\/span>/gi; # "June" qawaimł̣
	$fullforecast =~ s/July/<span title="Bee Moon">&#x705;asac&#x313;im&lstrok;<\/span>/gi; # "Bee Moon" ʕasaimł
	$fullforecast =~ s/August/<span title="Spring Salmon Moon">sac&#x313;upim&lstrok;<\/span>/gi; # "August" sacupimł
	$fullforecast =~ s/ Fall /<span title="Fall"> &#x705;ay&#x313ii&ccaron;h&#803; <\/span>/gi; # "Fall" ʕayiičḥ
	$fullforecast =~ s/Autumn/<span title="Autumn">&#x705;ay&#x313ii&ccaron;h&#803;<\/span>/gi; # "Autumn" ʕayiičḥ
	$fullforecast =~ s/September/<span title="Dog Salmon Moon">hink&#313;uu&#660;asim&lstrok;<\/span>/gi; # "September" hinķuuʔasimł
	$fullforecast =~ s/October/<span title="Cutting Fish Moon">&ccaron;&#x313;ayaaqim&lstrok;<\/span>/gi; # "October" č̓ayaaqimł
	$fullforecast =~ s/November/<span title="Sweeping Moon">yaxs&#708;i&#411;im&lstrok;<\/span>/gi; # "October" yaxšiƛimł
	$fullforecast =~ s/Storm/<span title="Storm">&lstrok;aqqii&#660;a&#x411;ma &lstrok;iw&#x313ah&#803;mis nu&ccaron;ii&#x411;i<\/span>/gi; # "Storm" łaqqii?aƛma łiw'ah.mis nuc^ii?i A Stationary cloud hanging around the top of mountain all dayl it is going to be stormy.	
	$fullforecast =~ s/sunset/<span title="the sun is setting">huupatu<\/span>/gi; # The sun is setting. huupatu
	$fullforecast =~ s/Evening/<span title="Evening">tuup&scaron;i&#411;<\/span>/gi; # The sun is setting. tuupsiƛ
	$fullforecast =~ s/Periods of/<span title="Period">k&#x313;a&ccaron;&#411;is<\/span>/gi; # A period of time k̓ačʔis
	$fullforecast =~ s/Gold River/<span title="Gold River changed to Machalaht Territory">ma&ccaron;&lstrok;aath&#803; h&#803;ah&#803;uu&lstrok;i<\/span>/gi; # Gold River changed to Machalaht for the territory of the Machalaht
	$fullforecast =~ s/midnight/<span title="Directly translated midnight as middle night"> &#660;apw&#x313;in &#660;ath&#803;ii <\/span>/gi; # Gold River changed to Machalaht for the territory of the Machalaht
	$fullforecast =~ s/near/<span title="Direct translation of near">&#411;awaa<\/span>/gi; # Replacing the word "near" ƛawaa
	$fullforecast =~ s/becoming/<span title="To Become something">&#660;uu&#411;tup$scaron;i&#411;<\/span>/gi; # Becoming 
	$fullforecast =~ s/Lake Cowichan/<span title="Lake Cowichan changed to Cowichan Territory">quw'utsun h&#803;ah&#803;uu&lstrok;i<\/span>/gi; # Lake Cowichan changed to the territory of Cowichan First Nation quw'utsun
	
	
	$fullforecast =~ s/Tseshaht/<span title="Proper spelling of Tseshaht">c&#x313;i&scaron;aa&#660;ath&#803;<\/span>/gi; # "Proper spelling of Tseshaht c̓išaaʔatḥ " &ccaron;
	$fullforecast =~ s/Hupacasath/<span title="Proper spelling of Hupacasath">hupa&ccaron;&#x313;as&#660;ath&#803;<\/span>/gi; # "Proper spelling of Hupacasath "  nuučaan̓uł
	$fullforecast =~ s/Nuuchanulth/<span title="Proper spelling of nuuchanulth">nuu&ccaron;aan&#x313;u&lstrok;<\/span>/gi; # "Proper spelling of Nuu-cha-nulth "
	$fullforecast =~ s/Monday/<span title="One day or Monday">n&#x313;up&ccaron;ii&lstrok;<\/span>/gi; # "One Day or Monday" n̓upčiił
	$fullforecast =~ s/Tuesday/<span title="Two days or Tuesday">&#660;a&#411;&ccaron;ii&lstrok;<\/span>/gi; # "Two days or Tuesday" ʔaƛčiił
	$fullforecast =~ s/Wednesday/<span title="Third day">qacc&#x313;a&ccaron;i&lstrok;<\/span>/gi; # "Third day" qacc̓ačił
	$fullforecast =~ s/Thursday/<span title="Four Days or Thursday">muu&ccaron;ii&lstrok;<\/span>/gi; # "Four Days or Thursday" muučiił
	$fullforecast =~ s/Friday/<span title="Friday">su&ccaron;&#x313;a&ccaron;i&lstrok;<\/span>/gi; # "Friday"" suč̓ačił
	$fullforecast =~ s/Sunday/<span title="Sunday">saantii<\/span>/gi; # "Sunday" saantii
	
	
	
	my $nuuchahnulth = "<br><span style='font-size: xx-small;'><span style='color:red;text-decoration:underline;' title='Proper spelling of nuuchanulth'>Hover over nuu&ccaron;aan&#x313;u&lstrok; words</span> to see English meaning. Displayed in <span title='Proper spelling of Nuuchanulth'>nuu&ccaron;aan&#x313;u&lstrok;</span> using <span title='Proper spelling of Hupacasath'><a href='https://www.hupacasath.ca/about-us/language-culture/' target='_blank'>hupa&ccaron;&#x313;as&#660;ath&#803;</a></span>, <span title='Proper spelling of Tseshaht'><a href='https://tseshaht.com/history-culture/language/' target='_blank'>c&#x313;i&scaron;aa&#660;ath&#803;</a></span>, <span title='Proper spelling of Nuuchanulth'><a href='https://nuuchahnulth.org/language/alpha/alpha-1' target='_blank'>nuu&ccaron;aan&#x313;u&lstrok;</a></span> sources including <a href='https://www.firstvoices.com/home' target='_blank'>FirstVoices</a>. Go to the <a href='/translations/' target='_blank'>Translations page</a> for the current list of words being substituted.</a> Please contact me if you see any errors or have any suggestions for improvements.</span>";
	$fullforecast = $fullforecast . $nuuchahnulth;
	
return $fullforecast;
}


1;