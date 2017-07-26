//
//  SettingsViewController.swift
//  ArtNavigator
//
//  Created by saleh on 7/25/17.
//  Copyright © 2017 saleh. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var viewNightMode: UIView!
    @IBOutlet weak var labelNightMode: UILabel!
    @IBOutlet weak var switchNightMode: UISwitch!
    
    @IBOutlet weak var viewResults: UIView!
    @IBOutlet weak var labelResults: UILabel!
    @IBOutlet weak var labelResultsNumbers: UILabel!
    @IBOutlet weak var sliderResults: UISlider!
    
    @IBOutlet weak var labelLanguage: UILabel!
    @IBOutlet weak var pickerLanguage: UIPickerView!
    
    @IBOutlet weak var buttonSave: UIButton!
    
    //let tav =  EWToastAlertView(message: "Hey!", image: UIImage(named: "Cat Icon")!)

    
    let supportedLanguages = ["ar":"العربية", "en":"English", "es":"Español", "fr":"Francês", "pt":"Português"]
    
    // source: 
    // https://swift3tutorials.com/swift-3-user-defaults/
    let defaults: UserDefaults = UserDefaults.standard
    var sliderValue: Int = 0
    var languageSelectedCode: String = ""
    var nightModeOn: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pickerLanguage.delegate = self
        self.pickerLanguage.dataSource = self
        
        buttonSave.layer.borderWidth = 0.7
        buttonSave.layer.cornerRadius = 5
        
        defaults.register(defaults: ["sliderValue" : 5])
        defaults.register(defaults: ["languageSelectedCode" : Locale.preferredLanguages[0]])
        defaults.register(defaults: ["nightModeOn" : true])
        
        setDefaults()
        printDefaults()
        setViews()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("2")
        setDefaults()
        printDefaults()
        setViews()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 5
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 60
    }
    
    // source:
    // https://stackoverflow.com/a/36072699
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let myView = UIView(frame: CGRect(x: 0, y: 0, width: pickerView.bounds.width - 30, height: 60))
        
        let myImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        
        var languageSelected: String
        switch row {
        case 0:                             //The following are the ios language codes: en, fr, es, pt and ar
            languageSelectedCode = "ar"
            myImageView.image = UIImage(named: languageSelectedCode)
        case 1:
            languageSelectedCode = "en"
            myImageView.image = UIImage(named: languageSelectedCode)
        case 2:
            languageSelectedCode = "es"
            myImageView.image = UIImage(named: languageSelectedCode)
        case 3:
            languageSelectedCode = "fr"
            myImageView.image = UIImage(named: languageSelectedCode)
        case 4:
            languageSelectedCode = "pt"
            myImageView.image = UIImage(named: languageSelectedCode)
        
        default:
            languageSelectedCode = "xx"
            myImageView.image = nil
        }
        languageSelected = supportedLanguages[languageSelectedCode]!
        let myLabel = UILabel(frame: CGRect(x: 60, y: 0, width: pickerView.bounds.width - 90, height: 60 ))
        //myLabel.font = UIFont(name:some, size: 18)
        myLabel.text = languageSelected
        
        myView.addSubview(myLabel)
        myView.addSubview(myImageView)
        
        return myView
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        switch row {    //The following are the ios language codes: en, fr, es, pt and ar
            case 0:
                languageSelectedCode = "ar"
            case 1:
                languageSelectedCode = "en"
            case 2:
                languageSelectedCode = "es"
            case 3:
                languageSelectedCode = "fr"
            case 4:
                languageSelectedCode = "pt"
            default:
                languageSelectedCode = "xx"
        }
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        //https://stackoverflow.com/a/9695118
        let sliderValueFloat = Float(lroundf(sliderResults.value))
        sender.setValue(sliderValueFloat, animated: true)
        
        sliderValue = Int(sliderValueFloat)
        labelResultsNumbers.text = "\(sliderValue)"
    }
    @IBAction func switchChanged(_ sender: UISwitch) {
        nightModeOn = sender.isOn
    }
    
    @IBAction func buttonSavePressed(_ sender: Any) {
        defaults.set(sliderValue, forKey: "sliderValue")
        defaults.set(languageSelectedCode, forKey: "languageSelectedCode")
        defaults.set(nightModeOn, forKey: "nightModeOn")
        
        let tav = EWToastAlertView()
        tav.message = "Language will change upon restating the app"
        tav.dismissTime = 3.0
        /*
        tav.shouldDismissWithTap
        
        tav.frameDuration = 0.1
        tav.repeatAnimation = false
        */
        
        tav.shouldDismissWithTap = true
        tav.shouldDismissWithTime = true
        tav.show()
        //tav.dismiss() to Hide



    }
    func setViews() {
        labelResultsNumbers.text = "\(sliderValue)"
        switchNightMode.isOn = nightModeOn
        sliderResults.setValue(Float(sliderValue), animated: true)
        
        labelNightMode.text = NSLocalizedString("nightMode", comment: "")
        labelResults.text = NSLocalizedString("resultsPerPage", comment: "")
        buttonSave.setTitle(NSLocalizedString("save", comment: ""), for: .normal)
        
        switch languageSelectedCode {
            case "ar":
                pickerLanguage.selectRow(0, inComponent: 0, animated: true)
            case "en":
                pickerLanguage.selectRow(1, inComponent: 0, animated: true)
            case "es":
                pickerLanguage.selectRow(2, inComponent: 0, animated: true)
            case "fr":
                pickerLanguage.selectRow(3, inComponent: 0, animated: true)
            case "pt":
                pickerLanguage.selectRow(4, inComponent: 0, animated: true)
            default:
                pickerLanguage.selectRow(1, inComponent: 0, animated: true)
        }
        
    }
    
    func setDefaults() {
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
    func printDefaults() {
        print("sliderValue: \(sliderValue)")
        print("languageSelectedCode: \(languageSelectedCode)")
        print("nightModeOn: \(nightModeOn)")
    }
}
