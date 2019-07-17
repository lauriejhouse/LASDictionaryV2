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


class FavoriteDetailViewController: UIViewController {
    
    @IBOutlet weak var favoriteSignDetailLabel: UILabel!
    
    @IBOutlet weak var favoriteVideoView: VideoView!
    
    //Not sure which type of array..thing I need, or what one does what still. So will use both until I figure out what one does what.
    //https://guides.codepath.com/ios/Using-UITableView - uses the non commented out one.
    //    var signsArray = [Signs]()
    var signs: Signs?
    
    //trying to accesss favorite signs.
    var favoriteSigns = UserDefaults.standard.savedSigns()
    
    
    //****** NAMES OF VIDEO AND JSON/FIREBASE/SIGN NAME HAVE TO BE THE SAME OR IT CRASHES.*****
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //not working in ipad view. crashes. Probably because not every sign has a video yet?
        //videoName is coming up as nil for iPad and iPhone view, but iPhone view is working correctly.
        //videoName comes up nil when you first enter name in search bar, then click on it and then it is no longer nil.
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
        
        
        print("REF",httpsReference)
        
        //Label isn't displaying properly. Maybe i need to put the saved signs in an array?
        //safe unwrapping
        if let label = favoriteSignDetailLabel
        {
            label.text = signs?.signName
        }
        
    }
    
    //    }
    
  
    
    
   
    
    
}
