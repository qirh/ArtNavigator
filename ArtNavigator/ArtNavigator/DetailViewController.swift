//
//  DetailViewController.swift
//  ArtNavigator
//
//  Created by saleh on 7/18/17.
//  Copyright © 2017 saleh. All rights reserved.
//

import UIKit
import MapKit

class DetailViewController: UIViewController, MKMapViewDelegate {
    
    
    @IBOutlet weak var mapView: MKMapView!
    
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
    @IBOutlet weak var buttonShowMore: UIButton!
    
    var showMoreIsPressed = true
    var artPiece: ArtPiece? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        let cambridgeCoordinates = CLLocation(latitude: (artPiece?.latitude)!, longitude: (artPiece?.longitude)!)
        let regionRadius: CLLocationDistance = 500
        
        centerMapOnLocation(location: cambridgeCoordinates, radius: regionRadius)
        mapView.addAnnotation(artPiece!)
        mapView.delegate = self
        
        setViews()
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
    
    func setViews() {
        
        self.title = "\(artPiece?.title ?? "error: title nil") - \(artPiece?.year ?? "error: year nil")"
        let labelTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        labelTitle.text = self.title
        labelTitle.textColor = UIColor.black
        labelTitle.font = UIFont(name: "Helvetica-Bold", size: 18)
        labelTitle.backgroundColor = UIColor.clear
        labelTitle.adjustsFontSizeToFitWidth = true
        self.navigationItem.titleView = labelTitle
        self.navigationController?.navigationBar.backItem?.title = Defaults.getLocalizedString(key: "back")
        
        //button
        buttonNavigate.layer.borderWidth = 1
        buttonNavigate.layer.cornerRadius = 4
        buttonNavigate.layer.borderColor = UIColor.black.cgColor
        buttonNavigate.setTitle(Defaults.getLocalizedString(key: "navigate"), for: .normal)
        
        labelLocationName.text = "\(Defaults.getLocalizedString(key: "location")): \(artPiece?.locationName ?? Defaults.getLocalizedString(key: "noInformation"))"
        labelLocationDescription.text = "\(Defaults.getLocalizedString(key: "locationDescription")):\n \(artPiece?.locationDescription ?? Defaults.getLocalizedString(key: "noInformation"))"
        labelAddress.text = "\(Defaults.getLocalizedString(key: "address")):\n \(artPiece?.address ?? Defaults.getLocalizedString(key: "noInformation"))"
        /*
        labelDescription.text = "\(Defaults.getLocalizedString(key: "descriptionOfTheArtPiece"))"
        labelDescriptionText.text = "\(artPiece?.description ?? Defaults.getLocalizedString(key: "noInformation"))"
        */
        if(artPiece?.isInterior)! {
            labelInteriorExterior.text = "\(Defaults.getLocalizedString(key: "locatedIndoors"))"
        }
        else {
           labelInteriorExterior.text = "\(Defaults.getLocalizedString(key: "locatedOutdoors"))"
        }
        if(Defaults.languageSelectedCode == "ar" || Defaults.languageSelectedCode == "he"){
            self.labelInteriorExterior.textAlignment = .right
        }
        
        labelCategory.text = "\(Defaults.getLocalizedString(key: "category")):\n\(Defaults.getLocalizedString(key: "\(artPiece?.category.rawValue ?? Defaults.getLocalizedString(key: "noInformation"))"))"
        labelObjectType.text = "\(Defaults.getLocalizedString(key: "objectType")):\n\(artPiece?.objectType ?? Defaults.getLocalizedString(key: "noInformation"))"
        labelMaterial.text = "\(Defaults.getLocalizedString(key: "material")):\n\(artPiece?.material ?? Defaults.getLocalizedString(key: "noInformation"))"
        
        // handle multiple artists
        let firstName = artPiece?.firstName
        let lastName = artPiece?.lastName
        
        if (firstName?.range(of:"/") != nil && lastName?.range(of:"/") != nil) {
            let firstNameArray : [String] = firstName!.components(separatedBy: "/")
            let lastNameArray : [String] = lastName!.components(separatedBy: "/")
            
            labelArtistName.text = "\(Defaults.getLocalizedString(key: "byArtists")): \(firstNameArray[0] ) \(lastNameArray[0] ) & \(firstNameArray[1] ) \(lastNameArray[1])"
        }
        else{
            labelArtistName.text = "\(Defaults.getLocalizedString(key: "byArtist")): \(firstName ?? Defaults.getLocalizedString(key: "noInformation")) \(lastName ?? Defaults.getLocalizedString(key: "noInformation"))"
        }
        
        buttonShowMore.layer.borderWidth = 0.5
        buttonShowMore.layer.cornerRadius = 4
        buttonShowMore.layer.borderColor = UIColor.black.cgColor
        buttonShowMore.setTitle(Defaults.getLocalizedString(key: "showMore"), for: .normal)
        
        
    }
    
    @IBAction func buttonNavigatePressed(_ sender: UIButton) {
        let coordinate = CLLocationCoordinate2DMake(artPiece!.latitude, artPiece!.longitude)
        let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: coordinate, addressDictionary:nil))
        mapItem.name = artPiece!.locationName
        
        mapItem.openInMaps(launchOptions: [MKLaunchOptionsDirectionsModeKey:MKLaunchOptionsDirectionsModeDriving])
    }
    
    @IBAction func buttonShowMorePressed(_ sender: UIButton) {
        print("pressed")
        showMoreInfo()
    }
    func showMoreInfo() {
        if(!showMoreIsPressed) {     //show less pressed
            buttonShowMore.setTitle(Defaults.getLocalizedString(key: "showMore"), for: .normal)

        }
        else {              //show more pressed
            buttonShowMore.setTitle(Defaults.getLocalizedString(key: "showLess"), for: .normal)
        }
        showMoreIsPressed = !showMoreIsPressed
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
