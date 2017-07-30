//
//  Defaults.swift
//  ArtNavigator
//
//  Created by saleh on 7/27/17.
//  Copyright © 2017 saleh. All rights reserved.
//

import Foundation

class Defaults {
    static let supportedLanguages = ["ar":"العربية", "en":"English", "es":"Español", "fr":"Francês", "pt":"Português"]
    
    // source:
    // https://swift3tutorials.com/swift-3-user-defaults/
    static let defaults: UserDefaults = UserDefaults.standard
    static var sliderValue: Int = 0
    static var languageSelectedCode: String = ""
    static var nightModeOn: Bool = true
    
    static let path = Bundle.main.path(forResource: languageSelectedCode, ofType: "lproj")
    static let bundle = Bundle(path: path!)
    
    
    private init(){}
    
    static func setDefaultsVaribles() {
        sliderValue = defaults.integer(forKey: "sliderValue")
        languageSelectedCode = defaults.string(forKey: "languageSelectedCode")!
        nightModeOn = defaults.bool(forKey: "nightModeOn")
        
        if(languageSelectedCode.characters.count > 2){
            print("languageSelectedCode is longer than 2: '\(languageSelectedCode)'")
            languageSelectedCode = languageSelectedCode.substring(to:languageSelectedCode.index(languageSelectedCode.startIndex, offsetBy: 2))
        }
        if(languageSelectedCode != "ar" && languageSelectedCode != "en" && languageSelectedCode != "es" && languageSelectedCode != "fr" && languageSelectedCode != "pt"){
            print("languageSelectedCode is none of the supported lanuages: '\(languageSelectedCode)'")
            languageSelectedCode = "en"
        }
    }
    static func register(defaultsArgument: [String: Any]) {
        defaults.register(defaults: defaultsArgument)
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
    }
    // source:
    // https://stackoverflow.com/a/27879342
    static func getLocalizedString(key: String) -> String {
        /*
        print("lang: \(languageSelectedCode)")
        print("key: \(key)")
        print("val: \(bundle?.localizedString(forKey: key, value: nil, table: nil ?? "nil") ?? "niiiiiil")")
        */
        return (bundle?.localizedString(forKey: key, value: nil, table: nil))!
    }
    
}
