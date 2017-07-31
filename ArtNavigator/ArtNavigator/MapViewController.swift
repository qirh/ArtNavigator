//
//  ViewController.swift
//  ArtNavigator
//
//  Created by saleh on 7/18/17.
//  Copyright © 2017 saleh. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    
    // set initial location in Cambridge
    let initialLocation = CLLocation(latitude: 42.371936, longitude: -71.108003)
    let regionRadius: CLLocationDistance = 1000
    
    var filePath : String {
        let manager = FileManager.default
        let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first! as NSURL
        return url.appendingPathComponent("objectsArray")!.path
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        Defaults.setDefaultsVaribles()
        
        self.tabBarController?.tabBar.items![0].image = UIImage(named: "map")
        self.tabBarController?.tabBar.items![0].title = Defaults.getLocalizedString(key: "map")
        self.tabBarController?.tabBar.items![1].image = UIImage(named: "list")
        self.tabBarController?.tabBar.items![1].title = Defaults.getLocalizedString(key: "list")
        self.tabBarController?.tabBar.items![2].image = UIImage(named: "settings")
        self.tabBarController?.tabBar.items![2].title = Defaults.getLocalizedString(key: "settings")
        self.tabBarController?.tabBar.items![3].image = UIImage(named: "about")
        self.tabBarController?.tabBar.items![3].title = Defaults.getLocalizedString(key: "about")
        
        centerMapOnLocation(location: initialLocation)
        
        JSONParser.parseJSON()
        
        var success = false
        
        success = NSKeyedArchiver.archiveRootObject(ArtPieces.artPieces, toFile: filePath)
        
        if success {
            print("Saved artpieces")
        } else {
            print("Didn't save artpieces")
        }

        
    }
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }


}

