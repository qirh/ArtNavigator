//
//  TabViewController.swift
//  CambridgeArt
//
//  Created by saleh on 28/10/2017.
//  Copyright © 2017 saleh. All rights reserved.
//

// source:
// https://makeapppie.com/2015/02/04/swift-swift-tutorials-passing-data-in-tab-bar-controllers/

class TabViewController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
       
        super.viewDidLoad()
        delegate = self
        
        Defaults.setDefaultsVaribles()
        ArtPieces.setUpArtPieces()
        self.tabBar.items![0].image = UIImage(named: "map")
        self.tabBar.items![0].title = Defaults.getLocalizedString(key: "map")
        self.tabBar.items![1].image = UIImage(named: "list")
        self.tabBar.items![1].title = Defaults.getLocalizedString(key: "list")
        self.tabBar.items![2].image = UIImage(named: "settings")
        self.tabBar.items![2].title = Defaults.getLocalizedString(key: "settings")
        self.tabBar.items![3].image = UIImage(named: "about")
        self.tabBar.items![3].title = Defaults.getLocalizedString(key: "about")
        
        self.selectedIndex = Defaults.tabSelectedValue
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        Defaults.tabSelectedValue = tabBarController.selectedIndex
        Defaults.set(key: "tabSelectedValue", value: Defaults.tabSelectedValue)
    }
}
