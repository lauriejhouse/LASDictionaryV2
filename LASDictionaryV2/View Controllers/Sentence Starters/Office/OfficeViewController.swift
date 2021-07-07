//
//  OfficeViewController.swift
//  LASDictionaryV2
//
//  Created by Jackie on 1/15/21.
//  Copyright © 2021 LAS. All rights reserved.
//

import UIKit

class OfficeViewController: UIViewController {
    
    private var videoOfficePlayer: OfficeVideoPlayer?
    
    @IBOutlet weak var OfficesmallPlayer: OfficePlayerView!
    
    

//   @IBAction func office (_ sender: Any) {
//         if let filePath = Bundle.main.path(forResource: "hulu", ofType: ".mp4") {
//         let fileURL = NSURL(fileURLWithPath: filePath)
//            videoOfficePlayer = OfficeVideoPlayer(urlAsset: fileURL, view: OfficesmallPlayer)
//         }
//     }
    
    @IBAction func questionsAbout(_ sender: Any) {
                 if let filePath = Bundle.main.path(forResource: "questions about", ofType: ".mp4") {
                 let fileURL = NSURL(fileURLWithPath: filePath)
                    videoOfficePlayer = OfficeVideoPlayer(urlAsset: fileURL, view: OfficesmallPlayer)
                 }
             }
    
    @IBAction func sendMe(_ sender: Any) {
        if let filePath = Bundle.main.path(forResource: "send me", ofType: ".mp4") {
        let fileURL = NSURL(fileURLWithPath: filePath)
           videoOfficePlayer = OfficeVideoPlayer(urlAsset: fileURL, view: OfficesmallPlayer)
        }
    }
    
    @IBAction func transferAmount(_ sender: Any) {
        if let filePath = Bundle.main.path(forResource: "transfer", ofType: ".mp4") {
        let fileURL = NSURL(fileURLWithPath: filePath)
           videoOfficePlayer = OfficeVideoPlayer(urlAsset: fileURL, view: OfficesmallPlayer)
        }
    }
    
    @IBAction func donations(_ sender: Any) {
        if let filePath = Bundle.main.path(forResource: "donations", ofType: ".mp4") {
        let fileURL = NSURL(fileURLWithPath: filePath)
           videoOfficePlayer = OfficeVideoPlayer(urlAsset: fileURL, view: OfficesmallPlayer)
        }
    }
     
     override func viewDidLoad() {
         super.viewDidLoad()
        prepareOfficePlayer()
         // Do any additional setup after loading the view.
     }
     
     private func prepareOfficePlayer() {
         if let filePath = Bundle.main.path(forResource: "to eat", ofType: ".mp4") {
             let fileURL = NSURL(fileURLWithPath: filePath)
            videoOfficePlayer = OfficeVideoPlayer(urlAsset: fileURL, view: OfficesmallPlayer)
             //videoPlayer = VideoPlayer(urlAsset: fileURL, view: playerView)

             if let player = videoOfficePlayer {
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
