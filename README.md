# Environment Canada Forecast Perl Script
This cronjob and perl script running on your webserver or local computer will pull the text city and marine forecasts from Environment Canada and make them into a text and HTML based file that can be embedded into any webpage or blog with an \<iframe> element.

It also augments the text with links, colours and other features that bring a little more interactivity to the plain text.

You can have as many copies of this package running as you like to be able to produce multiple forecasts.

# How does it work?

These scripts are intended to be run on your webserver or on a computer and then uploaded to your webserver.  The forecastgrabber.sh file is initiated by cron. Using your configuration parameters from config.sh, the forecastgrabber.sh shell script fetches the latest forecast from Environment Canada and then runs the forecast.pl perl script to parse it and augment it.

The forecast.pl script then outputs a temporary file that forecastgrabber.sh then copies to its final web accessible destination.  These two operations are separate to minimize disruption on the web side and to allow for uploading.

# What does it look like?

Something like this:
![image](https://github.com/chrisale/ECForecastGrabber/blob/main/images/forecastscreenshot1.png)
![image](https://github.com/chrisale/ECForecastGrabber/blob/main/images/forecastscreenshot2.png)
![image](https://github.com/chrisale/ECForecastGrabber/blob/main/images/forecastscreenshot3.png)

There is an example html file in the samples directory that can be used as a template.  It also includes a sample of the XML file produced by Environment Canada that is parsed by these scripts as well as the outputted html file from ECForecastGrabber.

You can see a 'live' example on https://www.alberniweather.ca

# Indigenous Language Translation 

I am endeavouring to add the capability to substitute and translate, in whole or part, indigenous words and phrases in place of the standard Environment Canada English and French text. This is a significant amount of work and may be incomplete or incorrect at times.
Enabling this is done through the config.sh file.  It should work whether you select the 'base' English or French Environment Canada forecast sources. It is done with the intent to be respectful of First Nations, Inuit and Métis ancestral, un-ceded lands and traditions in an effort to preserve their ancient languages.
Currently the only supported language is based on the Nuu-cha-nulth family of languages on the West Coast of Vancouver Island. If you see any errors or have any suggestions for improvements, please contact me.


# Setup and Installation

Initial requirements are minimal and should exist on any system.
PERL requirements: XML::Simple, Data::Dumper and HTTP::Date.
wGet is also required.

* Clone the repository or move the binary release directory into a suitable location to be activated on your computer or web server. Somewhere outside the public web directory is best.
	- IMPORTANT: If you clone the repository note that the repository may be under active development. Usually there are only minor changes and don't cause issues but the release binaries are stable.

* Ensure forecastgrabber.sh has +x permissions so that it can be run as a script by cron.

* Copy or rename config.sh.default to config.sh

* Open config.sh in a text editor.

* Modify the file paths and other configurations according to the instructions in the config file.

* Add a cronjob in your system to run the forecastgrabber.sh file.
	
	A setting of */15 * * * * /your/location/forecastgrabber.sh would run it every 15 minutes.

* Add the HTML file to your webpage with an iframe element like this:
	<iframe title="Your Local Forecast" width="1000" height="200" src="/ECForecast.html" name="YourTextForecast" style="border:none; width:1000; height:200px; " > </iframe>
	
	This can be added as a Custom HTML block in a modern wordpress blog or widget, or it can be added directly inside an HTML webpage.
	
# Known Issues

* Display of warning and forecast links and place names is highly dependent on perfect place name rendering. Double check your place name or send in an issue if you can't get yours to behave. Will be working on modifications to make this more robust in time.

# Please Send Suggestions and Updates

I created this script and added to it over time as I discovered more Environment Canada warnings and messages. If you see something that Environment Canada is producing in your forecast that this script is not handling well, please post an issue here!  There will be many at first!

When sending a potential addition to the capture and augmentation of the text, it is very helpful to provide the exact RSS file downloaded from Environment Canada that produced the text you wish to augment so that the exact wording and syntax can be seen.

Thanks!

Chris


# Credits and Acknowledgements
Chris Alemany wrote the initial version of this script.  All comments, suggestions, alterations are welcome.

Environment Canada has copyright of all of their forecast products. These scripts are intended only to augment the visual display of the text and RSS products. No modification or misrepresentation of any Environment Canada forecast or product is intended.
