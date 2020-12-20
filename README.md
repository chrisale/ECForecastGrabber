# Environment Canada Forecast Perl Script
This cronjob and perl script running on your webserver or local computer will pull the text forecasts from Environment Canada and make them into a text and HTML based file that can be embedded into any webpage or blog with an \<iframe> element.

It also augments the text with links, colours and other features that bring a little more interactivity to the plain text.

You can also make copies of these files and have as many forecasts downloaded and processed as you like.

# How does it work?

These scripts are intended to be run on your webserver or on a computer and then uploaded to your webserver.  The forecastgrabber.sh file is initiated by cron. Using your configuration parameters from config.sh, the forecastgrabber.sh shell script fetches the latest forecast from Environment Canada and then runs the forecast.pl perl script to parse it and augment it.

The forecast.pl script then outputs a temporary file that forecastgrabber.sh then copies to its final web accessible destination.  These two operations are separate to minimize disruption on the web side and to allow for uploading.

# What does it look like?

Something like this (from https://www.alberniweather.ca):
![image](https://github.com/chrisale/ECForecastGrabber/blob/main/images/forecastscreenshot.png)


# Setup and Installation

Initial requirements are minimal and should exist on any system.
PERL requirements: XML::Simple, Data::Dumper and HTTP::Date.
wGet is also required.

* Move the entire downloaded directory into a suitable location to be activated on your computer or web server. Somewhere outside the public web directory is best.

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

* French Language support: Note that at this time French place names using accented characters are not supported. 
	
# Please Send Suggestions and Updates

I created this script and added to it over time as I discovered more Environment Canada warnings and messages. If you see something that Environment Canada is producing in your forecast that this script is not handling well, please post an issue here!  There will be many at first!

When sending a potential addition to the capture and augmentation of the text, it is very helpful to provide the exact RSS file downloaded from Environment Canada that produced the text you wish to augment so that the exact wording and syntax can be seen.

Thanks!

Chris


# Credits and Acknowledgements
Chris Alemany wrote the initial version of this script.  All comments, suggestions, alterations are welcome.

Environment Canada has copyright of all of their forecast products. These scripts are intended only to augment the visual display of the text and RSS products. No modification or misrepresentation of any Environment Canada forecast or product is intended.
