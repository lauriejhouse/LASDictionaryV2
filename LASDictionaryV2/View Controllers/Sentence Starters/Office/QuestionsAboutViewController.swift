//
//  QuestionsAboutViewController.swift
//  LASDictionaryV2
//
//  Created by Jackie on 1/15/21.
//  Copyright © 2021 LAS. All rights reserved.
//

import UIKit

class QuestionsAboutViewController: UIViewController {
    

private var VideoPlayerQuestions: QuestionsVideoPlayer?
    
@IBOutlet weak var QuestionsSmallPlayer: QuestionsPlayerView!

    override func viewDidLoad() {
        super.viewDidLoad()
       prepareQuestionsVideoPlayer()
        // Do any additional setup after loading the view.
    }
    

@IBAction func email (_ sender: Any) {
       if let filePath = Bundle.main.path(forResource: "an email", ofType: ".mp4") {
       let fileURL = NSURL(fileURLWithPath: filePath)
        VideoPlayerQuestions = QuestionsVideoPlayer(urlAsset: fileURL, view: QuestionsSmallPlayer)
       }
   }
    
    @IBAction func theMeeting (_ sender: Any) {
        if let filePath = Bundle.main.path(forResource: "the meeting", ofType: ".mp4") {
        let fileURL = NSURL(fileURLWithPath: filePath)
         VideoPlayerQuestions = QuestionsVideoPlayer(urlAsset: fileURL, view: QuestionsSmallPlayer)
        }
    }
    
    @IBAction func call(_ sender: Any) {
        if let filePath = Bundle.main.path(forResource: "the call", ofType: ".mp4") {
        let fileURL = NSURL(fileURLWithPath: filePath)
         VideoPlayerQuestions = QuestionsVideoPlayer(urlAsset: fileURL, view: QuestionsSmallPlayer)
        }
    }
    
    @IBAction func report (_ sender: Any) {
        if let filePath = Bundle.main.path(forResource: "a report", ofType: ".mp4") {
        let fileURL = NSURL(fileURLWithPath: filePath)
         VideoPlayerQuestions = QuestionsVideoPlayer(urlAsset: fileURL, view: QuestionsSmallPlayer)
        }
    }
    
    @IBAction func questions (_ sender: Any) {
        if let filePath = Bundle.main.path(forResource: "questions about", ofType: ".mp4") {
        let fileURL = NSURL(fileURLWithPath: filePath)
         VideoPlayerQuestions = QuestionsVideoPlayer(urlAsset: fileURL, view: QuestionsSmallPlayer)
        }
    }

    private func prepareQuestionsVideoPlayer() {
        if let filePath = Bundle.main.path(forResource: "questions about", ofType: ".mp4") {
            let fileURL = NSURL(fileURLWithPath: filePath)
            VideoPlayerQuestions = QuestionsVideoPlayer(urlAsset: fileURL, view: QuestionsSmallPlayer)
            //videoPlayer = VideoPlayer(urlAsset: fileURL, view: playerView)

            if let player = VideoPlayerQuestions {
                player.playerRate = 0.67
            }
        }
    }
    
    
    @IBAction func dismiss (_sender: Any) {
        
            dismiss(animated: true, completion: nil)
    }

}
