# Cambridge Art [![MIT license](https://img.shields.io/badge/license-MIT-lightgrey.svg)](https://https://raw.githubusercontent.com/qirh/CambridgeArt/master/LICENSE)
Cambridge Art is an iOS app that shows public art for the city of Cambridge, Massachusetts


## Summary
Cambridge Art is an iOS project that I worked on in the summer of 2017. It has been a really fun project to work on, and while it is fully functional right now, I think it could use a some UI improvements before being released to the app store. The application basically shows an interactive map and a list of all the art installations in the city of Cambridge, MA, which is where I lived over the summer. If you are reading this, please give the app a try and let me know what you think :*

## Copyright Information
| No. | Description                               | Source                                                                                                  | Credit                                                                                                                                                                                                                                                |
|-----|-------------------------------------------|---------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 1   | Data provided by the city of Cambridge    | [source](https://data.cambridgema.gov/General-Government/Cambridge-Public-Art-Locations/svyv-zh72/data) |                                                                                                                                                                                                                                                       |
| 2   | Navigation icon                           | [source](http://www.flaticon.com/free-icon/navigation_149049#term=navigate&page=1&position=3)           | Icons [made by](http://www.flaticon.com/authors/madebyoliver)                                                                                                                                                                                         |
| 3   | About, List, Map, Settings and Flag icons | [source] (http://icons8.com)                                                                            | [flags](https://icons8.com/icon/set/flags/all). [about](https://icons8.com/icon/14313/about). [list](https://icons8.com/icon/20406/bulleted-list). [map](https://icons8.com/icon/3779/map-marker). [settings](https://icons8.com/icon/14099/Settings) |
| 4   | CRToast for alerts                        | [source] (https://github.com/cruffenach/CRToast)                                                        | [credit] (https://github.com/Ashton-W)                                                                                                                                                                                                                |
| 5   | SwiftyJSON for parsing JSON               | [source] (https://github.com/SwiftyJSON/SwiftyJSON)                                                     | [credit] (https://github.com/tangplin)                                                                                                                                                                                                                |
| 6   | Icon Set Creator                          | [source] (https://itunes.apple.com/de/app/icon-set-creator/id939343785?l=en&mt=12)                      | [credit] (https://stackoverflow.com/a/45122603)                                                                                                                                                                                                       |

## Screenshots
### Home Page and Select Sources
<img src="/screenshots/home_page.png" height = "450" width="270"> <img src="/screenshots/select_sources.png" height = "450" width="270">

### Browse movies and series
<img src="/screenshots/browse_netflix.png" height = "450" width="270"> <img src="/screenshots/browse_hbo.png" height = "450" width="270"> <img src="/screenshots/browse_series.png" height = "450" width="270">

### Myqueue
<img src="/screenshots/myqueue.png" height = "450" width="270"> <img src="/screenshots/remove.png" height = "450" width="270">

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
