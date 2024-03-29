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
    @IBOutlet weak var slowFavorites: UIButton!
    
    
    
    
    
    var signs: Signs?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    if let label = favoriteLabel
        {
            label.text = signs?.signName
    }
        
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
        
        
    }
    
    var songSpeedPercentage: Int = 0

    
    @IBAction func slowDownTempo(_sender: Any) {
        
        favoriteVideoView.player?.rate -= 0.5
               songSpeedPercentage -= 5
               //speedPercentageLabel.text = "\(songSpeedPercentage)%"
               
               if favoriteVideoView.player?.rate == 0.25 || songSpeedPercentage == 25 {
                   slowFavorites.isEnabled = false
               }
               
               slowFavorites.isEnabled = true
           
    }
    
    
    
    
}
