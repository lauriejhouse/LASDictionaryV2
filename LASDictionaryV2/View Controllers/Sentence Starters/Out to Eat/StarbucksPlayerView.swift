//
//  StarbucksPlayerView.swift
//  LASDictionaryV2
//
//  Created by Jackie on 1/26/21.
//  Copyright © 2021 LAS. All rights reserved.
//

import Foundation

import UIKit
import AVFoundation

class StarbucksPlayerView: UIView {
    
    
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
