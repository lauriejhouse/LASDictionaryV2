//
//  DetailViewController.swift
//  LASDictionaryV2
//
//  Created by Jackie on 2/28/19.
//  Copyright © 2019 LAS. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit
import Firebase


class DetailViewController: UIViewController {
    
    @IBOutlet weak var signDetailNameLabel: UILabel!
    
    @IBOutlet weak var videoView: VideoView!
    
    
    //Not sure which type of array..thing I need, or what one does what still. So will use both until I figure out what one does what.
    //https://guides.codepath.com/ios/Using-UITableView - uses the non commented out one.
//    var signsArray = [Signs]()
    var signs: Signs!
    
    
//    var signs: Signs? {
//        didSet {
//            navigationItem.title = signs?.signName
//
//        }
//    }
   
    
    //****** NAMES OF VIDEO AND JSON/FIREBASE/SIGN NAME HAVE TO BE THE SAME OR IT CRASHES.*****
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBarButtons()

        //not working in ipad view. crashes. Probably because not every sign has a video yet?
        //videoName is coming up as nil for iPad and iPhone view, but iPhone view is working correctly.
        //videoName comes up nil when you first enter name in search bar, then click on it and then it is no longer nil.
        let videoName = signs?.signName.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        // 7/10/19 -  questions mark for signs.signName because i cahnged how the var signs: Signs work. instead of the simple var its var with did set.
        
        //may need to redo the references to get the iPad layout to work correctly. OR DON'T DO SPLIT VIEW. DO I NEED SPLIT VIEW? i feel like if i don't have a split view this problem will be solved? Or is it a
        
        let httpsReference = Storage.storage().reference(forURL: "https://firebasestorage.googleapis.com/v0/b/lasdictionaryv2.appspot.com/o/\(videoName!).mov")

        //may need to get rid of force unwrap. because thats not safe.
        
        httpsReference.downloadURL() { url, error in
            print("URL",url as Any)
            print("ERROR", error as Any)
            if let url = url, error == nil {
                self.videoView.configureForUrl(url)
                self.videoView.isLoop = true
                self.videoView.play()
            }
        }

        
        print("REF",httpsReference)

        //safe unwrapping
        if let label = signDetailNameLabel
        {
            label.text = signs?.signName
        }
   
        
    }

    
    
    fileprivate func setupNavigationBarButtons() {
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(title: "Favorite", style: .plain, target: self, action: #selector(handleSaveFavorite)),
            UIBarButtonItem(title: "Fetch", style: .plain, target: self, action: #selector(handleFetchSavedSigns))

        ]
    }
    
    
    
    //its only fetching the same sign. Abraham Abulafia - 7/9/19 - it was fetching the same sign because you have to save it first, then fetch it!!
    @objc fileprivate func handleFetchSavedSigns() {
        print("Fetching saved Signs from UserDefaults")
       let value = UserDefaults.standard.value(forKey: favoritedSignsKey) as? String
        print(value ?? "Blank")
    }
    
    let favoritedSignsKey = "favoritedSignsKey"

    
     @objc fileprivate func handleSaveFavorite() {
        print("Saving info into UserDefaults")

        guard let sign = self.signs else {return}
        
        //1. Transform Podcast (Class)LBTA, my Signs class, into Data

        
        do {
            let data =  try NSKeyedArchiver.archivedData(withRootObject: sign, requiringSecureCoding: false)
            UserDefaults.standard.set(data, forKey: favoritedSignsKey)
            UserDefaults.standard.synchronize()
        } catch {
            //error handling
        }
        
        
        
//
//        let data = try NSKeyedArchiver.archivedData(withRootObject: sign, requiringSecureCoding: false)
//
//        UserDefaults.standard.set(data, forKey: favoritedSignsKey)
//
      

        //need to save the sign name and video
//        UserDefaults.standard.set(sign.signName, forKey: favoritedSignsKey)

    }
    
}
