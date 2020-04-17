//
//  SentencesDetailViewController.swift
//  LASDictionaryV2
//
//  Created by Jackie on 4/13/20.
//  Copyright © 2020 LAS. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
 

class SentencesDetailViewController: UIViewController {
    
    var signs: Signs?


// 4/13/20 - this was causing the video to not be able to close properly. So it was stuck in an endless loop. Moving it to view did load vixed it.
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        playVideo()
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        playVideo()
    }
    
    
    private func playVideo() {
        //may be able to change this to the Firebase DataSource code.
        guard let path = Bundle.main.path(forResource: "Backstabbing", ofType:"mov") else {
            debugPrint("video.m4v not found")
            return
        }
        let player = AVPlayer(url: URL(fileURLWithPath: path))
        let playerController = AVPlayerViewController()
        playerController.player = player
        present(playerController, animated: true) {
            player.play()
            
        }
    }
    
    
}
