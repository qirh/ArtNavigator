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
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.pickerLanguage.delegate = self
        self.pickerLanguage.dataSource = self
        
        buttonSave.layer.borderWidth = 0.7
        buttonSave.layer.cornerRadius = 5
        //buttonSave.titleLabel!.adjustsFontSizeToFitWidth = true
        
        Defaults.setDefaultsVaribles()
        setViews()
    }
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        Defaults.setDefaultsVaribles()
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
        case 0:               //The following are the ios language codes: ar, en, es, he and pt
            Defaults.languageSelectedCode = "ar"
            myImageView.image = UIImage(named: Defaults.languageSelectedCode)
        case 1:
            Defaults.languageSelectedCode = "en"
            myImageView.image = UIImage(named: Defaults.languageSelectedCode)
        case 2:
            Defaults.languageSelectedCode = "es"
            myImageView.image = UIImage(named: Defaults.languageSelectedCode)
        case 3:
            Defaults.languageSelectedCode = "he"
            myImageView.image = UIImage(named: Defaults.languageSelectedCode)
        case 4:
            Defaults.languageSelectedCode = "pt"
            myImageView.image = UIImage(named: Defaults.languageSelectedCode)
        
        default:
            Defaults.languageSelectedCode = "xx"
            myImageView.image = nil
        }
        languageSelected = Defaults.supportedLanguages[Defaults.languageSelectedCode]!
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
                Defaults.languageSelectedCode = "ar"
            case 1:
                Defaults.languageSelectedCode = "en"
            case 2:
                Defaults.languageSelectedCode = "es"
            case 3:
                Defaults.languageSelectedCode = "he"
            case 4:
                Defaults.languageSelectedCode = "pt"
            default:
                Defaults.languageSelectedCode = "xx"
        }
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        //https://stackoverflow.com/a/9695118
        let sliderValueFloat = Float(lroundf(sliderResults.value))
        sender.setValue(sliderValueFloat, animated: true)
        
        Defaults.sliderValue = Int(sliderValueFloat)
        labelResultsNumbers.text = "\(Defaults.sliderValue)"
    }
    @IBAction func switchChanged(_ sender: UISwitch) {
        Defaults.nightModeOn = sender.isOn
    }
    
    @IBAction func buttonSavePressed(_ sender: Any) {
        let oldLanguageSelectedCode = Defaults.get(key: "languageSelectedCode")
        Defaults.set(key: "sliderValue", value: Defaults.sliderValue)
        Defaults.set(key: "languageSelectedCode", value: Defaults.languageSelectedCode)
        Defaults.set(key: "nightModeOn", value: Defaults.nightModeOn)
        Defaults.setDefaultsVaribles()
        if oldLanguageSelectedCode != Defaults.languageSelectedCode{
            toast()
        }
    }
    func setViews() {
        labelLanguage.text = Defaults.getLocalizedString(key: "language")
        labelResultsNumbers.text = "\(Defaults.sliderValue)"
        switchNightMode.isOn = Defaults.nightModeOn
        sliderResults.setValue(Float(Defaults.sliderValue), animated: true)
        
        labelNightMode.text = Defaults.getLocalizedString(key: "nightMode")
        labelResults.text = Defaults.getLocalizedString(key: "resultsPerPage")
        buttonSave.setTitle(Defaults.getLocalizedString(key: "save"), for: .normal)
        
        
        switch Defaults.languageSelectedCode {
            case "ar":
                pickerLanguage.selectRow(0, inComponent: 0, animated: true)
            case "en":
                pickerLanguage.selectRow(1, inComponent: 0, animated: true)
            case "es":
                pickerLanguage.selectRow(2, inComponent: 0, animated: true)
            case "he":
                pickerLanguage.selectRow(3, inComponent: 0, animated: true)
            case "pt":
                pickerLanguage.selectRow(4, inComponent: 0, animated: true)
            default:
                pickerLanguage.selectRow(1, inComponent: 0, animated: true)
        }
        
    }
    func toast() {
        let options: NSDictionary = [
            kCRToastTextKey : Defaults.getLocalizedString(key: "restart"),
            kCRToastTextAlignmentKey : NSTextAlignment.center.rawValue,
            kCRToastBackgroundColorKey : UIColor.red,
            kCRToastAnimationInTypeKey : CRToastAnimationType.gravity.rawValue,
            kCRToastAnimationOutTypeKey : CRToastAnimationType.gravity.rawValue,
            kCRToastAnimationInDirectionKey : CRToastAnimationDirection.left.rawValue,
            kCRToastAnimationOutDirectionKey : CRToastAnimationDirection.right.rawValue
        ]
        
        CRToastManager.showNotification(options: options as! [AnyHashable : Any], completionBlock: { () -> Void in
        })
    }
}
