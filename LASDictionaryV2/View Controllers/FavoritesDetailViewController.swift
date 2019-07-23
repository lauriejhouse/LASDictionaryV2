//
//  FavoritesDetailViewController.swift
//  LASDictionaryV2
//
//  Created by Jackie on 7/16/19.
//  Copyright © 2019 LAS. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit
import Firebase


class FavoriteDetailViewController: UIViewController, UITabBarDelegate {
    
    @IBOutlet weak var favoriteSignDetailLabel: UILabel!
    
    @IBOutlet weak var favoriteVideoView: FavoriteVideoView!
    
    
    //may need to use the userdefaults to get the saved signs
    var signs: Signs?
    
    //trying to accesss favorite signs.
    var favoriteSigns = UserDefaults.standard.savedSigns()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let videoName = signs?.signName.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {return}
        
        
        let httpsReference = Storage.storage().reference(forURL: "https://firebasestorage.googleapis.com/v0/b/lasdictionaryv2.appspot.com/o/\(videoName).mov")
        
        
        httpsReference.downloadURL() { url, error in
            print("URL",url as Any)
            print("ERROR", error as Any)
            if let url = url, error == nil {
                self.favoriteVideoView.configureForUrl(url)
                self.favoriteVideoView.isLoop = true
                self.favoriteVideoView.play()
            }
        }
        
        
        print("REF",httpsReference)
        
    
        if let label = favoriteSignDetailLabel
        {
            label.text = signs?.signName
        }
        
    }
    
  
    
  
    
    
   
    
    
}
