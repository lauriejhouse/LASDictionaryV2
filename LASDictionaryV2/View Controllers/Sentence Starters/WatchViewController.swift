//
//  Watch.swift
//  LASDictionaryV2
//
//  Created by Jackie on 1/13/21.
//  Copyright © 2021 LAS. All rights reserved.
//

import UIKit

class WatchViewController: UIViewController {
    
    
    private var videoPlayerWatch: WatchVideoPlayer?

    @IBOutlet weak var smallPlayer: WatchPlayerView!
    
   @IBAction func hulu(_ sender: Any) {
        if let filePath = Bundle.main.path(forResource: "hulu", ofType: ".mov") {
        let fileURL = NSURL(fileURLWithPath: filePath)
            videoPlayerWatch = WatchVideoPlayer(urlAsset: fileURL, view: smallPlayer)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
            prepareWatchPlayer()
        // Do any additional setup after loading the view.
    }
    
    private func prepareWatchPlayer() {
        if let filePath = Bundle.main.path(forResource: "to eat", ofType: ".mov") {
            let fileURL = NSURL(fileURLWithPath: filePath)
            videoPlayerWatch = WatchVideoPlayer(urlAsset: fileURL, view: smallPlayer)
            //videoPlayer = VideoPlayer(urlAsset: fileURL, view: playerView)

            if let player = videoPlayerWatch {
                player.playerRate = 0.67
            }
        }
    }
    
    
    @IBAction func dismiss (_sender: Any) {
        
            dismiss(animated: true, completion: nil)
    }
    
}
