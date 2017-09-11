# Art Navigator
Art navigator for the city of Cambridge, MA
[![MIT license](https://img.shields.io/badge/license-MIT-lightgrey.svg)](https://raw.githubusercontent.com/harvard-ios/assignment-5-almto3/master/LICENSE.txt)
* License: MIT License
* Source repo: https://github.com/harvard-ios/assignment-5-almto3
* Contact: salehg@live.com

## Write-up
	I was thinking of an idea for an application to work on. And while browsing the city of Cambridge's API I noticed a data set for the public art installations in the city. And the idea of making an app to serve as a guide for the city's local art absolutely grabbed me. So, I started searching if any other devs have already did something similar and couldn't find any similar thing done for the city of Cambridge, but I found a lot for other cities.
	So, armed with the inspiration I got from all the other apps I looked at, I decided to go through with the idea and start developing the app. I anticipated that around the halfway mark of the deadline, I would be done with the beta version and from there I can dedicate more of my time and effort to beautify it. However, what I had not expected was the data set would be incomplete and have a lot of inconsistencies. All in all, I would say the data validation (or revalidation) took maybe 30%-50% of the time that it took to develop the app.
	Moreover, I really enjoyed the programming aspects of this app. The MVC model seemed intuitive to work with, especially after utilizing it for the last assignment I worked on. However, I really really struggled with the design aspects of this app. I had a lot of problems working with storyboard, actually, the day of the deadline I had to completely redesign more than half the application view controllers. Because I was trying to design the app from the beginning with all the objects have relative constrains and relative size. Since I thought that designing with everything relative would make it work on many more platforms. However, things kept breaking until I decided to develop it with some fixed sizes and fixed constraints to the superview.
	Nevertheless, the biggest problems I faced were not related to xCode or swift or any programming or design paradigms. But was around my inability to draw a concept of portraying the information thatI wanted to portray to the user. I even asked my little siblings for help in that regard haha. Over many trails, my ideas of design always revolved around sticking everything in a label and having labels stack over each other. Ultimately however, I worked on this submission version of the app, which I think portrays the information that I want it to do. But, it does not do so beautifully. So over the next few versions of the app, I would like to work on the aesthetics of it.

## Notes
 * App was designed to run on an iPhone 7.
 * On the settings app, there is a save button beneath, I'm not sure if that is obvious. Moreover, changes will not be committed unless saved.

## Features not working properly
 * Night mode not functional
 * Large Text not functional
 * Results per page not functional

## Known Bugs
 * The annotations on the map only display one entry even if there are multiple.
 * Doesn't display well on screen sizes that aren't iPhone 7

## Features to add
### General
 * Full right-to-left support
 * Show More Button
 * Searching the table
 * Add Somerville data
 * Add sculptures in Harvard/MIT campus!
 * Directions with google maps
### Map View
 * Highlight Cambridge in the map
 * highlight zip codes
### Table View
 * Add search bar
 * variable cell size
### Settings View
 * Redesign to fit apple guidelines for settings
##Copyright Information
 * Resource 1:
   The data provided by the city of Cambridge.
   Source: https://data.cambridgema.gov/General-Government/Cambridge-Public-Art-Locations/svyv-zh72/data
   License: Provided as public information, free to use and no credit necessary.
 * Resource 2:
   Navigation icon
   Source: http://www.flaticon.com/free-icon/navigation_149049#term=navigate&page=1&position=3
   License: Flaticon Basic License. Free to use if the author is credited.
   Credit:
     Icons made by http://www.flaticon.com/authors/madebyoliver
     licensed by: http://creativecommons.org/licenses/by/3.0/
 * Resource 3:
   About, List, Map, Settings, flag and app icons are all from icons8.com
   Source: icons8.com
   License: Free to use with credit
   Credit:
     https://icons8.com/icon/set/flags/all
     https://icons8.com/icon/14313/about
     https://icons8.com/icon/20406/bulleted-list
     https://icons8.com/icon/3779/map-marker
     https://icons8.com/icon/14099/Settings
 * Resource 4:
   CRToast for alerts
   Source: https://github.com/cruffenach/CRToast
   License: MIT License
   Credit:
     https://github.com/Ashton-W
 * Resource 5:
   SwiftyJSON for parsing JSON
   Source: https://github.com/SwiftyJSON/SwiftyJSON
   License: MIT License
   Credit:
     https://github.com/tangplin

## Reference
 https://github.com/wikimedia/wikipedia-ios
