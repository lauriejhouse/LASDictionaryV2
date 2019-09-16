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

//https://stackoverflow.com/questions/51334443/how-to-set-mediaplayer-playback-rate-in-swift
/*
 https://stackoverflow.com/questions/34038368/how-to-perform-some-action-on-play-and-pause-actions-of-avplayer
 https://stackoverflow.com/questions/2483783/how-to-change-the-speed-of-video-playback
 https://stackoverflow.com/questions/51334443/how-to-set-mediaplayer-playback-rate-in-swift
 
 */
class DetailViewController: UIViewController, UITabBarDelegate {
    
    //fix label so it doesn't get cut off
    @IBOutlet weak var signDetailNameLabel: UILabel!
    //@IBOutlet weak var speedPercentageLabel: UILabel!
    
    @IBOutlet weak var videoView: VideoView!
    
    @IBOutlet weak var videoSpeedSegment: UISegmentedControl!
    
    //test to see if playback rate slow down can work.
    @IBOutlet weak var slowButton: UIButton!
    
    var songSpeedPercentage: Int = 0
    
    @IBAction func minusTempoButtonTapped(_ sender: Any) {
        videoView.player?.rate -= 0.5
        songSpeedPercentage -= 5
        //speedPercentageLabel.text = "\(songSpeedPercentage)%"
        
        if videoView.player?.rate == 0.25 || songSpeedPercentage == 25 {
            slowButton.isEnabled = false
        }
        
        slowButton.isEnabled = true
    }
    
    
    
    
  
    
    
    //Not sure which type of array..thing I need, or what one does what still. So will use both until I figure out what one does what.
    //https://guides.codepath.com/ios/Using-UITableView - uses the non commented out one.
//    var signsArray = [Signs]()
    var signs: Signs?
    
    
    
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
            label.text = signs?.signName.capitalized
          //whats the difference between uppercased and capitalized

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
            let customButton = UIButton.init(frame: CGRect.init(x:0, y: 0, width: 20, height: 20))
            customButton.setImage(#imageLiteral(resourceName: "like"), for: .normal)
            //navigationItem.rightBarButtonItem = UIBarButtonItem(image: customButton, style: .done, target: nil, action: nil)
            self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: customButton)

        } else {
            //STILL NEED TO COMBINE THESE TO MAKE THEM ONE BUTTON
            navigationItem.rightBarButtonItems = [
                UIBarButtonItem(title: "Favorite", style: .done, target: self, action: #selector(handleSaveFavorite)),
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
//        showBadgeHighlight()
    }
   
//        func showBadgeHighlight() {
//            if let tabItems = tabBarController?.tabBar.items {
//
//                let tabItem = tabItems[1]
//                //currently every time I run the simulation it shows up with 'new' even if theres nothing new added and doesn't pop up when there's a new favorite added.
//                tabItem.badgeValue = "New"
//            }
//        }
    
    
}



