//
//  Defaults.swift
//  ArtNavigator
//
//  Created by saleh on 7/27/17.
//  Copyright © 2017 saleh. All rights reserved.
//

import Foundation

class Defaults {
    static let supportedLanguages = ["ar":"العربية", "en":"English", "es":"Español", "he":"עִברִית", "pt":"Português"]
    
    // source:
    // https://swift3tutorials.com/swift-3-user-defaults/
    static let defaults: UserDefaults = UserDefaults.standard
    static var sliderValue: Int = 5
    static var languageSelectedCode: String = Locale.preferredLanguages[0][0..<2]
    static var nightModeOn: Bool = true
    static var ranBefore: Bool = false
    
    static var path = Bundle.main.path(forResource: languageSelectedCode, ofType: "lproj")
    static var bundle = Bundle(path: path ?? Bundle.main.path(forResource: languageSelectedCode, ofType: "lproj")!)
    
    private init() {}
    
    static func setDefaultsVaribles() {
        
        if defaults.object(forKey: "ranBefore") == nil && !ranBefore {
            firstTimeRun()
        }
        
        sliderValue = defaults.integer(forKey: "sliderValue")
        languageSelectedCode = defaults.string(forKey: "languageSelectedCode")!
        nightModeOn = defaults.bool(forKey: "nightModeOn")
        ranBefore = defaults.bool(forKey: "ranBefore")
        
        //safety checks, should never enter them, but just in case
        if(languageSelectedCode.characters.count > 2){
            languageSelectedCode = languageSelectedCode[0..<2]
        }
        if(languageSelectedCode != "ar" && languageSelectedCode != "en" && languageSelectedCode != "es" && languageSelectedCode != "he" && languageSelectedCode != "pt"){
            languageSelectedCode = "en"
        }
    }
    static func firstTimeRun() {
        
        if supportedLanguages[languageSelectedCode] != nil {
            print("language exists. '\(languageSelectedCode)'")
            defaults.register(defaults: ["languageSelectedCode" : languageSelectedCode])
        }
        else{
            print("language does not exist. '\(languageSelectedCode)'")
            defaults.register(defaults: ["languageSelectedCode" : "en"])
        }
        defaults.register(defaults: ["sliderValue" : 5])
        defaults.register(defaults: ["nightModeOn" : true])
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
    static func printDefaults() {
        print("printDefaults()")
        print("sliderValue: \(sliderValue)")
        print("languageSelectedCode: \(languageSelectedCode)")
        print("nightModeOn: \(nightModeOn)")
        print("ranBefore: \(ranBefore)\n***\n")
    }
    // source:
    // https://stackoverflow.com/a/27879342
    static func getLocalizedString(key: String) -> String {
        return (bundle?.localizedString(forKey: key, value: nil, table: nil))!
        
    }
}
