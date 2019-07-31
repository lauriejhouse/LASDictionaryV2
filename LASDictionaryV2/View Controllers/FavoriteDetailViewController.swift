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
    var signs: Signs?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//    if let label = favoriteLabel
//        {
//            label.text = savedFavorites?.signName
//    }
                favoriteLabel.text = signs?.signName
        
        guard let videoName = signs?.signName.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {return}
        // 7/10/19 -  questions mark for signs.signName because i cahnged how the var signs: Signs work. instead of the simple var its var with did set.
        
        //may need to redo the references to get the iPad layout to work correctly. OR DON'T DO SPLIT VIEW. DO I NEED SPLIT VIEW? i feel like if i don't have a split view this problem will be solved? Or is it a
        
        let httpsReference = Storage.storage().reference(forURL: "https://firebasestorage.googleapis.com/v0/b/lasdictionaryv2.appspot.com/o/\(videoName).mov")
        
        //may need to get rid of force unwrap. because thats not safe.
        
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
    
    

    
    
    
    
}
