//
//  WantMedicalViewController.swift
//  LASDictionaryV2
//
//  Created by Jackie on 1/19/21.
//  Copyright © 2021 LAS. All rights reserved.
//

import UIKit
import BonsaiController
import AVKit
import AVFoundation

class WantMedicalViewController: UIViewController {
    
    
    
    private var videoWantMedicalPlayer: WantMedicalVideoPlayer?
    
    @IBOutlet weak var wantMedicalView: WantMedicalPlayerView!
    
    @IBOutlet weak var wantMedButton: UIButton!

    @IBAction func wantMedical(_ sender: Any) {
        if let filePath = Bundle.main.path(forResource: "want", ofType: ".mp4") {
        let fileURL = NSURL(fileURLWithPath: filePath)
            videoWantMedicalPlayer = WantMedicalVideoPlayer(urlAsset: fileURL, view: wantMedicalView)
        }
    }
    
    @IBAction func advil (_ sender: Any) {
        if let filePath = Bundle.main.path(forResource: "advil", ofType: ".mp4") {
        let fileURL = NSURL(fileURLWithPath: filePath)
            videoWantMedicalPlayer = WantMedicalVideoPlayer(urlAsset: fileURL, view: wantMedicalView)
        }
    }
    
    @IBAction func sudafed (_ sender: Any) {
    if let filePath = Bundle.main.path(forResource: "sudafed", ofType: ".mp4") {
    let fileURL = NSURL(fileURLWithPath: filePath)
        videoWantMedicalPlayer = WantMedicalVideoPlayer(urlAsset: fileURL, view: wantMedicalView)
    }
}
    
    @IBAction func advilpm (_ sender: Any) {
        if let filePath = Bundle.main.path(forResource: "advil pm", ofType: ".mp4") {
        let fileURL = NSURL(fileURLWithPath: filePath)
            videoWantMedicalPlayer = WantMedicalVideoPlayer(urlAsset: fileURL, view: wantMedicalView)
        }
    }
    
    @IBAction func cheryl (_ sender: Any) {
        if let filePath = Bundle.main.path(forResource: "call cheryl", ofType: ".mp4") {
        let fileURL = NSURL(fileURLWithPath: filePath)
            videoWantMedicalPlayer = WantMedicalVideoPlayer(urlAsset: fileURL, view: wantMedicalView)
        }
    }
    
    @IBAction func benedryl (_ sender: Any) {
        if let filePath = Bundle.main.path(forResource: "benadryl", ofType: ".mp4") {
        let fileURL = NSURL(fileURLWithPath: filePath)
            videoWantMedicalPlayer = WantMedicalVideoPlayer(urlAsset: fileURL, view: wantMedicalView)
        }
    }
    
    @IBAction func eyedrops(_ sender: Any) {
        if let filePath = Bundle.main.path(forResource: "eye drops", ofType: ".mp4") {
        let fileURL = NSURL(fileURLWithPath: filePath)
            videoWantMedicalPlayer = WantMedicalVideoPlayer(urlAsset: fileURL, view: wantMedicalView)
        }
    }
    
    @IBAction func painpatch (_ sender: Any) {
        if let filePath = Bundle.main.path(forResource: "pain patch", ofType: ".mp4") {
        let fileURL = NSURL(fileURLWithPath: filePath)
            videoWantMedicalPlayer = WantMedicalVideoPlayer(urlAsset: fileURL, view: wantMedicalView)
        }
    }
    
    @IBAction func extraflex (_ sender: Any) {
        if let filePath = Bundle.main.path(forResource: "extra flex", ofType: ".mp4") {
        let fileURL = NSURL(fileURLWithPath: filePath)
            videoWantMedicalPlayer = WantMedicalVideoPlayer(urlAsset: fileURL, view: wantMedicalView)
        }
    }
    
     
     override func viewDidLoad() {
         super.viewDidLoad()
        prepareMedicalPlayer()
         // Do any additional setup after loading the view.
     }
     
     private func prepareMedicalPlayer() {
         if let filePath = Bundle.main.path(forResource: "do want", ofType: ".mp4") {
             let fileURL = NSURL(fileURLWithPath: filePath)
            videoWantMedicalPlayer = WantMedicalVideoPlayer(urlAsset: fileURL, view: wantMedicalView)
             //videoPlayer = VideoPlayer(urlAsset: fileURL, view: playerView)

             if let player = videoWantMedicalPlayer {
                 player.playerRate = 0.67
             }
         }
     }
     
     
     @IBAction func dismiss (_sender: Any) {
         
             dismiss(animated: true, completion: nil)
     }
    
    
    
    
    private enum TransitionType {
            case none
            case slide(fromDirection: Direction)
            case menu(fromDirection: Direction)
            case bubble
        }
     
     
     private var transitionType: TransitionType = .none

     // MARK: Show Small View controller
//        private func showSmallVC(transition: TransitionType) {
//
//            transitionType = transition
//
//            let vc = storyboard?.instantiateViewController(withIdentifier: "want") as! WantMedicalViewController
//
//
//                vc.transitioningDelegate = self
//            vc.modalPresentationStyle = .custom
//            present(vc, animated: true, completion: nil)
//
//        }
        
//        // MARK: Storyboard
//        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//            print("Prepare Segue")
//
//            if segue.destination is WantMedicalViewController {
//                transitionType = .slide(fromDirection: .bottom)
//                segue.destination.transitioningDelegate = self
//                segue.destination.modalPresentationStyle = .custom
//            }
//        }
        
    
    
    
    
    
    
    
}



extension WantMedicalViewController: BonsaiControllerDelegate {
    
    internal func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        
        var blurEffectStyle = UIBlurEffect.Style.dark
        
        if #available(iOS 13.0, *) {
            blurEffectStyle = .systemChromeMaterial
        }
        
        let backgroundColor = UIColor(white: 0, alpha: 0.5)
        
        switch transitionType {
        case .none:
            return nil
            
        case .bubble:
            
            // With Blur Style
            // return BonsaiController(fromView: popButton, blurEffectStyle: blurEffectStyle,  presentedViewController: presented, delegate: self)
        
            // With Background Color
            return BonsaiController(fromView: wantMedButton, backgroundColor: backgroundColor, presentedViewController: presented, delegate: self)
            
        case .slide(let fromDirection), .menu(let fromDirection):
            
            // With Blur Style
            // return BonsaiController(fromDirection: fromDirection, blurEffectStyle: blurEffectStyle, presentedViewController: presented, delegate: self)
            
            // With Background Color
            return BonsaiController(fromDirection: fromDirection, backgroundColor: backgroundColor, presentedViewController: presented, delegate: self)
        }
    }
    
    
    
    
    // return the frame of your Bonsai View Controller
    func frameOfPresentedView(in containerViewFrame: CGRect) -> CGRect {
        
        switch transitionType {
        case .none:
            return CGRect(origin: .zero, size: containerViewFrame.size)
        case .slide:
            return CGRect(origin: CGPoint(x: 0, y: containerViewFrame.height / 4), size: CGSize(width: containerViewFrame.width, height: containerViewFrame.height / (4/3)))
        case .bubble:
            return CGRect(origin: CGPoint(x: 0, y: containerViewFrame.height / 4), size: CGSize(width: containerViewFrame.width, height: containerViewFrame.height / 2))
        case .menu(let fromDirection):
            var origin = CGPoint.zero
            if fromDirection == .right {
                origin = CGPoint(x: containerViewFrame.width / 2, y: 0)
            }
            return CGRect(origin: origin, size: CGSize(width: containerViewFrame.width / 2, height: containerViewFrame.height))
        }
    }
    
}
