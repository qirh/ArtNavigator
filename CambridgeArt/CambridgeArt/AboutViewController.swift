//
//  AboutViewController.swift
//  CambridgeArt
//
//  Created by saleh on 7/25/17.
//  Copyright © 2017 saleh. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController, UITextViewDelegate {
    @IBOutlet weak var imageAbout: UIImageView!
    @IBOutlet weak var textAbout: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let textString = Defaults.getLocalizedString(key: "aboutMe")
        
        let gitLink = "\n\nGit Repo: https://github.com/qirh/CambridgeArt"
        let dataLink = "\nData Source: https://data.cambridgema.gov/General-Government/Cambridge-Public-Art-Locations/svyv-zh72/data"
        
        /*
         red->sculpture. green->mural. blue->electronicMedia
        */
        let colorString = Defaults.getLocalizedString(key: "color")
        
        let red = Defaults.getLocalizedString(key: "sculpture") + Defaults.getLocalizedString(key: "comma") + " "
        let green = Defaults.getLocalizedString(key: "mural") + Defaults.getLocalizedString(key: "comma") + " "
        let blue = Defaults.getLocalizedString(key: "electronicMedia") + "."
        let colors: [String: UIColor] = [red: UIColor.red, green: UIColor.green.darker()!, blue: UIColor.blue.darker()!]
        
        self.textAbout.text = textString + "\n" + colorString + ": " + red + green + blue
        self.textAbout.delegate = self
        
        let attributedString = NSMutableAttributedString(string: textAbout.text)
        for (artKind, textColor) in colors {
            let range = (textAbout.text as NSString).range(of: artKind)
            attributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: textColor , range: range)
        }
        textAbout.attributedText = attributedString

        if(Defaults.languageSelectedCode == "ar" || Defaults.languageSelectedCode == "he"){
            self.textAbout.textAlignment = .right
        }
        
        // source:
        // https://stackoverflow.com/a/41266504
        
        imageAbout.image = UIImage(named: "me")
        
        imageAbout.autoresizingMask = [.flexibleWidth, .flexibleHeight, .flexibleBottomMargin, .flexibleRightMargin, .flexibleLeftMargin, .flexibleTopMargin]
        imageAbout.contentMode = .scaleAspectFit
        imageAbout.clipsToBounds = true
        
        imageAbout.layer.borderWidth = 1.5
        imageAbout.layer.cornerRadius = 5.0
        imageAbout.layer.masksToBounds = true
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        textAbout.setContentOffset(CGPoint.zero, animated: false)
    }
    
}

