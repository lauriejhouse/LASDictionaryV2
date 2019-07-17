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


class DetailViewController: UIViewController, UITabBarControllerDelegate {
    
    @IBOutlet weak var signDetailNameLabel: UILabel!
    
    @IBOutlet weak var videoView: VideoView!
    
    //Not sure which type of array..thing I need, or what one does what still. So will use both until I figure out what one does what.
    //https://guides.codepath.com/ios/Using-UITableView - uses the non commented out one.
//    var signsArray = [Signs]()
    var signs: Signs?
    

   
    
    //****** NAMES OF VIDEO AND JSON/FIREBASE/SIGN NAME HAVE TO BE THE SAME OR IT CRASHES.*****
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBarButtons()

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

   
    
//    fileprivate func setupNavigationBarButtons() {
//        //check if we have laready saved the pdcast as favorite.
//
//        let savedSigns = UserDefaults.standard.savedSigns()
//        let hasFavorited = savedSigns.index(where: {$0.signName == self.signs?.signName}) == nil
//        if  hasFavorited {
//            //setting up heart icon.
//            navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "favorite"), style: .plain, target: nil, action: nil)
//        } else {
//            navigationItem.rightBarButtonItems = [
//                //UIBarButtonItem(title: "Favorite", style: .plain, target: self, action: #selector(handleSaveFavorite)),
//                UIBarButtonItem(title: "Favorite", style: .plain, target: self, action: #selector(handleSaveFavorite)),
//                UIBarButtonItem(title: "Fetch", style: .plain, target: self, action: #selector(handleFetchSavedSigns))
//
//            ]
//        }
//
//
//    }
    
    
    
    fileprivate func setupNavigationBarButtons() {
        //let's check if we have already saved this podcast as fav
        let savedPodcasts = UserDefaults.standard.savedSigns()
        let hasFavorited = savedPodcasts.index(where: { $0.signName == self.signs?.signName }) != nil
        if hasFavorited {
            // setting up our heart icon
            navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "favorite"), style: .plain, target: nil, action: nil)
        } else {
            navigationItem.rightBarButtonItems = [
                UIBarButtonItem(title: "Favorite", style: .plain, target: self, action: #selector(handleSaveFavorite)),
                UIBarButtonItem(title: "Fetch", style: .plain, target: self, action: #selector(handleFetchSavedSigns))
            ]
        }
        
    }
    

    
    
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
        
       
        
        // 1. Transform Podcast into Data
        var listOfFavoriteSigns = UserDefaults.standard.savedSigns()
        listOfFavoriteSigns.append(sign)
        let data = NSKeyedArchiver.archivedData(withRootObject: listOfFavoriteSigns)
        
        UserDefaults.standard.set(data, forKey: UserDefaults.favoritedSignsKey)
        //put tab bar code here.
        showBadgeHighlight()
    }
   
    
     func showBadgeHighlight() {
        if let tabItems = tabBarController?.tabBar.items {
            //tabItems[1] = the favorites tab. Even though it is the second tab, counting in swift starts with 0. The first tab is 0, second tab is 1.
            let tabItem = tabItems[1]
            //currently every time I run the simulation it shows up with 'new' even if theres nothing new added and doesn't pop up when there's a new favorite added. 7/17/19 - I WAS PUTTING IT IN THE WRONG PLACE!!! IT WAS SUPPOSED TO GO HERE HERE. THIS IS MY LBTA EPISODE CONTROLLER!!! - But now it's not showing up when I add the favorite.
            tabItem.badgeValue = "New"
        }
    }
    
    
}
