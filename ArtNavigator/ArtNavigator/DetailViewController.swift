//
//  DetailViewController.swift
//  ArtNavigator
//
//  Created by saleh on 7/18/17.
//  Copyright © 2017 saleh. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var map: UILabel!
    @IBOutlet weak var buttonNavigate: UIButton!
    
    @IBOutlet weak var labelLocationName: UILabel!
    @IBOutlet weak var labelLocationDescription: UILabel!
    @IBOutlet weak var labelAddress: UILabel!
    
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var labelDescriptionText: UILabel!
    
    @IBOutlet weak var labelInteriorExterior: UILabel!
    
    @IBOutlet weak var labelCategory: UILabel!
    @IBOutlet weak var labelObjectType: UILabel!
    @IBOutlet weak var labelMaterial: UILabel!
    
    @IBOutlet weak var labelArtistName: UILabel!
    
    var artPiece: ArtPiece? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        
        
        setViews()

    }
    
    func setViews() {
        
        //navigate bar
        self.title = "\(artPiece?.title ?? "error: title nil") - \(artPiece?.year ?? "error: year nil")"
        let labelTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        labelTitle.text = self.title
        labelTitle.textColor = UIColor.black
        labelTitle.font = UIFont(name: "Helvetica-Bold", size: 18)
        labelTitle.backgroundColor = UIColor.clear
        labelTitle.adjustsFontSizeToFitWidth = true
        self.navigationItem.titleView = labelTitle
        
        //button
        buttonNavigate.layer.borderWidth = 2
        buttonNavigate.layer.cornerRadius = 4
        buttonNavigate.layer.borderColor = UIColor.black.cgColor
        buttonNavigate.setTitle(Defaults.getLocalizedString(key: "navigate"), for: .normal)
        
        labelLocationName.text = "\(Defaults.getLocalizedString(key: "location")): \(artPiece?.locationName ?? Defaults.getLocalizedString(key: "No Information"))"
        labelLocationDescription.text = "\(Defaults.getLocalizedString(key: "locationDescription")):\n \(artPiece?.locationDescription ?? Defaults.getLocalizedString(key: "No Information"))"
        labelAddress.text = "\(Defaults.getLocalizedString(key: "address")):\n \(artPiece?.address ?? Defaults.getLocalizedString(key: "No Information"))"
        
        labelDescription.text = "\(Defaults.getLocalizedString(key: "descriptionOfTheArtPiece"))"
        labelDescriptionText.text = "\(artPiece?.description ?? Defaults.getLocalizedString(key: "No Information"))"
        
        if(artPiece?.isInterior)! {
            labelInteriorExterior.text = "\(Defaults.getLocalizedString(key: "locatedIndoors"))"
        }
        else {
           labelInteriorExterior.text = "\(Defaults.getLocalizedString(key: "locatedOutdoors"))"
        }
        
        labelCategory.text = "\(Defaults.getLocalizedString(key: "category")):\n\(Defaults.getLocalizedString(key: "\(artPiece?.category.rawValue ?? Defaults.getLocalizedString(key: "No Information"))"))"
        labelObjectType.text = "\(Defaults.getLocalizedString(key: "objectType")):\n\(artPiece?.objectType ?? Defaults.getLocalizedString(key: "No Information"))"
        labelMaterial.text = "\(Defaults.getLocalizedString(key: "material"))\n\(artPiece?.material ?? Defaults.getLocalizedString(key: "No Information"))"
        
        labelArtistName.text = "\(Defaults.getLocalizedString(key: "byArtist")): \(artPiece?.firstName ?? Defaults.getLocalizedString(key: "No Information")) \(artPiece?.lastName ?? Defaults.getLocalizedString(key: "No Information"))"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
