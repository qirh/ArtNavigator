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
        
        labelLocationName.text = "location: \(artPiece?.locationName ?? "err")"
        labelLocationDescription.text = "location description:\n \(artPiece?.locationDescription ?? "err")"
        labelAddress.text = "address:\n \(artPiece?.address ?? "err")"
        
        labelDescription.text = "description on the art piece:"
        labelDescriptionText.text = artPiece?.description
        
        if(artPiece?.isInterior)! {
            labelInteriorExterior.text = "located indoors"
        }
        else {
           labelInteriorExterior.text = "located outdoors"
        }
        
        labelCategory.text = "category\n\(artPiece?.category.rawValue ?? "err")"
        labelObjectType.text = "object type\n\(artPiece?.objectType ?? "err")"
        labelMaterial.text = "material\n\(artPiece?.material ?? "err")"
        
        labelArtistName.text = "\(artPiece?.firstName ?? "err") \(artPiece?.lastName ?? "err")"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
