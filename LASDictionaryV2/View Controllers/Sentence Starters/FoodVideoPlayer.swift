//
//  FoodVideoPlayer.swift
//  LASDictionaryV2
//
//  Created by Jackie on 12/1/20.
//  Copyright © 2020 LAS. All rights reserved.
//



import Foundation
import AVFoundation



protocol FoodVideoPlayerDelegate {
    func downloadedProgress(progress:Double)
    func readyToPlay()
    func didUpdateProgress(progress:Double)
    func didFinishPlayItem()
    func didFailPlayToEnd()
    
    
}


let videoContextFood: UnsafeMutableRawPointer? = nil

class FoodVideoPlayer: NSObject {
    
    private var assetPlayer: AVPlayer?
    private var playerItem: AVPlayerItem?
    private var urlAsset: AVURLAsset?
    private var videoOutput: AVPlayerItemVideoOutput?
    
    private var assetDuration: Double = 0
    private var playerView: FoodPlayerView?
    
    private var autoRepeatPlay: Bool = true
    private var autoPlay: Bool = true
    
    var delegate: FoodVideoPlayerDelegate?
    
    var playerRate: Float = 1 {
        didSet {
            if let player = assetPlayer {
                player.rate = playerRate > 0 ? playerRate : 0.0
            }
        }
    }
    
    
    var volume: Float = 1.0 {
        didSet {
            if let player = assetPlayer {
                player.volume = volume > 0 ? volume : 0.0
                
            }
        }
    }
    
    
    
    
    
    //MARK: - Init
    
    convenience init (urlAsset: NSURL, view: FoodPlayerView, startAutoPlay: Bool = true, repeatAfterEnd: Bool = true) {
        self.init()
        
        playerView = view
        autoPlay = startAutoPlay
        autoRepeatPlay = repeatAfterEnd
        if let playView = playerView, let playerLayer = playView.layer as? AVPlayerLayer {
            playerLayer.videoGravity = AVLayerVideoGravity.resizeAspect
        }
        initialSetupWithURL(url: urlAsset)
        prepareToPlay()
    }
    
    override init() {
        super.init()
    }
    
    //MARK: - Public
    
    func isPlaying() -> Bool {
        if let player = assetPlayer {
            return player.rate > 0
        } else {
            return false
        }
    }
    
    func seekToPosition(seconds:Float64) {
            if let player = assetPlayer {
                pause()
                if let timeScale = player.currentItem?.asset.duration.timescale {
                    player.seek(to: CMTimeMakeWithSeconds(seconds, preferredTimescale: timeScale), completionHandler: { (complete) in
                        self.play()
                    })
                }
            }
        }

        func pause() {
            if let player = assetPlayer {
                player.pause()
            }
        }

        func play() {
            if let player = assetPlayer {
                if (player.currentItem?.status == .readyToPlay) {
                    player.play()
                    player.rate = playerRate
                }
            }
        }

        func cleanUp() {
            if let item = playerItem {
                item.removeObserver(self, forKeyPath: "status")
                item.removeObserver(self, forKeyPath: "loadedTimeRanges")
            }
            NotificationCenter.default.removeObserver(self)
            assetPlayer = nil
            playerItem = nil
            urlAsset = nil
        }

        // MARK: - Private

        private func prepareToPlay() {
            let keys = ["tracks"]
            if let asset = urlAsset {
                asset.loadValuesAsynchronously(forKeys: keys, completionHandler: {
                    DispatchQueue.main.async {
                        self.startLoading()
                    }
                })
            }
        }

    
   
    
    
        private func startLoading(){
            var error:NSError?
            guard let asset = urlAsset else {return}
            let status:AVKeyValueStatus = asset.statusOfValue(forKey: "tracks", error: &error)

            if status == AVKeyValueStatus.loaded {
                assetDuration = CMTimeGetSeconds(asset.duration)

                let videoOutputOptions = [kCVPixelBufferPixelFormatTypeKey as String : Int(kCVPixelFormatType_420YpCbCr8BiPlanarVideoRange)]
                videoOutput = AVPlayerItemVideoOutput(pixelBufferAttributes: videoOutputOptions)
                playerItem = AVPlayerItem(asset: asset)

                if let item = playerItem {
                    item.addObserver(self, forKeyPath: "status", options: .initial, context: videoContext)
                    item.addObserver(self, forKeyPath: "loadedTimeRanges", options: [.new, .old], context: videoContext)

                    NotificationCenter.default.addObserver(self, selector: #selector(playerItemDidReachEnd), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil)
                    NotificationCenter.default.addObserver(self, selector: #selector(didFailedToPlayToEnd), name: NSNotification.Name.AVPlayerItemFailedToPlayToEndTime, object: nil)

                    if let output = videoOutput {
                        item.add(output)

                        item.audioTimePitchAlgorithm = AVAudioTimePitchAlgorithm.varispeed
                        assetPlayer = AVPlayer(playerItem: item)

                        if let player = assetPlayer {
                            player.rate = playerRate
                        }

                        addPeriodicalObserver()
                        if let playView = playerView, let layer = playView.layer as? AVPlayerLayer {
                            layer.player = assetPlayer
                            print("player created")
                        }
                    }
                }
            }
        }

        private func addPeriodicalObserver() {
            let timeInterval = CMTimeMake(value: 1, timescale: 1)

            if let player = assetPlayer {
                player.addPeriodicTimeObserver(forInterval: timeInterval, queue: DispatchQueue.main, using: { (time) in
                    self.playerDidChangeTime(time: time)
                })
            }
        }

        private func playerDidChangeTime(time:CMTime) {
            if let player = assetPlayer {
                let timeNow = CMTimeGetSeconds(player.currentTime())
                let progress = timeNow / assetDuration

                delegate?.didUpdateProgress(progress: progress)
            }
        }
    
    //original

//        @objc private func playerItemDidReachEnd() {
//            delegate?.didFinishPlayItem()
//
//            if let player = assetPlayer {
//                player.seek(to: CMTime.zero)
//                if autoRepeatPlay == true {
//                    play()
//                }
//            }
//        }
    
    //test to see if loop can play right.
    @objc func playerItemDidReachEnd(notification: Notification) {
        if let playerItem = notification.object as? AVPlayerItem {
            playerItem.seek(to: CMTime.zero, completionHandler: nil)
            if autoRepeatPlay == true {
                play()
            }
        }
    }

        @objc private func didFailedToPlayToEnd() {
            delegate?.didFailPlayToEnd()
        }

        private func playerDidChangeStatus(status:AVPlayer.Status) {
            if status == .failed {
                print("Failed to load video")
            } else if status == .readyToPlay, let player = assetPlayer {
                volume = player.volume
                delegate?.readyToPlay()

                if autoPlay == true && player.rate == 0.0 {
                    play()
                }
            }
        }

        private func moviewPlayerLoadedTimeRangeDidUpdated(ranges:Array<NSValue>) {
            var maximum:TimeInterval = 0
            for value in ranges {
                let range:CMTimeRange = value.timeRangeValue
                let currentLoadedTimeRange = CMTimeGetSeconds(range.start) + CMTimeGetSeconds(range.duration)
                if currentLoadedTimeRange > maximum {
                    maximum = currentLoadedTimeRange
                }
            }
            let progress:Double = assetDuration == 0 ? 0.0 : Double(maximum) / assetDuration

            delegate?.downloadedProgress(progress: progress)
        }

        deinit {
            cleanUp()
        }

        private func initialSetupWithURL(url:NSURL) {
            let options = [AVURLAssetPreferPreciseDurationAndTimingKey : true]
            urlAsset = AVURLAsset(url: url as URL, options: options)
        }

        // MARK: - Observations
        override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {

            if context == videoContext {
                if let key = keyPath {
                    if key == "status", let player = assetPlayer {
                        playerDidChangeStatus(status: player.status)
                    } else if key == "loadedTimeRanges", let item = playerItem {
                        moviewPlayerLoadedTimeRangeDidUpdated(ranges: item.loadedTimeRanges)
                    }
                }
            }
}
    
    
   
    
    
    
    
    
    
    
    

}