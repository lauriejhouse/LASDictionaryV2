//
//  OutEatViewController.swift
//  LASDictionaryV2
//
//  Created by Jackie on 1/21/21.
//  Copyright © 2021 LAS. All rights reserved.
//

import UIKit

class OutEatViewController: UIViewController {
    
    
    private var EatvideoPlayer: EatVideoPlayer?

    @IBOutlet weak var eatPlayerView: EatPlayerView!
    
    
    @IBAction func grill (_ sender: Any) {
        if let filePath = Bundle.main.path(forResource: "110 Grill", ofType: ".mov") {
        let fileURL = NSURL(fileURLWithPath: filePath)
            EatvideoPlayer = EatVideoPlayer(urlAsset: fileURL, view: eatPlayerView)
        }
    }
    
    @IBAction func mcds (_ sender: Any) {
        if let filePath = Bundle.main.path(forResource: "mcdonalds", ofType: ".mov") {
        let fileURL = NSURL(fileURLWithPath: filePath)
            EatvideoPlayer = EatVideoPlayer(urlAsset: fileURL, view: eatPlayerView)
        }
    }
    
    @IBAction func thai (_ sender: Any) {
        if let filePath = Bundle.main.path(forResource: "thai", ofType: ".mp4") {
        let fileURL = NSURL(fileURLWithPath: filePath)
            EatvideoPlayer = EatVideoPlayer(urlAsset: fileURL, view: eatPlayerView)
        }
    }
    
    @IBAction func mocha (_ sender: Any) {
        if let filePath = Bundle.main.path(forResource: "mocha emporium", ofType: ".mp4") {
        let fileURL = NSURL(fileURLWithPath: filePath)
            EatvideoPlayer = EatVideoPlayer(urlAsset: fileURL, view: eatPlayerView)
        }
    }
    
    @IBAction func azPizza (_ sender: Any) {
        if let filePath = Bundle.main.path(forResource: "azPizza", ofType: ".mp4") {
        let fileURL = NSURL(fileURLWithPath: filePath)
            EatvideoPlayer = EatVideoPlayer(urlAsset: fileURL, view: eatPlayerView)
        }
    }
    
    @IBAction func diner (_ sender: Any) {
        if let filePath = Bundle.main.path(forResource: "the diner", ofType: ".mp4") {
        let fileURL = NSURL(fileURLWithPath: filePath)
            EatvideoPlayer = EatVideoPlayer(urlAsset: fileURL, view: eatPlayerView)
        }
    }
    
}
