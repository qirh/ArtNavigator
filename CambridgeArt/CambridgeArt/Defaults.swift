//
//  Defaults.swift
//  CambridgeArt
//
//  Created by saleh on 7/27/17.
//  Copyright © 2017 saleh. All rights reserved.
//

import Foundation

enum SortBy : Int {
    case title = 0
    case category = 1
    case artist = 2
}
enum NavigateUsing : Int {
    case apple = 0
    case google = 1
    //case waze = 2
}
enum TabSelected : Int {
    case map = 0
    case list = 1
    case settings = 2
    case about = 3
}
class Defaults {
    
    static let supportedLanguages = ["ar":"العربية", "en":"English", "es":"Español", "he":"עִברִית", "pt":"Português"]
    
    // source:
    // https://swift3tutorials.com/swift-3-user-defaults/
    static let defaults: UserDefaults = UserDefaults.standard
    
    static var sortByValue: Int = SortBy.title.rawValue
    static var navigateUsingValue: Int = NavigateUsing.apple.rawValue
    static var tabSelectedValue: Int = TabSelected.map.rawValue
    static var sliderValue: Int = 5
    static var nightModeOn: Bool = true
    static var largeTextOn: Bool = false
    
    static var languageSelectedCode: String = Locale.preferredLanguages[0][0..<2]
    
    static var ranBefore: Bool = false
    
    static var path = Bundle.main.path(forResource: languageSelectedCode, ofType: "lproj")
    static var bundle = Bundle(path: path ?? Bundle.main.path(forResource: languageSelectedCode, ofType: "lproj")!)
    
    private init() {}
    
    static func setDefaultsVaribles() {
        
        if defaults.object(forKey: "ranBefore") == nil && !ranBefore {
            firstTimeRun()
        }
        
        sortByValue = defaults.integer(forKey: "sortByValue")
        navigateUsingValue = defaults.integer(forKey: "navigateUsingValue")
        tabSelectedValue = defaults.integer(forKey: "tabSelectedValue")
        sliderValue = defaults.integer(forKey: "sliderValue")
        
        nightModeOn = defaults.bool(forKey: "nightModeOn")
        largeTextOn = defaults.bool(forKey: "largeTextOn")
        
        languageSelectedCode = defaults.string(forKey: "languageSelectedCode")!
        
        ranBefore = defaults.bool(forKey: "ranBefore")
        
        //safety checks, should never enter them, but just in case
        if(languageSelectedCode.count > 2){
            languageSelectedCode = languageSelectedCode[0..<2]
        }
        if(languageSelectedCode != "ar" && languageSelectedCode != "en" && languageSelectedCode != "es" && languageSelectedCode != "he" && languageSelectedCode != "pt"){
            languageSelectedCode = "en"
        }
     
    }
    static func firstTimeRun() {
        
       
        if supportedLanguages[languageSelectedCode] != nil {
            
            defaults.register(defaults: ["languageSelectedCode" : languageSelectedCode])
        }
        else{
           
            defaults.register(defaults: ["languageSelectedCode" : "en"])
        }
        
        defaults.register(defaults: ["sliderValue" : sliderValue])
        
        defaults.register(defaults: ["tabSelectedValue" : tabSelectedValue])
        defaults.register(defaults: ["sortByValue" : sortByValue])
        
        defaults.register(defaults: ["nightModeOn" : nightModeOn])
        defaults.register(defaults: ["largeTextOn" : largeTextOn])
        defaults.register(defaults: ["navigateUsingValue" : navigateUsingValue])
        
        defaults.register(defaults: ["ranBefore" : true])
        defaults.synchronize()  
    }
    static func register(defaultsArgument: [String: Any]) {
        defaults.register(defaults: defaultsArgument)
        defaults.synchronize()
    }
    static func set(key: String, value: Any) {
        defaults.set(value, forKey: key)
    }
    static func get(key: String) -> String {
        return defaults.string(forKey: key)!
    }
    // source:
    // https://stackoverflow.com/a/27879342
    static func getLocalizedString(key: String) -> String {
        return (bundle?.localizedString(forKey: key, value: nil, table: nil))!
        
    }
}
