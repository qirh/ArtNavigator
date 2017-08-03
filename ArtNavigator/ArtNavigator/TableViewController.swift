//
//  TableViewController.swift
//  ArtNavigator
//
//  Created by saleh on 7/18/17.
//  Copyright © 2017 saleh. All rights reserved.
//

import UIKit

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
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ArtPieces.artPieces.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: CustomCellTable = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as! CustomCellTable
        
        cell.layer.borderWidth = 0.5
        cell.layer.borderColor = UIColor.gray.cgColor
        
        cell.labelTitle.text = ArtPieces.artPieces[indexPath.row].title
        cell.labelTitle.adjustsFontSizeToFitWidth = true
        
        cell.labelCategory.text = "\(Defaults.getLocalizedString(key: "\(ArtPieces.artPieces[indexPath.row].category.rawValue)"))"
        cell.labelCategory.adjustsFontSizeToFitWidth = true
        
        cell.labelArtist.text = "\(Defaults.getLocalizedString(key: "byArtist")): \(ArtPieces.artPieces[indexPath.row].firstName ?? Defaults.getLocalizedString(key: "noInformation")) \(ArtPieces.artPieces[indexPath.row].lastName ?? Defaults.getLocalizedString(key: "noInformation"))"
        cell.labelArtist.adjustsFontSizeToFitWidth = true
        
        cell.buttonNavigate.layer.borderWidth = 0.5
        cell.buttonNavigate.layer.cornerRadius = 4
        cell.buttonNavigate.layer.borderColor = UIColor.gray.cgColor
        cell.buttonNavigate.setTitle(Defaults.getLocalizedString(key: "navigate"), for: .normal)
        
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == segueTable) {
            let detailViewController = segue.destination as! DetailViewController
            detailViewController.artPiece = ArtPieces.artPieces[(tableView.indexPathForSelectedRow?.row)!]
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: segueTable, sender: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        super.viewWillAppear(animated)
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        super.viewWillDisappear(animated)
    }
    
    
}
