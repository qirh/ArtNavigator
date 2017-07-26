//
//  AboutViewController.swift
//  ArtNavigator
//
//  Created by saleh on 7/25/17.
//  Copyright © 2017 saleh. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController, UITextViewDelegate {
    
    
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var text: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = NSLocalizedString("about", comment: "")
        print("\(self.title ?? "ABOUT NIL") loaded")
        
        //self.tabBarController?.image
        
        let textString = NSLocalizedString("about-me", comment: "")
        let textLink = NSLocalizedString("git", comment: "")
        self.text.text = textString + " " + textLink
        self.text.delegate = self
        
        
        // ImageView resizing from here:
        // https://stackoverflow.com/a/41266504
        
        image.image = UIImage(named: "me")
        
        image.autoresizingMask = [.flexibleWidth, .flexibleHeight, .flexibleBottomMargin, .flexibleRightMargin, .flexibleLeftMargin, .flexibleTopMargin]
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        
        image.layer.borderWidth = 1.5
        image.layer.cornerRadius = 5.0
        image.layer.masksToBounds = true
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

