//
//  FavoriteDetailViewController.swift
//  LASDictionaryV2
//
//  Created by Jackie Norstrom on 7/24/19.
//  Copyright © 2019 LAS. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit
import Firebase


class FavoriteDetailViewController: UIViewController {
    
    @IBOutlet weak var favoriteLabel: UILabel!
    @IBOutlet weak var favoriteVideoView: FavoriteVideoView!
    
    let savedSigns = UserDefaults.standard.savedSigns()
    var savedFavorites: Signs?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//    if let label = favoriteLabel
//        {
//            let savedSignsData = UserDefaults.standard.data(forKey: UserDefaults.favoritedSignsKey)
//            favoriteLabel.text = savedSigns.stringForKey("favoritedSignsKey")
//    }
        
        
        
    }
    
    
//     func viewDidApeear(animated: Bool) {
//        let username = UserDefaults.standard.savedSigns()
//        if(username != nil) {
//            self.favoriteLabel.text = username;
//        }
//    }
    
    
    
    
}
