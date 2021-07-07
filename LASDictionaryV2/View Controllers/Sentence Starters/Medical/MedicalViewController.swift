//
//  MedicalViewController.swift
//  LASDictionaryV2
//
//  Created by Jackie on 1/19/21.
//  Copyright © 2021 LAS. All rights reserved.
//

import UIKit

class MedicalViewController: UIViewController {
    
    
    private var videoMedicalPlayer: MedicalVideoPlayer?
    
    @IBOutlet weak var MedicalPlayer: MedicalPlayerView!
    
    
    @IBAction func needSomething(_ sender: Any) {
        if let filePath = Bundle.main.path(forResource: "need something for", ofType: ".mp4") {
        let fileURL = NSURL(fileURLWithPath: filePath)
            videoMedicalPlayer = MedicalVideoPlayer(urlAsset: fileURL, view: MedicalPlayer)
        }
    }
    
   @IBAction func head (_ sender: Any) {
        if let filePath = Bundle.main.path(forResource: "head", ofType: ".mp4") {
        let fileURL = NSURL(fileURLWithPath: filePath)
            videoMedicalPlayer = MedicalVideoPlayer(urlAsset: fileURL, view: MedicalPlayer)
        }
    }
    
    @IBAction func allergies(_ sender: Any) {
        if let filePath = Bundle.main.path(forResource: "allergies", ofType: ".mp4") {
        let fileURL = NSURL(fileURLWithPath: filePath)
            videoMedicalPlayer = MedicalVideoPlayer(urlAsset: fileURL, view: MedicalPlayer)
        }
        
    }
    
    @IBAction func sinuses (_ sender: Any) {
        if let filePath = Bundle.main.path(forResource: "sinuses", ofType: ".mp4") {
        let fileURL = NSURL(fileURLWithPath: filePath)
            videoMedicalPlayer = MedicalVideoPlayer(urlAsset: fileURL, view: MedicalPlayer)
        }
    }
     
    @IBAction func eyes (_ sender: Any) {
        if let filePath = Bundle.main.path(forResource: "eyes", ofType: ".mp4") {
        let fileURL = NSURL(fileURLWithPath: filePath)
            videoMedicalPlayer = MedicalVideoPlayer(urlAsset: fileURL, view: MedicalPlayer)
        }
    }
    
    @IBAction func muscles(_ sender: Any) {
        if let filePath = Bundle.main.path(forResource: "muscles", ofType: ".mp4") {
        let fileURL = NSURL(fileURLWithPath: filePath)
            videoMedicalPlayer = MedicalVideoPlayer(urlAsset: fileURL, view: MedicalPlayer)
        }
    }
    
    @IBAction func want (_ sender: Any) {
        if let filePath = Bundle.main.path(forResource: "want", ofType: ".mp4") {
        let fileURL = NSURL(fileURLWithPath: filePath)
            videoMedicalPlayer = MedicalVideoPlayer(urlAsset: fileURL, view: MedicalPlayer)
        }
    }
    
    
     override func viewDidLoad() {
         super.viewDidLoad()
        prepareMedicalPlayer()
         // Do any additional setup after loading the view.
     }
     
     private func prepareMedicalPlayer() {
         if let filePath = Bundle.main.path(forResource: "need something for", ofType: ".mp4") {
             let fileURL = NSURL(fileURLWithPath: filePath)
            videoMedicalPlayer = MedicalVideoPlayer(urlAsset: fileURL, view: MedicalPlayer)
             //videoPlayer = VideoPlayer(urlAsset: fileURL, view: playerView)

             if let player = videoMedicalPlayer {
                 player.playerRate = 0.67
             }
         }
     }
     
     
     @IBAction func dismiss (_sender: Any) {
         
             dismiss(animated: true, completion: nil)
     }
    
    
    
}
