//
//  QuizViewController.swift
//  LASDictionaryV2
//
//  Created by Jackie on 1/20/20.
//  Copyright © 2020 LAS. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit
import Firebase


class QuizViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    
    
    var quizCard: QuizCard?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = quizCard?.name
    }
    
    
    
    @IBAction func playLocalVideo (_sender: Any) {
        
        guard let path = Bundle.main.path(forResource: "video", ofType: "mov") else {
            return
        }
        
        let videoURL = NSURL(fileURLWithPath: path)
        
        //create av player
        let player = AVPlayer(url: videoURL as URL)
        let controller = AVPlayerViewController()
        controller.player = player
        present(controller, animated: true) {
            player.play()
        }
    }
    
    
    
}
