//
//  RevealViewController.swift
//  LASDictionaryV2
//
//  Created by Jackie on 10/29/19.
//  Copyright © 2019 LAS. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit
import Firebase

class RevealViewController: UIViewController {
    

    
   
    
    
     override func viewDidLoad() {
          super.viewDidLoad()
        
        //currentQuestion = questions[0]
        //setQuestion()
        
//
//        guard let videoName = signCard?.name.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {return}
//
//          let httpsReference = Storage.storage().reference(forURL: "https://firebasestorage.googleapis.com/v0/b/lasdictionaryv2.appspot.com/o/\(videoName).mov")

//
//        let httpsReference = Storage.storage().reference(forURL: "https://firebasestorage.googleapis.com/v0/b/lasdictionaryv2.appspot.com/o/\(videoName).mov")
//
//
//          httpsReference.downloadURL() { url, error in
//              print("URL",url as Any)
//              print("ERROR", error as Any)
//              if let url = url, error == nil {
//                  self.signView.configureForUrl(url)
//                  self.signView.isLoop = true
//                  self.signView.play()
//              }
//          }
          
          
      }
    
    
    
    
    @IBAction func playLocalVideo(_ sender: Any) {

  
            guard let path = Bundle.main.path(forResource: "video", ofType: "mov") else {
                return
            }
            let videoURL = NSURL(fileURLWithPath: path)

            // Create an AVPlayer, passing it the local video url path
            let player = AVPlayer(url: videoURL as URL)
            let controller = AVPlayerViewController()
            controller.player = player
            present(controller, animated: true) {
                player.play()
            }
    

    }



       
       // Before we move to the results screen pass the how many we got correct, and the total number of questions
   //Crop out the text in the video to make sure they don't know what teh word was. Make a few more buttons for each video? then make text saying 'did you know what the first sign is' or 'what is the first sign' and give a few choices. 
    
    
    
    
    
    
}
    
    
    
    
 
    
    

