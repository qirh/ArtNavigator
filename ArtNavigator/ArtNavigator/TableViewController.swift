//
//  TableViewController.swift
//  ArtNavigator
//
//  Created by saleh on 7/18/17.
//  Copyright © 2017 saleh. All rights reserved.
//

import UIKit
import MapKit

// source:
// https://stackoverflow.com/a/36426858/1274947

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let segueTable = "segueTable"
    let cellReuseIdentifier = "cellCustom"
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        sortTable()
    }
    func sortTable() {
        ArtPieces.artPieces.sort() { $0.title! < $1.title! }
        //fruitList.reloadData(); // notify the table view the data has changed
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ArtPieces.artPieces.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: CustomCellTable = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as! CustomCellTable
        
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.gray.cgColor
        
        cell.labelTitle.text = ArtPieces.artPieces[indexPath.row].title
        cell.labelTitle.adjustsFontSizeToFitWidth = true
        
        cell.labelCategory.text = "\(Defaults.getLocalizedString(key: "\(ArtPieces.artPieces[indexPath.row].category.rawValue)"))"
        cell.labelCategory.adjustsFontSizeToFitWidth = true
        
        
        // handle multiple artists
        let firstName = ArtPieces.artPieces[indexPath.row].firstName
        let lastName = ArtPieces.artPieces[indexPath.row].lastName
        
        if (firstName?.range(of:"/") != nil && lastName?.range(of:"/") != nil) {
            let firstNameArray : [String] = firstName!.components(separatedBy: "/")
            let lastNameArray : [String] = lastName!.components(separatedBy: "/")
            
            cell.labelArtist.text = "\(Defaults.getLocalizedString(key: "byArtists")): \(firstNameArray[0] ) \(lastNameArray[0] ) & \(firstNameArray[1] ) \(lastNameArray[1])"
        }
        else{
            cell.labelArtist.text = "\(Defaults.getLocalizedString(key: "byArtist")): \(firstName ?? Defaults.getLocalizedString(key: "noInformation")) \(lastName ?? Defaults.getLocalizedString(key: "noInformation"))"
        }
        cell.labelArtist.adjustsFontSizeToFitWidth = true
        
        cell.buttonNavigate.layer.borderWidth = 0.5
        cell.buttonNavigate.layer.cornerRadius = 4
        cell.buttonNavigate.layer.borderColor = UIColor.gray.cgColor
        cell.buttonNavigate.setTitle(Defaults.getLocalizedString(key: "navigate"), for: .normal)
        cell.buttonNavigate.tag = indexPath.row
        cell.buttonNavigate.addTarget(self, action: #selector(TableViewController.buttonNavigatePressed(_:)), for: .touchUpInside)
        
        cell.selectionStyle = .blue
        
        return cell
    }
    func buttonNavigatePressed(_ sender: UIButton) {
        
        let coordinate = CLLocationCoordinate2DMake(ArtPieces.artPieces[sender.tag].latitude, ArtPieces.artPieces[sender.tag].longitude)
        let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: coordinate, addressDictionary:nil))
        mapItem.name = ArtPieces.artPieces[sender.tag].locationName
        
        mapItem.openInMaps(launchOptions: [MKLaunchOptionsDirectionsModeKey:MKLaunchOptionsDirectionsModeDriving])
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == segueTable) {
            let detailViewController = segue.destination as! DetailViewController
            detailViewController.artPiece = ArtPieces.artPieces[(tableView.indexPathForSelectedRow?.row)!]
        }
        self.tabBarController?.tabBar.isHidden = true
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.performSegue(withIdentifier: segueTable, sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
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
