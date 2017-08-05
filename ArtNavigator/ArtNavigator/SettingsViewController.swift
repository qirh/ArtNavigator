//
//  SettingsViewController.swift
//  ArtNavigator
//
//  Created by saleh on 7/25/17.
//  Copyright © 2017 saleh. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var viewScroll: UIScrollView!
    @IBOutlet weak var viewTableSettings: UIView!
    
    //viewTableSettings
    @IBOutlet weak var labelTableSettings: UILabel!
    @IBOutlet weak var viewResults: UIView!
    @IBOutlet weak var viewSort: UIView!
    
    //viewTableSettings --> viewResults
    @IBOutlet weak var labelResults: UILabel!
    @IBOutlet weak var labelResultsNumbers: UILabel!
    @IBOutlet weak var sliderResults: UISlider!
    
    //viewTableSettings --> viewSort
    @IBOutlet weak var labelSort: UILabel!
    @IBOutlet weak var segmentSort: UISegmentedControl!
    
    
    @IBOutlet weak var viewAppSettings: UIView!
    
    //viewAppSettings
    @IBOutlet weak var labelAppSettings: UILabel!
    @IBOutlet weak var viewNightMode: UIView!
    @IBOutlet weak var viewLargeText: UIView!
    @IBOutlet weak var viewLanguage: UIView!
    
    //viewAppSettings --> viewNightMode
    @IBOutlet weak var labelNightMode: UILabel!
    @IBOutlet weak var switchNightMode: UISwitch!
    
    //viewAppSettings --> viewLargeTexr
    @IBOutlet weak var labelLargeText: UILabel!
    @IBOutlet weak var switchLargeText: UISwitch!
    
    //viewAppSettings --> viewLanguage
    @IBOutlet weak var labelLanguage: UILabel!
    @IBOutlet weak var pickerLanguage: UIPickerView!
    
    //buttonSave
    @IBOutlet weak var buttonSave: UIButton!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.pickerLanguage.delegate = self
        self.pickerLanguage.dataSource = self
        
        Defaults.setDefaultsVaribles()
        viewTableSettings.layer.borderWidth = 0.5
        viewTableSettings.layer.borderColor = UIColor.yellow.cgColor
        viewAppSettings.layer.borderWidth = 0.5
        viewAppSettings.layer.borderColor = UIColor.yellow.cgColor
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
    @IBAction func switchNightModeChanged(_ sender: UISwitch) {
        Defaults.nightModeOn = sender.isOn
    }
    @IBAction func switchLargeTextChanged(_ sender: UISwitch) {
        Defaults.largeTextOn = sender.isOn
    }
    @IBAction func segmentedControlChanged(_ sender: UISegmentedControl) {
        Defaults.sortByValue = sender.selectedSegmentIndex
    }
    
    
    @IBAction func buttonSavePressed(_ sender: Any) {
        
        let oldLanguageSelectedCode = Defaults.get(key: "languageSelectedCode")
        Defaults.set(key: "sliderValue", value: Defaults.sliderValue)
        Defaults.set(key: "sortByValue", value: Defaults.sortByValue)
        
        Defaults.set(key: "nightModeOn", value: Defaults.nightModeOn)
        Defaults.set(key: "largeTextOn", value: Defaults.largeTextOn)
        
        Defaults.set(key: "languageSelectedCode", value: Defaults.languageSelectedCode)
        
        Defaults.setDefaultsVaribles()
        
        if oldLanguageSelectedCode != Defaults.languageSelectedCode{
            toast()
        }
    }
    func setViews() {
        labelTableSettings.text = Defaults.getLocalizedString(key: "tableSettings")
        //
        labelResults.text = "\(Defaults.getLocalizedString(key: "resultsPerPage")):"
        labelResultsNumbers.text = "\(Defaults.sliderValue)"
        sliderResults.setValue(Float(Defaults.sliderValue), animated: true)
        labelSort.text = "\(Defaults.getLocalizedString(key: "sortBy")):"
        
        segmentSort.selectedSegmentIndex = Defaults.sortByValue
        segmentSort.setTitle(Defaults.getLocalizedString(key: "title"), forSegmentAt: 0)
        segmentSort.setTitle(Defaults.getLocalizedString(key: "category"), forSegmentAt: 1)
        segmentSort.setTitle(Defaults.getLocalizedString(key: "artist"), forSegmentAt: 2)
        
        
        
        labelAppSettings.text = Defaults.getLocalizedString(key: "appSettings")
        //
        labelNightMode.text = Defaults.getLocalizedString(key: "nightMode")
        switchNightMode.isOn = Defaults.nightModeOn
        
        labelLargeText.text = Defaults.getLocalizedString(key: "largeText")
        switchLargeText.isOn = Defaults.largeTextOn
        
        labelLanguage.text = Defaults.getLocalizedString(key: "language")
        
        buttonSave.setTitle(Defaults.getLocalizedString(key: "save"), for: .normal)
        buttonSave.layer.borderWidth = 0.7
        buttonSave.layer.cornerRadius = 5
        
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
        
        if(Defaults.languageSelectedCode == "ar" || Defaults.languageSelectedCode == "he"){
            labelAppSettings.textAlignment = .right
            labelTableSettings.textAlignment = .right
            labelResults.textAlignment = .right
            labelSort.textAlignment = .right
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
