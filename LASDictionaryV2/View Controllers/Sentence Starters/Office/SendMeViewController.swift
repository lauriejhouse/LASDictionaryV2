//
//  SendMeViewController.swift
//  LASDictionaryV2
//
//  Created by Jackie on 1/15/21.
//  Copyright © 2021 LAS. All rights reserved.
//


import UIKit

class SendMeViewController: UIViewController {
    
    private var sendmeVideoPlayer: sendMeVideoPlayer?
    
    @IBOutlet weak var smallPlayer: sendMePlayerView!
    
    

   @IBAction func sendMe (_ sender: Any) {
         if let filePath = Bundle.main.path(forResource: "send me", ofType: ".mp4") {
         let fileURL = NSURL(fileURLWithPath: filePath)
            sendmeVideoPlayer = sendMeVideoPlayer(urlAsset: fileURL, view: smallPlayer)
         }
     }
    
    @IBAction func report(_ sender: Any) {
          if let filePath = Bundle.main.path(forResource: "a report", ofType: ".mp4") {
          let fileURL = NSURL(fileURLWithPath: filePath)
             sendmeVideoPlayer = sendMeVideoPlayer(urlAsset: fileURL, view: smallPlayer)
          }
      }
     
   
    
    @IBAction func cardCopy (_ sender: Any) {
        if let filePath = Bundle.main.path(forResource: "copyyourcard", ofType: ".mp4") {
        let fileURL = NSURL(fileURLWithPath: filePath)
           sendmeVideoPlayer = sendMeVideoPlayer(urlAsset: fileURL, view: smallPlayer)
        }
    }
    
    @IBAction func billCopy (_ sender: Any) {
        if let filePath = Bundle.main.path(forResource: "copy of the bill", ofType: ".mp4") {
        let fileURL = NSURL(fileURLWithPath: filePath)
           sendmeVideoPlayer = sendMeVideoPlayer(urlAsset: fileURL, view: smallPlayer)
        }
    }
    
    @IBAction func textTotal(_ sender: Any) {
        if let filePath = Bundle.main.path(forResource: "text with total", ofType: ".mp4") {
        let fileURL = NSURL(fileURLWithPath: filePath)
           sendmeVideoPlayer = sendMeVideoPlayer(urlAsset: fileURL, view: smallPlayer)
        }
    }
    
     override func viewDidLoad() {
         super.viewDidLoad()
        prepareOfficePlayer()
         // Do any additional setup after loading the view.
     }
     
     private func prepareOfficePlayer() {
         if let filePath = Bundle.main.path(forResource: "send me", ofType: ".mp4") {
             let fileURL = NSURL(fileURLWithPath: filePath)
            sendmeVideoPlayer = sendMeVideoPlayer(urlAsset: fileURL, view: smallPlayer)
             //videoPlayer = VideoPlayer(urlAsset: fileURL, view: playerView)

             if let player = sendmeVideoPlayer {
                 player.playerRate = 0.67
             }
         }
     }
     
     
     @IBAction func dismiss (_sender: Any) {
         
             dismiss(animated: true, completion: nil)
     }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
