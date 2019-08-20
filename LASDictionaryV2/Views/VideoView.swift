//
//  VideoView.swift
//  LASDictionaryV2
//
//  Created by Jackie on 4/3/19.
//  Copyright © 2019 LAS. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class VideoView: UIView {
    
  
    
    var playerLayer: AVPlayerLayer?
    var player: AVPlayer?
    var isLoop: Bool = false
    
   
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    func setRate(_ rate: Float,
                 time itemTime: CMTime,
                 atHostTime hostClockTime: CMTime) {
        
    }
    
    
    func configureForUrl ( _ url : URL) {
        player = AVPlayer(url: url)
        playerLayer = AVPlayerLayer(player: player)
        playerLayer?.frame = bounds
        playerLayer?.videoGravity = AVLayerVideoGravity.resize
        if let playerLayer = self.playerLayer {
            layer.addSublayer(playerLayer)
            player?.play()
        }
        NotificationCenter.default.addObserver(self, selector: #selector(reachTheEndOfTheVideo(_:)), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: self.player?.currentItem)
        
    }
    
    //original
//    func configure(url: String) {
//        if let videoURL = URL(string: url) {
//            player = AVPlayer(url: videoURL)
//            playerLayer = AVPlayerLayer(player: player)
//            playerLayer?.frame = bounds
//            playerLayer?.videoGravity = AVLayerVideoGravity.resize
//            if let playerLayer = self.playerLayer {
//                layer.addSublayer(playerLayer)
//            }
//            NotificationCenter.default.addObserver(self, selector: #selector(reachTheEndOfTheVideo(_:)), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: self.player?.currentItem)
//
//
//    }
//    }
    
    
    func configure(url: String) {
        if let videoURL = URL(string: url) {
            player = AVPlayer(url: videoURL)
            playerLayer = AVPlayerLayer(player: player)
            playerLayer?.frame = bounds
            playerLayer?.videoGravity = AVLayerVideoGravity.resize
            if let playerLayer = self.playerLayer {
                layer.addSublayer(playerLayer)
            }
            NotificationCenter.default.addObserver(self, selector: #selector(reachTheEndOfTheVideo(_:)), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: self.player?.currentItem)

        }
    }
    
 
    
    
    func play() {
        if player?.timeControlStatus != AVPlayer.TimeControlStatus.playing {
            player?.play()
            
            //this slows it down.
            player?.playImmediately(atRate: 0.50)

        }
    }
    
    func pause() {
        player?.pause()
    }
    
    func stop() {
        player?.pause()
        player?.seek(to: CMTime.zero)
    }
    
    @objc func reachTheEndOfTheVideo(_ notification: Notification) {
        if isLoop {
            player?.pause()
            player?.seek(to: CMTime.zero)
            //this stops the loop.
            player?.play()
            
            //this slows it down.
            player?.playImmediately(atRate: 0.50)

        }
    }
}
