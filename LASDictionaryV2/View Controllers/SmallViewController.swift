//
//  SmallViewController.swift
//  LASDictionaryV2
//
//  Created by Jackie on 10/30/20.
//  Copyright © 2020 LAS. All rights reserved.
//

import UIKit

class SmallViewController: UIViewController {
    
    private var videoPlayer: VideoPlayer?

    
    @IBOutlet weak var player: PlayerView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        preparePlayerSmall()
    }
    
    
    private func preparePlayerSmall() {
        if let filePath = Bundle.main.path(forResource: "Backstabbing", ofType: ".mov") {
            let fileURL = NSURL(fileURLWithPath: filePath)
            videoPlayer = VideoPlayer(urlAsset: fileURL, view: player)
            //videoPlayer = VideoPlayer(urlAsset: fileURL, view: playerView)

            if let player = videoPlayer {
                player.playerRate = 0.67
            }
        }
    }
    
    @IBAction func dismissButton(_sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
