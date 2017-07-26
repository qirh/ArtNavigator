//
//  ViewController.swift
//  ArtNavigator
//
//  Created by saleh on 7/18/17.
//  Copyright © 2017 saleh. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    @IBOutlet weak var mapKit: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.title = NSLocalizedString("map", comment: "")
        print("\(self.title ?? "MAP NIL") loaded")
        
        
        self.tabBarController?.tabBar.items![0].image = UIImage(named: "map")
        self.tabBarController?.tabBar.items![0].title = NSLocalizedString("map", comment: "")
        
        self.tabBarController?.tabBar.items![1].image = UIImage(named: "list")
        self.tabBarController?.tabBar.items![1].title = NSLocalizedString("list", comment: "")
        
        self.tabBarController?.tabBar.items![2].image = UIImage(named: "settings")
        self.tabBarController?.tabBar.items![2].title = NSLocalizedString("settings", comment: "")
        
        self.tabBarController?.tabBar.items![3].image = UIImage(named: "about")
        self.tabBarController?.tabBar.items![3].title = NSLocalizedString("about", comment: "")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

