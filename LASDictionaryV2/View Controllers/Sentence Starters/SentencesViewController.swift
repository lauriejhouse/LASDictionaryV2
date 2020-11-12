//
//  SentencesViewController.swift
//  LASDictionaryV2
//
//  Created by Jackie on 10/19/20.
//  Copyright © 2020 LAS. All rights reserved.
//

import UIKit

class SentencesViewController: UIViewController {

    private var videoPlayer: VideoPlayer?
    
    @IBOutlet weak var smallPlayer: PlayerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func coffeeButton (_ sender: Any) {
        
     if let filePath = Bundle.main.path(forResource: "coffee", ofType: ".mov") {
        let fileURL = NSURL(fileURLWithPath: filePath)
        videoPlayer = VideoPlayer(urlAsset: fileURL, view: smallPlayer)
        //videoPlayer = VideoPlayer(urlAsset: fileURL, view: playerView)

        if let player = videoPlayer {
            player.playerRate = 0.67
        }
    }
    }
    
//need to move the player stuff over here so the video plays correctly when its clicked on.


    
    @IBAction func dismiss (_sender: Any) {
        
            dismiss(animated: true, completion: nil)
    }
    
    
}
