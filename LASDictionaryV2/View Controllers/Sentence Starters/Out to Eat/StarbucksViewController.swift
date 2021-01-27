//
//  Starbucks.swift
//  LASDictionaryV2
//
//  Created by Jackie on 1/26/21.
//  Copyright © 2021 LAS. All rights reserved.
//

import UIKit

class StarbucksViewController: UIViewController {
    
    var videoStarbucksPlayer: StarbucksVideoPlayer?
    
    @IBOutlet weak var starbucksPlayerView: StarbucksPlayerView!
    
    
    
    @IBAction func latte (_ sender: Any) {
        if let filePath = Bundle.main.path(forResource: "Latte", ofType: ".mp4") {
        let fileURL = NSURL(fileURLWithPath: filePath)
            videoStarbucksPlayer = StarbucksVideoPlayer(urlAsset: fileURL, view: starbucksPlayerView)
        }
    }
    
    
    @IBAction func hotDrink (_ sender: Any) {
        if let filePath = Bundle.main.path(forResource: "hot drink", ofType: ".mp4") {
        let fileURL = NSURL(fileURLWithPath: filePath)
            videoStarbucksPlayer = StarbucksVideoPlayer(urlAsset: fileURL, view: starbucksPlayerView)
        }
    }
@IBAction func coldDrink (_ sender: Any) {
    if let filePath = Bundle.main.path(forResource: "cold drink", ofType: ".mp4") {
    let fileURL = NSURL(fileURLWithPath: filePath)
        videoStarbucksPlayer = StarbucksVideoPlayer(urlAsset: fileURL, view: starbucksPlayerView)
    }
}
 @IBAction func croissant (_ sender: Any) {
     if let filePath = Bundle.main.path(forResource: "croissant", ofType: ".mp4") {
     let fileURL = NSURL(fileURLWithPath: filePath)
         videoStarbucksPlayer = StarbucksVideoPlayer(urlAsset: fileURL, view: starbucksPlayerView)
     }
 }
 @IBAction func cakePop (_ sender: Any) {
     if let filePath = Bundle.main.path(forResource: "cake pop", ofType: ".mp4") {
     let fileURL = NSURL(fileURLWithPath: filePath)
         videoStarbucksPlayer = StarbucksVideoPlayer(urlAsset: fileURL, view: starbucksPlayerView)
     }
 }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       prepareMedicalPlayer()
        // Do any additional setup after loading the view.
    }
    
    private func prepareMedicalPlayer() {
        if let filePath = Bundle.main.path(forResource: "need", ofType: ".mp4") {
            let fileURL = NSURL(fileURLWithPath: filePath)
           videoStarbucksPlayer = StarbucksVideoPlayer(urlAsset: fileURL, view: starbucksPlayerView)
            //videoPlayer = VideoPlayer(urlAsset: fileURL, view: playerView)

            if let player = videoStarbucksPlayer {
                player.playerRate = 0.67
            }
        }
    }
    
    
    
}
