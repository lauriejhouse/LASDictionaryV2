//
//  FoodPlayerView.swift
//  LASDictionaryV2
//
//  Created by Jackie on 12/1/20.
//  Copyright © 2020 LAS. All rights reserved.
//

import UIKit
import AVFoundation

class FoodPlayerView: UIView {
    
    
    var player: AVPlayer? {
        get {
            return playerLayer.player
        } set {
            playerLayer.player = newValue
        }
    }
    
    
    
    var playerLayer: AVPlayerLayer {
        return layer as! AVPlayerLayer
    }
    
    //Override UIView Property
    
    override static var layerClass: AnyClass {
        return AVPlayerLayer.self
    }
    
    
}
