//
//  ViewController.swift
//  CambridgeArt
//
//  Created by saleh on 7/18/17.
//  Copyright © 2017 saleh. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var buttonCambridge: UIButton!
    
    
    // set initial location in Cambridge
    let cambridgeCoordinates = CLLocation(latitude: 42.375088, longitude: -71.118403)
    let regionRadius: CLLocationDistance = 1500
    let segueAnnotation = "segueAnnotation"
    
    
    override func viewDidLoad() {
        print("viewDidLoad() - Map")
        super.viewDidLoad()
        
        
        centerMapOnLocation(location: cambridgeCoordinates, radius: regionRadius)
        
        buttonCambridge.setTitle(Defaults.getLocalizedString(key: "cambridge"), for: .normal)
        
        buttonCambridge.layer.shadowRadius =  2.0
        buttonCambridge.layer.shadowColor =  UIColor.black.cgColor
        buttonCambridge.layer.shadowOpacity =  0.3
        buttonCambridge.layer.borderColor = UIColor.black.withAlphaComponent(0.5).cgColor
        buttonCambridge.layer.borderWidth = 0.8
        
        
        for artPiece in ArtPieces.artPieces {
            mapView.addAnnotation(artPiece)
        }
        mapView.delegate = self
    }
    
    func centerMapOnLocation(location: CLLocation, radius: CLLocationDistance) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, radius * 2.3, radius * 2.3)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        if let artPiece = annotation as? ArtPiece {
            let identifier = "pin"
            var viewAnnotation: MKPinAnnotationView
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
            detailViewController.artPiece = ((sender as! MKAnnotationView).annotation! as! ArtPiece)
        }
        self.tabBarController?.tabBar.isHidden = true
    }
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        
        if control == view.rightCalloutAccessoryView {
            self.performSegue(withIdentifier: segueAnnotation, sender: view)
        }
    }
    
    @IBAction func buttonCambridgePressed(_ sender: UIButton) {
        centerMapOnLocation(location: cambridgeCoordinates, radius: regionRadius)
    }
    
    
    // source:
    // https://stackoverflow.com/a/2406167
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        self.tabBarController?.tabBar.isHidden = false
        super.viewWillAppear(animated)
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        super.viewWillDisappear(animated)
    }
    
}

