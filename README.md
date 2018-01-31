# Cambridge Art [![MIT license](https://img.shields.io/badge/license-MIT-lightgrey.svg)](https://https://raw.githubusercontent.com/qirh/CambridgeArt/master/LICENSE.txt)
Cambridge Art is an iOS app that shows public art for the city of Cambridge, Massachusetts


## Summary
Cambridge Art is an iOS project that I worked on in the summer of 2017. It has been a really fun project to work on, and while it is fully functional right now, I think it could use a some UI improvements before being released to the app store. The application basically shows an interactive map and a list of all the art installations in the city of Cambridge, MA, which is where I lived over the summer. If you are reading this, please give the app a try and let me know what you think :*

## Notes
### Features not working properly
 * Night mode still not implemented
 * Large Text still not implemented
 * Results per page still not implemented
 * Portuguese and Hebrew translations are lacking
 * 3d peek and pop are not 100%, look here for reference:
    * https://medium.com/@darjeelingsteve/supporting-3d-touch-peek-and-pop-ee80d2a4bd69
    * https://the-nerd.be/2015/10/06/3d-touch-peek-and-pop-tutorial/

### Known Issues
 * The annotations on the map only display one entry even if there are multiple.
 * Doesn't display well on screen sizes that aren't iPhone 7 or similar
 * Doesn't display well in landscape

### Features to add
#### General
 * Full right-to-left support for Arabic/Hebrew
 * Add force touch to application icon --> add option "closest to me"
 * Add data for the city of Somerville and neighboring cities
 * Add data from Harvard/MIT campuses
#### Map View
 * Highlight Cambridge in the map
 * Highlight zip codes
#### Table View
 * Add search bar
 * Add 3d peek for cells
 * Redesign how the Navigate button looks
 * variable cell size
#### Settings View
 * Redesign the UI to fit apple guidelines for settings
 * Add option to navigate with google maps
#### Detailed View
 * Redesign the UI

## Copyright Information
 1. The data provided by the city of Cambridge
    * **License:** Provided as public information, free to use and no credit necessary.  
    * **Source:** https://data.cambridgema.gov/General-Government/Cambridge-Public-Art-Locations/svyv-zh72/data  

 2. Navigation icon
    * **License:** Flaticon Basic License. Free to use if the author is credited
    * **Source:** http://www.flaticon.com/free-icon/navigation_149049#term=navigate&page=1&position=3
    * **Credit:**
     * Icons made by: http://www.flaticon.com/authors/madebyoliver
     * licensed by: http://creativecommons.org/licenses/by/3.0/
 
 3. About, List, Map, Settings and flag icons are from [icons8.com](icons8.com)
    * **License:** Free to use with credit
    * **Source:** http://icons8.com
    * **Credit:**
     * https://icons8.com/icon/set/flags/all
     * https://icons8.com/icon/set/art/all
     * https://icons8.com/icon/14313/about
     * https://icons8.com/icon/20406/bulleted-list
     * https://icons8.com/icon/3779/map-marker
     * https://icons8.com/icon/14099/Settings

 4. CRToast for alerts
    * **License:** MIT License
    * **Source:** https://github.com/cruffenach/CRToast
    * **Credit:** https://github.com/Ashton-W
     
 5. SwiftyJSON for parsing JSON
    * **License:** MIT License
    * **Source:** https://github.com/SwiftyJSON/SwiftyJSON
    * **Credit:** https://github.com/tangplin
       
 6. Icon Set Creator
    * **License:** Nicolas Miari
    * **Source:** https://itunes.apple.com/de/app/icon-set-creator/id939343785?l=en&mt=12
    * **Credit:** https://stackoverflow.com/a/45122603