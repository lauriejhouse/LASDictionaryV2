//
//  MainTabViewController.swift
//  LASDictionaryV2
//
//  Created by Jackie on 7/17/19.
//  Copyright © 2019 LAS. All rights reserved.
//

import UIKit


class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UINavigationBar.appearance().prefersLargeTitles = true
        tabBar.tintColor = .purple //change this to the blue RGB colors. xx/255
        
        setupViewControllers()
        
    }
    
    
    func setupViewControllers() {
        viewControllers = [
            generateNavigationController(for: MainTableViewController(), title: "Search", image: #imageLiteral(resourceName: "ic_hide_keyboard_24@2x.png")),
            generateNavigationController(for: FavoritesTableViewController(), title: "Favorites", image: #imageLiteral(resourceName: "favorite"))
        ]
    }
    
    //MARK:- Helper Functions
    
    fileprivate func generateNavigationController(for rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        //        navController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationItem.title = title
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        return navController
    }
    
}
