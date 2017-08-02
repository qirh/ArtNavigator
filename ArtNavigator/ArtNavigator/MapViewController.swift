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
    let cambridgeCoordinates = CLLocation(latitude: 42.375088, longitude: -71.118403)
    let regionRadius: CLLocationDistance = 1500
    let segueAnnotation = "annotation"
    
    
    var filePath : String {
        let manager = FileManager.default
        let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first! as NSURL
        return url.appendingPathComponent("objectsArray")!.path
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        print(mapView.isZoomEnabled)
        Defaults.setDefaultsVaribles()
        
        self.tabBarController?.tabBar.items![0].image = UIImage(named: "map")
        self.tabBarController?.tabBar.items![0].title = Defaults.getLocalizedString(key: "map")
        self.tabBarController?.tabBar.items![1].image = UIImage(named: "list")
        self.tabBarController?.tabBar.items![1].title = Defaults.getLocalizedString(key: "list")
        self.tabBarController?.tabBar.items![2].image = UIImage(named: "settings")
        self.tabBarController?.tabBar.items![2].title = Defaults.getLocalizedString(key: "settings")
        self.tabBarController?.tabBar.items![3].image = UIImage(named: "about")
        self.tabBarController?.tabBar.items![3].title = Defaults.getLocalizedString(key: "about")
        
        centerMapOnLocation(location: cambridgeCoordinates)
        
        
        if let array = NSKeyedUnarchiver.unarchiveObject(withFile: filePath) as? [AnyObject] {
            //if exists in documents
            
            ArtPieces.artPieces = array as! [ArtPiece]
        }
        else {
            //else parse and store it
            
            JSONParser.parseJSON()
            NSKeyedArchiver.archiveRootObject(ArtPieces.artPieces, toFile: filePath)
        }
        
        for artPiece in ArtPieces.artPieces {
            mapView.addAnnotation(artPiece)
        }
        mapView.delegate = self
    }
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        if let artPiece = annotation as? ArtPiece {
            let identifier = "pin"
            var viewAnnotation: MKPinAnnotationView
            //print("if1, ccae = \(identifier)")
            if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
                as? MKPinAnnotationView {
                dequeuedView.annotation = artPiece
                viewAnnotation = dequeuedView
            }
            else {
                viewAnnotation = MKPinAnnotationView(annotation: artPiece, reuseIdentifier: identifier)
                viewAnnotation.canShowCallout = true
                viewAnnotation.calloutOffset = CGPoint(x: -5, y: 5)
                viewAnnotation.rightCalloutAccessoryView = UIButton(type: .detailDisclosure) as UIView
            }
            
            viewAnnotation.pinTintColor = artPiece.pinTintColor()
            viewAnnotation.animatesDrop = true
            viewAnnotation.isDraggable = false
            return viewAnnotation
        }
        return nil
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let detailViewController = segue.destination as? DetailViewController {
            detailViewController.artPiece = (sender as! MKAnnotationView).annotation! as! ArtPiece
        }
 
        //print("\((sender as! MKAnnotation).accessionNumber)")
        
    }
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        
        if control == view.rightCalloutAccessoryView {
            self.performSegue(withIdentifier: segueAnnotation, sender: view)
        }
    }
    
    // source:
    // https://stackoverflow.com/a/2406167
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        super.viewWillAppear(animated)
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        super.viewWillDisappear(animated)
    }
    
}

