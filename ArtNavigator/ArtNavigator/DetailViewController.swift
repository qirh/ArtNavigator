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
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var labelDescriptionText: UILabel!
    
    @IBOutlet weak var labelInteriorExterior: UILabel!
    
    @IBOutlet weak var labelCategory: UILabel!
    @IBOutlet weak var labelObjectType: UILabel!
    @IBOutlet weak var labelMaterial: UILabel!
    
    @IBOutlet weak var labelArtistName: UILabel!
    
    //let artPiece: ArtPiece
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
