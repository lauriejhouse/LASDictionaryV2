//
//  SentenceStarters.swift
//  LASDictionaryV2
//
//  Created by Jackie on 10/27/20.
//  Copyright © 2020 LAS. All rights reserved.
//

import UIKit
import BonsaiController
import AVKit
import AVFoundation

class SentenceStarters: UIViewController {
    

   //private var playerView: PlayerView = PlayerView()
    private var videoPlayer: VideoPlayer?
    
    @IBOutlet weak var player: PlayerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.addSubview(playerView)
        
       

//
//        playerView.translatesAutoresizingMaskIntoConstraints = false
//        playerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        playerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//
//        playerView.widthAnchor.constraint(equalToConstant: 300).isActive = true
//        playerView.heightAnchor.constraint(equalToConstant: 400).isActive = true
        
        
        
        /* // set Constraints (if you do it purely in code)
         playerView.translatesAutoresizingMaskIntoConstraints = false
         playerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10.0).isActive = true
         playerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10.0).isActive = true
         playerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10.0).isActive = true
         playerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 10.0).isActive = true
         
         */
        
        preparePlayer()

       
        }
    
    private func preparePlayer() {
        if let filePath = Bundle.main.path(forResource: "What", ofType: ".mov") {
            let fileURL = NSURL(fileURLWithPath: filePath)
            videoPlayer = VideoPlayer(urlAsset: fileURL, view: player)
            //videoPlayer = VideoPlayer(urlAsset: fileURL, view: playerView)

            if let player = videoPlayer {
                player.playerRate = 0.67
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.destination is SentenceStarters {
            segue.destination.transitioningDelegate = self
            segue.destination.modalPresentationStyle = .custom
        }
    }
    
    

    
}



extension SentenceStarters: BonsaiControllerDelegate {
    
    
    // return the frame of your Bonsai View Controller
     func frameOfPresentedView(in containerViewFrame: CGRect) -> CGRect {
         
         return CGRect(origin: CGPoint(x: 0, y: containerViewFrame.height / 4), size: CGSize(width: containerViewFrame.width, height: containerViewFrame.height / (4/3)))
     }
     
     // return a Bonsai Controller with SlideIn or Bubble transition animator
     func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
     
         // Slide animation from .left, .right, .top, .bottom
         return BonsaiController(fromDirection: .bottom, blurEffectStyle: .light, presentedViewController: presented, delegate: self)
         
         
         
         // or Bubble animation initiated from a view
         //return BonsaiController(fromView: yourOriginView, blurEffectStyle: .dark,  presentedViewController: presented, delegate: self)
     }
    
}
