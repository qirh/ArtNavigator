//
//  AboutViewController.swift
//  ArtNavigator
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
        let gitLink = "\n\nGit Repo: https://github.com/qirh/ArtNavigator"
        let dataLink = "\nData Source: https://data.cambridgema.gov/General-Government/Cambridge-Public-Art-Locations/svyv-zh72/data"
        
        self.textAbout.text = textString + gitLink + dataLink
        self.textAbout.delegate = self
        
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

