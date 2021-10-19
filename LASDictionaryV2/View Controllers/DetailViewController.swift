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
import SwiftUI

//https://stackoverflow.com/questions/51334443/how-to-set-mediaplayer-playback-rate-in-swift
/*
 https://stackoverflow.com/questions/34038368/how-to-perform-some-action-on-play-and-pause-actions-of-avplayer
 https://stackoverflow.com/questions/2483783/how-to-change-the-speed-of-video-playback
 https://stackoverflow.com/questions/51334443/how-to-set-mediaplayer-playback-rate-in-swift
 
 */
class DetailViewController: UIViewController, UITabBarDelegate {
    
    @IBOutlet weak var signDetailNameLabel: UILabel!
    
    //@IBOutlet weak var videoView: VideoView!
      
    
    
    //Not sure which type of array..thing I need, or what one does what still. So will use both until I figure out what one does what.
    //https://guides.codepath.com/ios/Using-UITableView - uses the non commented out one.



    var signs: Signs?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBarButtons()
        if let label = signDetailNameLabel
               {
                   label.text = signs?.signName.capitalized
                 //whats the difference between uppercased and capitalized
               }
//can remove this end character once i go back to the rest of the viewDidLoad below.
}
    
    
    
    
    
    
//
//        //not working in ipad view. crashes. Probably because not every sign has a video yet?
//        //videoName is coming up as nil for iPad and iPhone view, but iPhone view is working correctly.
//        //videoName comes up nil when you first enter name in search bar, then click on it and then it is no longer nil.
//        guard let videoName = signs?.signName.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {return}
//        // 7/10/19 -  questions mark for signs.signName because i cahnged how the var signs: Signs work. instead of the simple var its var with did set.
//
//        //may need to redo the references to get the iPad layout to work correctly. OR DON'T DO SPLIT VIEW. DO I NEED SPLIT VIEW? i feel like if i don't have a split view this problem will be solved? Or is it a
//        //ADD JPG OPTION IF POSSIBLE
//        let httpsReference = Storage.storage().reference(forURL: "https://firebasestorage.googleapis.com/v0/b/lasdictionaryv2.appspot.com/o/\(videoName).mov")
//        let imageRef = Storage.storage().reference().child("images")
//        //may need to get rid of force unwrap. because thats not safe.
//
//        httpsReference.downloadURL() { url, error in
//            print("URL",url as Any)
//            print("ERROR", error as Any)
//            if let url = url, error == nil {
//                //self.videoView.configureForUrl(url)
//                self.videoView.configureForUrl(url)
//                self.videoView.isLoop = true
//                self.videoView.play()
//            }
//        }
//
//        imageRef.downloadURL() { url, error in
//        print("URL",url as Any)
//        print("ERROR", error as Any)
//        if let url = url, error == nil {
//            self.videoView.configureForUrl(url)
//            self.videoView.isLoop = true
//            self.videoView.play()
//        }
//        }
//
//        print("REF",httpsReference)
//        print("REF", imageRef)
//
//
//
//        //safe unwrapping
//        if let label = signDetailNameLabel
    //        {
    //            label.text = signs?.signName.capitalized
    //          //whats the difference between uppercased and capitalized
    //
    //        }
//
//
//    }

   

    
    
    
    fileprivate func setupNavigationBarButtons() {
        //let's check if we have already saved this podcast as fav
        let savedSigns = UserDefaults.standard.savedSigns()
        // $0 represents one of the saved signs inside the array. == checks to see if the sign name in teh signs array has teh same name as the signName of the saved oen in the array
        let hasFavorited = savedSigns.firstIndex(where: { $0.signName == self.signs?.signName }) != nil
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
               //UIBarButtonItem(title: "Quiz", style: .done, target: self, action: #selector(handleSaveQuiz)),
                
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
        
        let savedSigns = NSKeyedUnarchiver.unarchiveObject(with: data) as? [Signs]
        savedSigns?.forEach({ (p) in
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
   
    
    
    
    struct LoopingPlayer: UIViewRepresentable {
        func makeUIView(context: Context) -> UIView {
            return QueuePlayerUIView(frame: .zero)
        }
        
        func updateUIView(_ uiView: UIView, context: Context) {
            // Do nothing here
        }
    }

    class QueuePlayerUIView: UIView {
        private var playerLayer = AVPlayerLayer()
        private var playerLooper: AVPlayerLooper?
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            // Load Video
            let fileUrl = Bundle.main.url(forResource: "VideoWithBlock", withExtension: "mov")!
            let playerItem = AVPlayerItem(url: fileUrl)
            
            // Setup Player
            let player = AVQueuePlayer(playerItem: playerItem)
            playerLayer.player = player
            playerLayer.videoGravity = .resizeAspectFill
            layer.addSublayer(playerLayer)
            
            // Loop
            playerLooper = AVPlayerLooper(player: player, templateItem: playerItem)
            
            // Play
            player.play()
        }
        
        override func layoutSubviews() {
            super.layoutSubviews()
            playerLayer.frame = bounds
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }

    class PlayerUIView: UIView {
        private var playerLayer = AVPlayerLayer()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            // Load Video
            let fileUrl = Bundle.main.url(forResource: "VideoWithBlock", withExtension: "mov")!
            let playerItem = AVPlayerItem(url: fileUrl)
            
            // Setup Player
            let player = AVPlayer(playerItem: playerItem)
            playerLayer.player = player
            playerLayer.videoGravity = .resizeAspectFill
            layer.addSublayer(playerLayer)
            
            // Loop
            player.actionAtItemEnd = .none
            NotificationCenter.default.addObserver(self, selector: #selector(rewindVideo(notification:)), name: .AVPlayerItemDidPlayToEndTime, object: player.currentItem)
            
            // Play
            player.play()
        }
        
        @objc
        func rewindVideo(notification: Notification) {
            playerLayer.player?.seek(to: .zero)
        }
        
        override func layoutSubviews() {
            super.layoutSubviews()
            playerLayer.frame = bounds
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }

    struct LoopingPlayer_Previews: PreviewProvider {
        static var previews: some View {
            LoopingPlayer()
        }
    }

    
    
    
    
    
}



