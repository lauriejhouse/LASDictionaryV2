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
//    @objc fileprivate func handleFetchSavedSigns() {
//        print("Fetching saved Signs from UserDefaults")
////       let value = UserDefaults.standard.value(forKey: favoritedSignsKey) as? String
////        print(value ?? "Blank")
//
//        //retrieve signs from saved userdefaults
////        guard let data = UserDefaults.standard.data(forKey: favoritedSignsKey) else {return}
//
//        //not sure if this forKey has to be favoriteSignsKey, might have to be sign name key from signs file.
//        //tutorial/stackoverflow  way of doing the unarchiving: https://stackoverflow.com/questions/53436673/saving-firebase-snapshot-array-to-nsuserdefaults
//        do {
//            if UserDefaults.standard.object(forKey: favoritedSignsKey) != nil{
//                let decodedData = UserDefaults.standard.object(forKey: favorited) as! Data
//                if let decodedSigns = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(decodedData) as? Signs {
//                    print(decodedSigns.signName)
//
//                }
//            }
//        }
//        catch {
//            //Handle Error
//        }
//
//
//
//    }
    
    
    //from LBTA
    @objc fileprivate func handleFetchSavedSigns() {
        print("Fetching saved Podcasts from UserDefaults")
        // how to retrieve our Podcast object from UserDefaults
        
        guard let data = UserDefaults.standard.data(forKey: UserDefaults.favoritedSignsKey) else { return }
        
        let savedPodcasts = NSKeyedUnarchiver.unarchiveObject(with: data) as? [Signs]
        
        savedPodcasts?.forEach({ (p) in
            print(p.signName)
        })
        
    }
    
    
    
    //this has been moved to UserDefaults extension
    //let favoritedSignsKey = "favoritedSignsKey"

    
//     @objc fileprivate func handleSaveFavorite() {
//        print("Saving info into UserDefaults")
//
//        guard let sign = self.signs else {return}
//
//        //1. Transform Podcast (Class)LBTA, my Signs class, into Data
//
//        //this was to save a whole array of podcasts - LBTA Fresh Air, click on save and it saved 'all' the episodes. But I just need to save one sign at a time. So i may not have to have the list of signs. Next step at time stamp 5:12 is to save them all in a table/not over write the saved favorite.
//
////        var listOfSigns = [Signs]()
////        listOfSigns.append(sign)
//
//
//
//        do {
//            let data =  try NSKeyedArchiver.archivedData(withRootObject: sign, requiringSecureCoding: false)
//            UserDefaults.standard.set(data, forKey: UserDefaults.favoritedSignsKey)
//            UserDefaults.standard.synchronize()
//        } catch {
//            //error handling
//        }
//
//        //fetch saved signs(podcasts) first.
////        guard let savedSignsData = UserDefaults.standard.data(forKey: favoritedSignsKey) else {return}
////        guard let savedSigns = NSKeyedUnarchiver.unarch
////        do {
////            if UserDefaults.standard.object(forKey: favoritedSignsKey) != nil{
////                let decodedData = UserDefaults.standard.object(forKey: favoritedSignsKey) as! Data
////                if let decodedSigns = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(decodedData) as? Signs {
////                    print(decodedSigns.signName)
////
////                }
////            }
////        }
////        catch {
////            //Handle Error
////        }
//
//
//
//
//
//    }
    
    
    //from LTBA
    @objc fileprivate func handleSaveFavorite() {
        print("Saving info into UserDefaults")
        
        guard let sign = self.signs else { return }
        
        // fetch our saved podcasts first
        //        guard let savedPodcastsData = UserDefaults.standard.data(forKey: favoritedPodcastKey) else { return }
        //        guard let savedPodcasts = NSKeyedUnarchiver.unarchiveObject(with: savedPodcastsData) as? [Podcast] else { return }
        
        // 1. Transform Podcast into Data
        var listOfPodcasts = UserDefaults.standard.savedSigns()
        listOfPodcasts.append(sign)
        let data = NSKeyedArchiver.archivedData(withRootObject: listOfPodcasts)
        
        UserDefaults.standard.set(data, forKey: UserDefaults.favoritedSignsKey)
    }
    
}
