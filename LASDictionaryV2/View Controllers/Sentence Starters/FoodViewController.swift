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
        if let filePath = Bundle.main.path(forResource: "chicken", ofType: ".mp4") {
        let fileURL = NSURL(fileURLWithPath: filePath)
        videoFoodPlayer = FoodVideoPlayer(urlAsset: fileURL, view: smallPlayer)
        }
    }
    
    @IBAction func pasta(_ sender: Any) {
        if let filePath = Bundle.main.path(forResource: "pasta", ofType: ".mp4") {
        let fileURL = NSURL(fileURLWithPath: filePath)
        videoFoodPlayer = FoodVideoPlayer(urlAsset: fileURL, view: smallPlayer)
        }
    }
    
    @IBAction func fish(_ sender: Any) {
        if let filePath = Bundle.main.path(forResource: "fish", ofType: ".mp4") {
        let fileURL = NSURL(fileURLWithPath: filePath)
        videoFoodPlayer = FoodVideoPlayer(urlAsset: fileURL, view: smallPlayer)
        }
    }
    
    @IBAction func salmon(_ sender: Any) {
        if let filePath = Bundle.main.path(forResource: "salmon", ofType: ".mov") {
        let fileURL = NSURL(fileURLWithPath: filePath)
        videoFoodPlayer = FoodVideoPlayer(urlAsset: fileURL, view: smallPlayer)
        }
    }
    
    @IBAction func spag(_ sender: Any) {
        if let filePath = Bundle.main.path(forResource: "spaghetti", ofType: ".mp4") {
        let fileURL = NSURL(fileURLWithPath: filePath)
        videoFoodPlayer = FoodVideoPlayer(urlAsset: fileURL, view: smallPlayer)
        }
    }
    
    @IBAction func foilet(_ sender: Any) {
        if let filePath = Bundle.main.path(forResource: "filet", ofType: ".mp4") {
        let fileURL = NSURL(fileURLWithPath: filePath)
        videoFoodPlayer = FoodVideoPlayer(urlAsset: fileURL, view: smallPlayer)
        }
    }
    
    @IBAction func Sushi(_ sender: Any) {
        if let filePath = Bundle.main.path(forResource: "sushi", ofType: ".mp4") {
        let fileURL = NSURL(fileURLWithPath: filePath)
        videoFoodPlayer = FoodVideoPlayer(urlAsset: fileURL, view: smallPlayer)
        }
    }
    
    @IBAction func pizza(_ sender: Any) {
        if let filePath = Bundle.main.path(forResource: "pizza", ofType: ".mp4") {
        let fileURL = NSURL(fileURLWithPath: filePath)
        videoFoodPlayer = FoodVideoPlayer(urlAsset: fileURL, view: smallPlayer)
        }
    }
    
    private func prepareFoodPlayer() {
        if let filePath = Bundle.main.path(forResource: "to eat", ofType: ".mp4") {
            let fileURL = NSURL(fileURLWithPath: filePath)
            videoFoodPlayer = FoodVideoPlayer(urlAsset: fileURL, view: smallPlayer)
            //videoPlayer = VideoPlayer(urlAsset: fileURL, view: playerView)

            if let player = videoFoodPlayer {
                player.playerRate = 0.67
            }
        }
    }
    
    @IBAction func toeat(_ sender: Any) {
        if let filePath = Bundle.main.path(forResource: "to eat", ofType: ".mp4") {
        let fileURL = NSURL(fileURLWithPath: filePath)
        videoFoodPlayer = FoodVideoPlayer(urlAsset: fileURL, view: smallPlayer)
        }
    }
    


    
    @IBAction func dismiss (_sender: Any) {
        
            dismiss(animated: true, completion: nil)
    }
    
    
}
