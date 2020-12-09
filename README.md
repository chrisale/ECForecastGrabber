# Environment Canada Forecast Perl Script
This cronjob and perl script will pull the text forecasts from Environment Canada and make them into a text and HTML based file that can be embedded into any webpage or blog.

You can embed the resulting file into your webpage with an \<iframe> element.

# How does it work?

These scripts are intended to be run on your webserver or on a computer and then uploaded to your webserver.  The forecastgrabber.sh file is initiated by cron. Forecastgrabber.sh fetches the latest forecast from Environment Canada and then runs the forecast.pl perl script to parse it and modify it.

The forecast.pl script then outputs a temporary file that forecastgrabber.sh then copies to its final web accessible destination.  These two operations are separate to minimize disruption on the web side and to allow for uploading.

# What does it look like?

Something like this (from https://www.alberniweather.ca):
![image](https://github.com/chrisale/ECForecastGrabber/blob/main/images/forecastscreenshot.png)


# Setup and Installation

* Move the forecast.pl and forecastgrabber.sh to a suitable directory where they can be activated.

* Ensure forecastgrabber.sh has +x permissions so that it can be run as a script by cron.

* Open forecastgrabber.sh in a text editor.

* Modify the file paths for wget (or curl)

* Modify the URL for the RSS feed to your location's forecast. If you're not sure what this path is, go to https://weather.gc.ca/canada_e.html, go to your desired city or town, and then look for the orange RSS or ATOM button near the bottom of the page. This will provide the proper URL for the RSS feed. 

* Modify the paths for your local files to be stored including the location of the final html file that can be accessed by the webpage.

* Open forecast.pl in a text editor.

* Modify the configurations listed as required and desired. Ensure your filenames and paths match those used in forecastgrabber.sh

* Add a cronjob in your system to run the forecastgrabber.sh file however often you like. * * * * * /your/location/forecastgrabber.sh would run it every 60 seconds.

* Add the HTML file to your webpage with an iframe element like this:
	<iframe title="Your Local Forecast" width="1700" height="200" src="/ECForecast.html" name="YourTextForecast" style="border:none; width:1700px; height:200px; " > </iframe>
	
	This can be added as a Custom HTML block in a modern wordpress blog or widget, or it can be added directly inside an HTML webpage.
	
# Please Send Suggestions and Updates

I created this script and added to it over time as I discovered more Environment Canada warnings and messages. If you see something that Environment Canada is producing in your forecast that this script is not handling well, please post an issue here!  There will be many at first!

Thanks!

Chris


# Credits and Acknowledgements
Chris Alemany wrote the initial version of this script.  All comments, suggestions, alterations are welcome.

Environment Canada has copyright of all of their forecast products. This script is not intended to supercede or misrepresent any Environment Canada forecast or product.
