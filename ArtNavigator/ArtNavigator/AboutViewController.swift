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
        
        //self.tabBarController?.image
        
        let textString = Defaults.getLocalizedString(key: "aboutMe")
        let textLink = "http://arkanis.de/weblog/2009-04-11-friendly-blank-pages/blank.html"
        self.textAbout.text = textString + " " + textLink
        self.textAbout.delegate = self
        
        
        // ImageView resizing from here:
        // https://stackoverflow.com/a/41266504
        
        imageAbout.image = UIImage(named: "me")
        
        imageAbout.autoresizingMask = [.flexibleWidth, .flexibleHeight, .flexibleBottomMargin, .flexibleRightMargin, .flexibleLeftMargin, .flexibleTopMargin]
        imageAbout.contentMode = .scaleAspectFit
        imageAbout.clipsToBounds = true
        
        imageAbout.layer.borderWidth = 1.5
        imageAbout.layer.cornerRadius = 5.0
        imageAbout.layer.masksToBounds = true
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

