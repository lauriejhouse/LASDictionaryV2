//
//  VideoPlayerView.swift
//  LASDictionaryV2
//
//  Created by Jackie on 3/26/19.
//  Copyright © 2019 LAS. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit


class VideoPlayerView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .black
        
        //warning: use your own video url here, the bandwidth for google firebase storage will run out as more and more people use this file
        let urlString = "https://firebasestorage.googleapis.com/v0/b/lasdictionaryv2.appspot.com/o/About.mov?alt=media&token=fb946cd6-94d6-4466-acaf-bdd0a48b4104"
        if let url = NSURL(string: urlString) {
            let player = AVPlayer(url: url as URL)
            
            let playerLayer = AVPlayerLayer(player: player)
            self.layer.addSublayer(playerLayer)
            playerLayer.frame = self.frame
            
            player.play()
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class VideoLauncher: NSObject {
    
    func showVideoPlayer() {
        print("Showing video player animation....")
        
        if let keyWindow = UIApplication.shared.keyWindow {
            let view = UIView(frame: keyWindow.frame)
            view.backgroundColor = UIColor.white
            
            view.frame = CGRect(x: keyWindow.frame.width - 10, y: keyWindow.frame.height - 10, width: 10, height: 10)
            
            //16 x 9 is the aspect ratio of all HD videos
            let height = keyWindow.frame.width * 9 / 16
            let videoPlayerFrame = CGRect(x: 0, y: 0, width: keyWindow.frame.width, height: height)
            let videoPlayerView = VideoPlayerView(frame: videoPlayerFrame)
            view.addSubview(videoPlayerView)
            
            keyWindow.addSubview(view)
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                
                view.frame = keyWindow.frame
                
            }, completion: { (completedAnimation) in
                //maybe we'll do something here later...
                let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView
                statusBar.isHidden = true
                
            })
        }
    }
}
