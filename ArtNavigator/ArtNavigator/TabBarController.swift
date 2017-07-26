//
//  TabBarController.swift
//  ArtNavigator
//
//  Created by saleh on 7/25/17.
//  Copyright © 2017 saleh. All rights reserved.
//

import UIKit


// source:
// https://stackoverflow.com/questions/26850411/how-add-tabs-programmatically-in-uitabbarcontroller-with-swift

class TabBarController: UITabBarController, UITabBarControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let item1 = MapViewController()
        let tabBarItem1 = UITabBarItem(title: NSLocalizedString("map", comment: ""), image: UIImage(named: "map"), selectedImage: UIImage(named: "map"))
        item1.tabBarItem = tabBarItem1
        
        let item2 = ListViewController()
        let tabBarItem2 = UITabBarItem(title: NSLocalizedString("list", comment: ""), image: UIImage(named: "list"), selectedImage: UIImage(named: "list"))
        item2.tabBarItem = tabBarItem2

        let item3 = SettingsViewController()
        let tabBarItem3 = UITabBarItem(title: NSLocalizedString("settings", comment: ""), image: UIImage(named: "settings"), selectedImage: UIImage(named: "settings"))
        item3.tabBarItem = tabBarItem3
        
        let item4 = AboutViewController()
        let tabBarItem4 = UITabBarItem(title: NSLocalizedString("about", comment: ""), image: UIImage(named: "about"), selectedImage: UIImage(named: "about"))
        item4.tabBarItem = tabBarItem4
        
        self.viewControllers = [item1, item2, item3, item4]
    }
    
    //Delegate methods
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        print("Should select viewController: \(viewController.title ?? "sin titulo")")
        
        return true
    }
}
