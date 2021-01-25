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
        if let filePath = Bundle.main.path(forResource: "110 Grill", ofType: ".mp4") {
        let fileURL = NSURL(fileURLWithPath: filePath)
            EatvideoPlayer = EatVideoPlayer(urlAsset: fileURL, view: eatPlayerView)
        }
    }
    
    
    
    
    
    
    
}
