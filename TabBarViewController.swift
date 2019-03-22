//
//  TabBarViewController.swift
//  LASDictionaryV2
//
//  Created by Jackie on 3/20/19.
//  Copyright © 2019 LAS. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }
}

extension CustomTabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        guard let index = viewControllers?.index(of: viewController) else {
            // not sure if there is a case when this wouldn't exist, so just for safety, we'll return false
            return false
        }
        
        if index == 1 {
            let alert = UIAlertController(title: "Nope!", message: "You can't select this tab... sorry!", preferredStyle: .alert)
            let okayAction = UIAlertAction(title: "Okay :(", style: .default, handler: nil)
            alert.addAction(okayAction)
            present(alert, animated: true, completion: nil)
            return false
        }
        return true
    }
}
