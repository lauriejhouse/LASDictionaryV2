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
import Firebase


class VideoPlayerView: UIView {
    
    var signs: Signs!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .black
        
        //warning: use your own video url here, the bandwidth for google firebase storage will run out as more and more people use this file
        //may have to update the URL/let here to reflect whats in teh detail view, if this is where it's actually pulling the videos from.
        
        
//        let urlString = "https://firebasestorage.googleapis.com/v0/b/lasdictionaryv2.appspot.com/o/\(signs.signName).mov?alt=media&token=fb946cd6-94d6-4466-acaf-bdd0a48b4104"
        let videoName = signs.signName.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)

        let urlString = "https://firebasestorage.googleapis.com/v0/b/lasdictionaryv2.appspot.com/o/\(videoName!).mov"

        if let url = NSURL(string: urlString)
        {
            let player = AVPlayer(url: url as URL)
            
            let playerLayer = AVPlayerLayer(player: player)
            self.layer.addSublayer(playerLayer)
            playerLayer.frame = self.frame
            
            player.play()
        }
        
    }
    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}

