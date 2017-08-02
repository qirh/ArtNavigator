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
    
    // These strings will be the data for the table view cells
    let animals: [String] = ["Horse", "Cow", "Camel", "Sheep", "Goat"]
    
    // These are the colors of the square views in our table view cells.
    // In a real proCustomCellTableject you might use UIImages.
    let colors = [UIColor.blue, UIColor.yellow, UIColor.magenta, UIColor.red, UIColor.brown]
    
    // Don't forget to enter this in IB also
    let cellReuseIdentifier = "cell"
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.animals.count
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: CustomCellTable = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as! CustomCellTable
        
        cell.buttonNavigate.layer.borderWidth = 2
        cell.buttonNavigate.layer.cornerRadius = 4
        cell.buttonNavigate.layer.borderColor = UIColor.black.cgColor
        cell.buttonNavigate.setTitle(Defaults.getLocalizedString(key: "navigate"), for: .normal)
        
        cell.labelTitle.adjustsFontSizeToFitWidth = true
        cell.labelTitle.text = self.animals[indexPath.row]
        
        return cell
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
    }
    
    
}
