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
    @IBOutlet weak var buttonArtPiece: UIButton!
    
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
    
    @IBOutlet weak var viewContent: UIView!
    
    var showMoreIsPressed = true
    var artPiece: ArtPiece? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cambridgeCoordinates = CLLocation(latitude: (artPiece?.latitude)!, longitude: (artPiece?.longitude)!)
        
        buttonArtPiece.setTitle(Defaults.getLocalizedString(key: "artPiece"), for: .normal)
        //buttonArtPiece.layer.shadowRadius =  3.0
        //buttonArtPiece.layer.shadowColor =  UIColor.black.cgColor
        //buttonArtPiece.layer.shadowOpacity =  0.3
        buttonArtPiece.layer.borderColor = UIColor.black.withAlphaComponent(1).cgColor
        buttonArtPiece.layer.borderWidth = 3
        viewContent.addSubview(buttonArtPiece)
        mapView.addSubview(buttonArtPiece)
        
        centerMapOnLocation(location: cambridgeCoordinates)
        mapView.addAnnotation(artPiece!)
        mapView.delegate = self
        
        setViews()
    }
    func centerMapOnLocation(location: CLLocation, radius: CLLocationDistance = 500) {
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
        
        
        var boldedString = NSMutableAttributedString()
        labelLocationName.attributedText = boldedString.bold("\(Defaults.getLocalizedString(key: "location")): ").normal(artPiece?.locationName ?? Defaults.getLocalizedString(key: "noInformation"))
        
        boldedString = NSMutableAttributedString()
        labelLocationDescription.attributedText = boldedString.bold("\(Defaults.getLocalizedString(key: "locationDescription")):\n").normal("\(artPiece?.locationDescription ?? Defaults.getLocalizedString(key: "noInformation"))")
        
        boldedString = NSMutableAttributedString()
        labelAddress.attributedText = boldedString.bold("\(Defaults.getLocalizedString(key: "address")):\n ").normal("\(artPiece?.address ?? Defaults.getLocalizedString(key: "noInformation"))")
       
        boldedString = NSMutableAttributedString()
        if(artPiece?.isInterior)! {
            labelInteriorExterior.attributedText = boldedString.bold("\(Defaults.getLocalizedString(key: "locatedIndoors"))")
        }
        else {
           labelInteriorExterior.attributedText = boldedString.bold("\(Defaults.getLocalizedString(key: "locatedOutdoors"))")
        }
        if(Defaults.languageSelectedCode == "ar" || Defaults.languageSelectedCode == "he"){
            self.labelInteriorExterior.textAlignment = .right
        }
        
        boldedString = NSMutableAttributedString()
        labelCategory.attributedText = boldedString.bold("\(Defaults.getLocalizedString(key: "category")):\n").normal("\(Defaults.getLocalizedString(key: "\(artPiece?.category.rawValue ?? Defaults.getLocalizedString(key: "noInformation"))"))")
        
        boldedString = NSMutableAttributedString()
        labelObjectType.attributedText = boldedString.bold("\(Defaults.getLocalizedString(key: "objectType")):\n").normal("\(Defaults.getLocalizedString(key: "\(artPiece?.objectType ?? Defaults.getLocalizedString(key: "noInformation"))"))")
        
        boldedString = NSMutableAttributedString()
        labelMaterial.attributedText = boldedString.bold("\(Defaults.getLocalizedString(key: "material")):\n").normal("\(Defaults.getLocalizedString(key: "\(artPiece?.material ?? Defaults.getLocalizedString(key: "noInformation"))"))")
        
        // handle multiple artists
        let firstName = artPiece?.firstName
        let lastName = artPiece?.lastName
        boldedString = NSMutableAttributedString()
        if (firstName?.range(of:"/") != nil && lastName?.range(of:"/") != nil) {
            let firstNameArray : [String] = firstName!.components(separatedBy: "/")
            let lastNameArray : [String] = lastName!.components(separatedBy: "/")
            
            labelArtistName.attributedText = boldedString.bold("\(Defaults.getLocalizedString(key: "byArtists")): ").normal("\(firstNameArray[0] ) \(lastNameArray[0] ) & \(firstNameArray[1] ) \(lastNameArray[1])")
        }
        else{
            labelArtistName.attributedText = boldedString.bold("\(Defaults.getLocalizedString(key: "byArtist")): ").normal("\(firstName ?? Defaults.getLocalizedString(key: "noInformation")) \(lastName ?? Defaults.getLocalizedString(key: "noInformation"))")
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
    @IBAction func buttonArtPiecePressed(_ sender: UIButton) {
        print("pressed")
        centerMapOnLocation(location: CLLocation(latitude: (artPiece?.latitude)!, longitude: (artPiece?.longitude)!))
    }
    @IBAction func buttonShowMorePressed(_ sender: UIButton) {
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
}
