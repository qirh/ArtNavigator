//
//  Defaults.swift
//  ArtNavigator
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

class Defaults {
    
    static let supportedLanguages = ["ar":"العربية", "en":"English", "es":"Español", "he":"עִברִית", "pt":"Português"]
    
    // source:
    // https://swift3tutorials.com/swift-3-user-defaults/
    static let defaults: UserDefaults = UserDefaults.standard
    
    static var sortByValue: Int = SortBy.title.rawValue
    static var sliderValue: Int = 5
    
    static var nightModeOn: Bool = true
    static var largeTextOn: Bool = false
    
    static var languageSelectedCode: String = Locale.preferredLanguages[0][0..<2]
    
    static var ranBefore: Bool = false
    
    static var path = Bundle.main.path(forResource: languageSelectedCode, ofType: "lproj")
    static var bundle = Bundle(path: path ?? Bundle.main.path(forResource: languageSelectedCode, ofType: "lproj")!)
    
    private init() {}
    
    static func setDefaultsVaribles() {
        printDefaults()
        if defaults.object(forKey: "ranBefore") == nil && !ranBefore {
            firstTimeRun()
        }
        
        sortByValue = defaults.integer(forKey: "sortByValue")
        sliderValue = defaults.integer(forKey: "sliderValue")
        
        nightModeOn = defaults.bool(forKey: "nightModeOn")
        largeTextOn = defaults.bool(forKey: "largeTextOn")
        
        languageSelectedCode = defaults.string(forKey: "languageSelectedCode")!
        
        ranBefore = defaults.bool(forKey: "ranBefore")
        
        //safety checks, should never enter them, but just in case
        if(languageSelectedCode.characters.count > 2){
            languageSelectedCode = languageSelectedCode[0..<2]
        }
        if(languageSelectedCode != "ar" && languageSelectedCode != "en" && languageSelectedCode != "es" && languageSelectedCode != "he" && languageSelectedCode != "pt"){
            languageSelectedCode = "en"
        }
        printDefaults()
    }
    static func firstTimeRun() {
        print("**\nfirstTimeRun\n**\n")
        if supportedLanguages[languageSelectedCode] != nil {
            defaults.register(defaults: ["languageSelectedCode" : languageSelectedCode])
        }
        else{
            defaults.register(defaults: ["languageSelectedCode" : "en"])
        }
        
        defaults.register(defaults: ["sliderValue" : sliderValue])
        defaults.register(defaults: ["sortByValue" : sortByValue])
        //
        defaults.register(defaults: ["nightModeOn" : nightModeOn])
        defaults.register(defaults: ["largeTextOn" : largeTextOn])
        //
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
    //debugging purposes
    static func printDefaults() {
        print("**\nprintDefaults()\n**\n")
        print("sliderValue: \(sliderValue)")
        print("sortByValue: \(sortByValue)")
        
        print("nightModeOn: \(nightModeOn)")
        print("largeTextOn: \(largeTextOn)")
        
        print("languageSelectedCode: \(languageSelectedCode)")
        
        print("ranBefore: \(ranBefore)")
        print("**\nprintDefaults()\n**\n")
    }
    // source:
    // https://stackoverflow.com/a/27879342
    static func getLocalizedString(key: String) -> String {
        return (bundle?.localizedString(forKey: key, value: nil, table: nil))!
        
    }
}
