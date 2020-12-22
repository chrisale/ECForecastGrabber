# Change Log
**v1.3.1** In Progress

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