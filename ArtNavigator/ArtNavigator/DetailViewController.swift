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
    
    
    @IBOutlet weak var viewContent: UIView!
    //viewMap
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var buttonArtPiece: UIButton!
    //viewGeneral
    @IBOutlet weak var viewGeneral: UIView!
    @IBOutlet weak var buttonNavigate: UIButton!
    @IBOutlet weak var labelGeneralInfo: UILabel!
    @IBOutlet weak var labelLocationName: UILabel!
    @IBOutlet weak var labelAddress: UILabel!
    @IBOutlet weak var labelInteriorExterior: UILabel!
    @IBOutlet weak var labelCategory: UILabel!
    @IBOutlet weak var labelObjectType: UILabel!
    //viewDetails
    @IBOutlet weak var viewDetails: UIView!
    @IBOutlet weak var labelDetailedInfo: UILabel!
    @IBOutlet weak var labelAccNumber: UILabel!
    @IBOutlet weak var labelLocationDescription: UILabel!
    @IBOutlet weak var labelMaterial: UILabel!
    @IBOutlet weak var textViewMaterialDetails: UITextView!
    @IBOutlet weak var labelSize: UILabel!
    @IBOutlet weak var labelAddDesc: UITextView!
    @IBOutlet weak var labelAboutTheWork: UITextView!

    var artPiece: ArtPiece? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cambridgeCoordinates = CLLocation(latitude: (artPiece?.latitude)!, longitude: (artPiece?.longitude)!)
        
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
        
        buttonArtPiece.setTitle(Defaults.getLocalizedString(key: "artPiece"), for: .normal)
        buttonArtPiece.layer.shadowRadius =  2.0
        buttonArtPiece.layer.shadowColor =  UIColor.black.cgColor
        buttonArtPiece.layer.shadowOpacity =  0.3
        buttonArtPiece.layer.borderColor = UIColor.black.withAlphaComponent(0.5).cgColor
        buttonArtPiece.layer.borderWidth = 0.8
        
        //**viewGeneral**//
        buttonNavigate.layer.borderWidth = 1
        buttonNavigate.layer.cornerRadius = 4
        buttonNavigate.layer.borderColor = UIColor.black.cgColor
        buttonNavigate.setTitle(Defaults.getLocalizedString(key: "navigate"), for: .normal)
        labelGeneralInfo.text = Defaults.getLocalizedString(key: "generalInformation")
        
        var boldedString = NSMutableAttributedString()
        labelLocationName.attributedText = boldedString.bold("\(Defaults.getLocalizedString(key: "location")): ").normal(artPiece?.locationName ?? Defaults.getLocalizedString(key: "noInformation"))
//        labelLocationName.layer.borderWidth = 0.5
//        labelLocationName.layer.cornerRadius = 3
        
        boldedString = NSMutableAttributedString()
        labelAddress.attributedText = boldedString.bold("\(Defaults.getLocalizedString(key: "address")):\n ").normal("\(artPiece?.address ?? Defaults.getLocalizedString(key: "noInformation"))")
//        labelAddress.layer.borderWidth = 0.5
//        labelAddress.layer.cornerRadius = 3
        
        boldedString = NSMutableAttributedString()
        labelCategory.attributedText = boldedString.bold("\(Defaults.getLocalizedString(key: "category")):\n").normal("\(Defaults.getLocalizedString(key: "\(artPiece?.category.rawValue ?? Defaults.getLocalizedString(key: "noInformation"))"))")
//        labelCategory.layer.borderWidth = 0.5
//        labelCategory.layer.cornerRadius = 3
        
        boldedString = NSMutableAttributedString()
        labelObjectType.attributedText = boldedString.bold("\(Defaults.getLocalizedString(key: "objectType")):\n").normal("\(Defaults.getLocalizedString(key: "\(artPiece?.objectType ?? Defaults.getLocalizedString(key: "noInformation"))"))")
//        labelObjectType.layer.borderWidth = 0.5
//        labelObjectType.layer.cornerRadius = 3
        
        boldedString = NSMutableAttributedString()
        if(artPiece?.isInterior)! {
            labelInteriorExterior.attributedText = boldedString.bold("\(Defaults.getLocalizedString(key: "locatedIndoors"))")
        }
        else {
            labelInteriorExterior.attributedText = boldedString.bold("\(Defaults.getLocalizedString(key: "locatedOutdoors"))")
        }
        
        
        //**viewDetailed**//
        labelDetailedInfo.text = Defaults.getLocalizedString(key: "detailedInformation")
        boldedString = NSMutableAttributedString()
        labelAccNumber.attributedText = boldedString.bold("\(Defaults.getLocalizedString(key: "accessionNumber")): ").normal("\(artPiece?.accessionNumber ?? Defaults.getLocalizedString(key: "noInformation"))")
//        labelAccNumber.layer.borderWidth = 0.5
//        labelAccNumber.layer.cornerRadius = 3
        
        boldedString = NSMutableAttributedString()
        labelLocationDescription.attributedText = boldedString.bold("\(Defaults.getLocalizedString(key: "locationDescription")):\n").normal("\(artPiece?.locationDescription ?? Defaults.getLocalizedString(key: "noInformation"))")
//        labelLocationDescription.layer.borderWidth = 0.5
//        labelLocationDescription.layer.cornerRadius = 3
        
        boldedString = NSMutableAttributedString()
        labelMaterial.attributedText = boldedString.bold("\(Defaults.getLocalizedString(key: "material")): ").normal("\(Defaults.getLocalizedString(key: "\(artPiece?.material ?? Defaults.getLocalizedString(key: "noInformation"))"))")
//        labelMaterial.layer.borderWidth = 0.5
//        labelMaterial.layer.cornerRadius = 3
        
        boldedString = NSMutableAttributedString()
        textViewMaterialDetails.attributedText = boldedString.bold("\(Defaults.getLocalizedString(key: "materialDetails")):\n ").normal("\(Defaults.getLocalizedString(key: "\(artPiece?.materialDetails ?? Defaults.getLocalizedString(key: "noInformation"))"))")
//        textViewMaterialDetails.layer.borderWidth = 0.5
//        textViewMaterialDetails.layer.cornerRadius = 3
        
        boldedString = NSMutableAttributedString()
        labelSize.attributedText = boldedString.bold("\(Defaults.getLocalizedString(key: "size")): ").normal("\(Defaults.getLocalizedString(key: "\(artPiece?.size ?? Defaults.getLocalizedString(key: "noInformation"))"))")
//        labelSize.layer.borderWidth = 0.5
//        labelSize.layer.cornerRadius = 3
        
        boldedString = NSMutableAttributedString()
        labelAddDesc.attributedText = boldedString.bold("\(Defaults.getLocalizedString(key: "additionalDescription")):\n ").normal("\(Defaults.getLocalizedString(key: "\(artPiece?.additionalDescription ?? Defaults.getLocalizedString(key: "noInformation"))"))")
//        labelAddDesc.layer.borderWidth = 0.5
//        labelAddDesc.layer.cornerRadius = 3
        
        boldedString = NSMutableAttributedString()
        labelAboutTheWork.attributedText = boldedString.bold("\(Defaults.getLocalizedString(key: "aboutTheWork")):\n ").normal("\(Defaults.getLocalizedString(key: "\(artPiece?.materialDetails ?? Defaults.getLocalizedString(key: "noInformation"))"))")
//        labelAboutTheWork.layer.borderWidth = 0.5
//        labelAboutTheWork.layer.cornerRadius = 3
        
        if(Defaults.languageSelectedCode == "ar" || Defaults.languageSelectedCode == "he"){
            self.labelDetailedInfo.textAlignment = .right
            self.labelGeneralInfo.textAlignment = .right
            self.labelSize.textAlignment = .right
            self.labelInteriorExterior.textAlignment = .right
        }
    }
    
    @IBAction func buttonNavigatePressed(_ sender: UIButton) {
        let coordinate = CLLocationCoordinate2DMake(artPiece!.latitude, artPiece!.longitude)
        let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: coordinate, addressDictionary:nil))
        mapItem.name = artPiece!.locationName
        
        mapItem.openInMaps(launchOptions: [MKLaunchOptionsDirectionsModeKey:MKLaunchOptionsDirectionsModeDriving])
    }
    @IBAction func buttonArtPiecePressed(_ sender: UIButton) {
        centerMapOnLocation(location: CLLocation(latitude: (artPiece?.latitude)!, longitude: (artPiece?.longitude)!))
    }
}
