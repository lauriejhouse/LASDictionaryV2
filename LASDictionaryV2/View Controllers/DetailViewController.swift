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

   

    
    
    
    fileprivate func setupNavigationBarButtons() {
        //let's check if we have already saved this podcast as fav
        let savedSigns = UserDefaults.standard.savedSigns()
        // $0 represents one of the saved signs inside the array. == checks to see if the sign name in teh signs array has teh same name as the signName of the saved oen in the array
        let hasFavorited = savedSigns.index(where: { $0.signName == self.signs?.signName }) != nil
        if hasFavorited {
            // setting up our heart icon
            let customButton = UIButton.init(frame: CGRect.init(x:0, y: 0, width: 20, height: 20))
            customButton.setImage(#imageLiteral(resourceName: "like"), for: .normal)
            customButton.setTitleColor(UIColor.red, for: .normal)

            //navigationItem.rightBarButtonItem = UIBarButtonItem(image: customButton, style: .done, target: nil, action: nil)
            self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: customButton)

        } else {
            //STILL NEED TO COMBINE THESE TO MAKE THEM ONE BUTTON
            navigationItem.rightBarButtonItems = [
               UIBarButtonItem(title: "Favorite", style: .done, target: self, action: #selector(handleSaveFavorite)),
               UIBarButtonItem(title: "Quiz", style: .done, target: self, action: #selector(handleSaveQuiz)),
                
               //can turn this favorite text into a grey heart, then when you click it it turns to the red heart. use the code below.
               
                //UIBarButtonItem(image: #imageLiteral(resourceName: "like"), style: .plain, target: self, action: #selector(handleSaveFavorite))
                
                //UIBarButtonItem(title: "Fetch", style: .plain, target: self, action: #selector(handleFetchSavedSigns))
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
    
    
    
    //from LTBA
    @objc fileprivate func handleSaveFavorite() {
        print("Saving info into UserDefaults")
        
        guard let sign = self.signs else { return }
        
       
        
        // 1. Transform Podcast into Data
        var listOfFavoriteSigns = UserDefaults.standard.savedSigns()
        listOfFavoriteSigns.append(sign)
        let data = NSKeyedArchiver.archivedData(withRootObject: listOfFavoriteSigns)
        
        UserDefaults.standard.set(data, forKey: UserDefaults.favoritedSignsKey)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "like"), style: .plain, target: nil, action: nil)
   
    }
   
    
    
    
    
    
    
    
    
//    //from LBTA
      @objc fileprivate func handleFetchSavedQuiz() {
          print("Fetching saved QUIZ from UserDefaults")
          // how to retrieve our Podcast object from UserDefaults

          guard let data = UserDefaults.standard.data(forKey: UserDefaults.quizSignsKey) else { return }

          let savedPodcasts = NSKeyedUnarchiver.unarchiveObject(with: data) as? [Signs]

          savedPodcasts?.forEach({ (p) in
              print(p.signName)
          })

      }

//
//
      //from LTBA
      @objc fileprivate func handleSaveQuiz() {
          print("Saving QUIZ into UserDefaults")

          guard let sign = self.signs else { return }



          // 1. Transform Podcast into Data
          var listOfFavoriteSigns = UserDefaults.standard.savedQuiz()
          listOfFavoriteSigns.append(sign)
          let data = NSKeyedArchiver.archivedData(withRootObject: listOfFavoriteSigns)

          UserDefaults.standard.set(data, forKey: UserDefaults.quizSignsKey)

          navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "like"), style: .plain, target: nil, action: nil)
        
        print(listOfFavoriteSigns)

      }
//
   

    
    
}



