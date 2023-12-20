# Change Log
**3.3.1**
* Fixed an introduced bug where not all variables were passed to newly separated pm files.

* Restore translation for Territory.

* Add encoding glossary comment to Tseshaht pm file.

* Improved README File

**3.3**
* Added many new Tseshaht translations

* Added a couple rain values

* Corrected Tseshaht Footer

* Added some formatting (hr)

* Fixed bug in forecastgrabber.sh that prevented loading modules - cd to directory first then run perl script

* Added Generation time to footer message.

**3.2**
* Differentiated for Tseshaht from NCN 

* Added numerous Marine Weather wind and sea values

* Splitting code into modules for better extendability. Created ECFGMarine.pm, ECFGIndig, ECFGGeneral, and ECFGWarnings modules and subroutines.

* Added config value endedwarn to control color when a "warning ended" message appears.

* Made color codes in config files 3 digit instead of 6

* Added config instructions for warning URLs for Marine

**3.1.1**
* Fixed Introduced bug with marine forecast.

* Added toggle for Marine Forecast on/off in CONFIG.

* Fixed some Warning display issues.

* Updated French COnfig.

**3.1**

* Added support for Marine Forecasts

* Fixed Warnings - Environment Canada removed a space before a comma after their Warning messages. All spaces before commas after Advisories and Warnings are now removed.

* Removed References for Today and Tonight for Normal Forecast and modified them for the Marine forecast.

* Added Tseshaht and Hupacasath word translations

* Removed "Indigenous language not enabled" debug message.

**3.0**

* Introducing Nuu-cha-nulth translations.

* Cleaned up some comments in various files.

* Fixed Bug that omitted the current day forecast.

***v2.0.2**

* Added 40+ temperature highlights.

* Added Extreme Humidex Highlights.

* Bug Fix: Saturday wasn't highlighted.

**v2.0.1**

* Integrating Readme typo fixes.

* some bug fixes.

* Added more wind and rain captures.

* Added support for colouring warnings.

* Added support for up to 3 simultaneous warnings.

**v2.0.0**

* Added a config.sh.default.fr french version of the config file with french instructions.

* Added French Language Forecast Page Support. Oui c'est en français! Adding french equivalent text captures for most captures already implemented in English.

* Fixed target link for warnings.

* General code cleanup.

* Added version display on footer tag line.

* Added more rain and wind captures.

**v1.3.1**

* Added more highlighting for rain, wind, and temperatures.

* Worked on logic to better capture and highlight wind speed statements.

* Added nearFreezing value for near 0 degree temperatures.

* Added samples directory with example web page with embedded forecast and sample XML file.

* Added support for UTF-8 so accented characters work in config.sh. This means English language forecasts with French place names will now work properly.

**v1.3.0**

* All values in config.sh should now be contained in double quotes.

* Added wind speed colouring.

* Added more cold temperature colouring.

* Added warning that french language accents are not supported yet.

* Added instructions to support place names with special characters.

* Other bugfixes

**v1.2.1**

* Updated the README file.

* Added multiple rain amount captures for colouring by hraincolor and vhraincolor values. eg. '10 to 15 mm'

* Added 'rain at times heavy'. - Added to heavy rain colouring

* Added 'gusty wind'. - Added to 'windy' colouring

* Fixed Saturday bug introduced earlier.

* Added 'very heavy rain'. Added new colouring (default red).

* Added 'heavy rain'. - Added new colouring (default green).

* Added 'windy'. - Added new colouring (default purple).

* Added 'low zero'. - colouring for freezing temp.

**v1.2.0**

* fixed leftover perl warning messages.

* fixed error where rssURL was not being used.

* added a number of options for colouring and styling the text.

* colour and styles should now omit any ; at the end of the name or hexadecimal code. eg. red or #ff0000

* checked CSS validation and HTML validation of resulting file.

* added option to modify footer message.

* created config.sh.default so that user config files are preserved.

**v1.1**

* Did some cleanup of bad perl variables.

* Added config.sh file and moved all user configuration to that file. Updated Readme to match new procedures.


**v1.0**

* Initial Release.