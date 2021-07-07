//
//  DonateViewController.swift
//  LASDictionaryV2
//
//  Created by Jackie on 1/15/21.
//  Copyright © 2021 LAS. All rights reserved.
//

import UIKit

class DonateViewController: UIViewController {

    private var videoDonatePlayer: DonateVideoPlayer?

    
    @IBOutlet weak var DonatesmallPlayer: DonatePlayerView!
    
    
    
    @IBAction func mtholyoke(_ sender: Any) {
        if let filePath = Bundle.main.path(forResource: "mt. holyoke", ofType: ".mp4") {
        let fileURL = NSURL(fileURLWithPath: filePath)
            videoDonatePlayer = DonateVideoPlayer(urlAsset: fileURL, view: DonatesmallPlayer)
        }
    }
    
    @IBAction func mtholyokeart(_ sender: Any) {
        if let filePath = Bundle.main.path(forResource: "mt holyoke aret museum", ofType: ".mp4") {
        let fileURL = NSURL(fileURLWithPath: filePath)
            videoDonatePlayer = DonateVideoPlayer(urlAsset: fileURL, view: DonatesmallPlayer)
        }
    }
    
    @IBAction func murlo(_ sender: Any) {
        if let filePath = Bundle.main.path(forResource: "murlo foundation", ofType: ".mp4") {
        let fileURL = NSURL(fileURLWithPath: filePath)
            videoDonatePlayer = DonateVideoPlayer(urlAsset: fileURL, view: DonatesmallPlayer)
        }
    }
    
    @IBAction func safehaven(_ sender: Any) {
        if let filePath = Bundle.main.path(forResource: "safe haven", ofType: ".mp4") {
        let fileURL = NSURL(fileURLWithPath: filePath)
            videoDonatePlayer = DonateVideoPlayer(urlAsset: fileURL, view: DonatesmallPlayer)
        }
    }
    
    @IBAction func donateWho(_ sender: Any) {
        if let filePath = Bundle.main.path(forResource: "donate to who", ofType: ".mp4") {
        let fileURL = NSURL(fileURLWithPath: filePath)
            videoDonatePlayer = DonateVideoPlayer(urlAsset: fileURL, view: DonatesmallPlayer)
        }
    }
     
     override func viewDidLoad() {
         super.viewDidLoad()
        prepareDonatePlayer()
         // Do any additional setup after loading the view.
     }
     
     private func prepareDonatePlayer() {
         if let filePath = Bundle.main.path(forResource: "donate to who", ofType: ".mp4") {
             let fileURL = NSURL(fileURLWithPath: filePath)
            videoDonatePlayer = DonateVideoPlayer(urlAsset: fileURL, view: DonatesmallPlayer)
             //videoPlayer = VideoPlayer(urlAsset: fileURL, view: playerView)

             if let player = videoDonatePlayer {
                 player.playerRate = 0.67
             }
         }
     }
     
     
     @IBAction func dismiss (_sender: Any) {
         
             dismiss(animated: true, completion: nil)
     }
    
    
    
}
