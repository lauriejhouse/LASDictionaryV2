//
//  SentencesViewController.swift
//  LASDictionaryV2
//
//  Created by Jackie on 10/19/20.
//  Copyright © 2020 LAS. All rights reserved.
//

import UIKit

class FoodViewController: UIViewController {

    private var videoFoodPlayer: FoodVideoPlayer?
    
    @IBOutlet weak var smallPlayer: FoodPlayerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
            prepareFoodPlayer()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func chicken(_ sender: Any) {
        if let filePath = Bundle.main.path(forResource: "Chicken", ofType: ".mov") {
        let fileURL = NSURL(fileURLWithPath: filePath)
        videoFoodPlayer = FoodVideoPlayer(urlAsset: fileURL, view: smallPlayer)
        }
    }
    
    @IBAction func pasta(_ sender: Any) {
        if let filePath = Bundle.main.path(forResource: "Pasta", ofType: ".mov") {
        let fileURL = NSURL(fileURLWithPath: filePath)
        videoFoodPlayer = FoodVideoPlayer(urlAsset: fileURL, view: smallPlayer)
        }
    }
    
    @IBAction func fish(_ sender: Any) {
        if let filePath = Bundle.main.path(forResource: "fish", ofType: ".mov") {
        let fileURL = NSURL(fileURLWithPath: filePath)
        videoFoodPlayer = FoodVideoPlayer(urlAsset: fileURL, view: smallPlayer)
        }
    }
    
    
    private func prepareFoodPlayer() {
        if let filePath = Bundle.main.path(forResource: "to eat", ofType: ".mov") {
            let fileURL = NSURL(fileURLWithPath: filePath)
            videoFoodPlayer = FoodVideoPlayer(urlAsset: fileURL, view: smallPlayer)
            //videoPlayer = VideoPlayer(urlAsset: fileURL, view: playerView)

            if let player = videoFoodPlayer {
                player.playerRate = 0.67
            }
        }
    }
    


    
    @IBAction func dismiss (_sender: Any) {
        
            dismiss(animated: true, completion: nil)
    }
    
    
}
