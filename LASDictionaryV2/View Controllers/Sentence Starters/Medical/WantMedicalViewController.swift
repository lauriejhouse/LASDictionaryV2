//
//  WantMedicalViewController.swift
//  LASDictionaryV2
//
//  Created by Jackie on 1/19/21.
//  Copyright © 2021 LAS. All rights reserved.
//

import UIKit


class WantMedicalViewController: UIViewController {
    
    
    
    private var videoWantMedicalPlayer: WantMedicalVideoPlayer?
    
    @IBOutlet weak var wantMedicalView: WantMedicalPlayerView!

    @IBAction func wantMedical(_ sender: Any) {
        if let filePath = Bundle.main.path(forResource: "want", ofType: ".mp4") {
        let fileURL = NSURL(fileURLWithPath: filePath)
            videoWantMedicalPlayer = WantMedicalVideoPlayer(urlAsset: fileURL, view: wantMedicalView)
        }
    }
    
    @IBAction func advil (_ sender: Any) {
        if let filePath = Bundle.main.path(forResource: "advil", ofType: ".mp4") {
        let fileURL = NSURL(fileURLWithPath: filePath)
            videoWantMedicalPlayer = WantMedicalVideoPlayer(urlAsset: fileURL, view: wantMedicalView)
        }
    }
    
    @IBAction func sudafed (_ sender: Any) {
    if let filePath = Bundle.main.path(forResource: "sudafed", ofType: ".mp4") {
    let fileURL = NSURL(fileURLWithPath: filePath)
        videoWantMedicalPlayer = WantMedicalVideoPlayer(urlAsset: fileURL, view: wantMedicalView)
    }
}
    
    @IBAction func advilpm (_ sender: Any) {
        if let filePath = Bundle.main.path(forResource: "advil pm", ofType: ".mp4") {
        let fileURL = NSURL(fileURLWithPath: filePath)
            videoWantMedicalPlayer = WantMedicalVideoPlayer(urlAsset: fileURL, view: wantMedicalView)
        }
    }
    
    @IBAction func cheryl (_ sender: Any) {
        if let filePath = Bundle.main.path(forResource: "call cheryl", ofType: ".mp4") {
        let fileURL = NSURL(fileURLWithPath: filePath)
            videoWantMedicalPlayer = WantMedicalVideoPlayer(urlAsset: fileURL, view: wantMedicalView)
        }
    }
    
    @IBAction func benedryl (_ sender: Any) {
        if let filePath = Bundle.main.path(forResource: "benadryl", ofType: ".mp4") {
        let fileURL = NSURL(fileURLWithPath: filePath)
            videoWantMedicalPlayer = WantMedicalVideoPlayer(urlAsset: fileURL, view: wantMedicalView)
        }
    }
    
    @IBAction func eyedrops(_ sender: Any) {
        if let filePath = Bundle.main.path(forResource: "eye drops", ofType: ".mp4") {
        let fileURL = NSURL(fileURLWithPath: filePath)
            videoWantMedicalPlayer = WantMedicalVideoPlayer(urlAsset: fileURL, view: wantMedicalView)
        }
    }
    
    @IBAction func painpatch (_ sender: Any) {
        if let filePath = Bundle.main.path(forResource: "pain patch", ofType: ".mp4") {
        let fileURL = NSURL(fileURLWithPath: filePath)
            videoWantMedicalPlayer = WantMedicalVideoPlayer(urlAsset: fileURL, view: wantMedicalView)
        }
    }
    
    @IBAction func extraflex (_ sender: Any) {
        if let filePath = Bundle.main.path(forResource: "extra flex", ofType: ".mp4") {
        let fileURL = NSURL(fileURLWithPath: filePath)
            videoWantMedicalPlayer = WantMedicalVideoPlayer(urlAsset: fileURL, view: wantMedicalView)
        }
    }
    
     
     override func viewDidLoad() {
         super.viewDidLoad()
        prepareMedicalPlayer()
         // Do any additional setup after loading the view.
     }
     
     private func prepareMedicalPlayer() {
         if let filePath = Bundle.main.path(forResource: "do want", ofType: ".mp4") {
             let fileURL = NSURL(fileURLWithPath: filePath)
            videoWantMedicalPlayer = WantMedicalVideoPlayer(urlAsset: fileURL, view: wantMedicalView)
             //videoPlayer = VideoPlayer(urlAsset: fileURL, view: playerView)

             if let player = videoWantMedicalPlayer {
                 player.playerRate = 0.67
             }
         }
     }
     
     
     @IBAction func dismiss (_sender: Any) {
         
             dismiss(animated: true, completion: nil)
     }
    
    
    
    
    
    
    
    
    
    
    
    
}
