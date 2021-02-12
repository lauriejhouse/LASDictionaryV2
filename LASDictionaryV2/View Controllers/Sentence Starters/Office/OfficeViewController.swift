//
//  OfficeViewController.swift
//  LASDictionaryV2
//
//  Created by Jackie on 1/15/21.
//  Copyright © 2021 LAS. All rights reserved.
//

import UIKit
import BonsaiController
import AVKit
import AVFoundation
//import Firebase

class OfficeViewController: UIViewController {
    
    private var videoOfficePlayer: OfficeVideoPlayer?
    
    @IBOutlet weak var OfficesmallPlayer: OfficePlayerView!
    
    @IBOutlet weak var officeButton: UIButton!
    
    
    
    // MARK: -  Firebase
//
//    let store = Storage.storage()
//    let storeRef = Storage.storage().reference()
//    let userProfilesRef = Storage.storage().reference().child("Office Videos/")
//

//   @IBAction func office (_ sender: Any) {
//         if let filePath = Bundle.main.path(forResource: "hulu", ofType: ".mp4") {
//         let fileURL = NSURL(fileURLWithPath: filePath)
//            videoOfficePlayer = OfficeVideoPlayer(urlAsset: fileURL, view: OfficesmallPlayer)
//         }
//     }
    
    // MARK: - Food Buttons
    
    @IBAction func questionsAbout(_ sender: Any) {
                 if let filePath = Bundle.main.path(forResource: "questions about", ofType: ".mp4") {
                 let fileURL = NSURL(fileURLWithPath: filePath)
                    videoOfficePlayer = OfficeVideoPlayer(urlAsset: fileURL, view: OfficesmallPlayer)
                 }
             }
    
    @IBAction func sendMe(_ sender: Any) {
        if let filePath = Bundle.main.path(forResource: "send me", ofType: ".mp4") {
        let fileURL = NSURL(fileURLWithPath: filePath)
           videoOfficePlayer = OfficeVideoPlayer(urlAsset: fileURL, view: OfficesmallPlayer)
        }
    }
    
    @IBAction func transferAmount(_ sender: Any) {
        if let filePath = Bundle.main.path(forResource: "transfer", ofType: ".mp4") {
        let fileURL = NSURL(fileURLWithPath: filePath)
           videoOfficePlayer = OfficeVideoPlayer(urlAsset: fileURL, view: OfficesmallPlayer)
        }
    }
    
    @IBAction func donations(_ sender: Any) {
        if let filePath = Bundle.main.path(forResource: "donations", ofType: ".mp4") {
        let fileURL = NSURL(fileURLWithPath: filePath)
           videoOfficePlayer = OfficeVideoPlayer(urlAsset: fileURL, view: OfficesmallPlayer)
        }
    }
     
     override func viewDidLoad() {
         super.viewDidLoad()
        prepareOfficePlayer()
         // Do any additional setup after loading the view.
     }
     
     private func prepareOfficePlayer() {
         if let filePath = Bundle.main.path(forResource: "office", ofType: ".mp4") {
             let fileURL = NSURL(fileURLWithPath: filePath)
            videoOfficePlayer = OfficeVideoPlayer(urlAsset: fileURL, view: OfficesmallPlayer)
             //videoPlayer = VideoPlayer(urlAsset: fileURL, view: playerView)

             if let player = videoOfficePlayer {
                 player.playerRate = 0.67
             }
         }
     }
    
    private enum TransitionType {
           case none
           case slide(fromDirection: Direction)
           case menu(fromDirection: Direction)
           case bubble
       }
       
       private var transitionType: TransitionType = .none
       
       // MARK: Show Small View controller
       private func showSmallVC(transition: TransitionType) {
           
           transitionType = transition
           
           let vc = storyboard?.instantiateViewController(withIdentifier: "officesend") as! SendMeViewController
           

               vc.transitioningDelegate = self
           vc.modalPresentationStyle = .custom
           present(vc, animated: true, completion: nil)
           
       }
       
       // MARK: Storyboard
       override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           print("Prepare Segue")
           
           if segue.destination is FoodViewController {
               transitionType = .slide(fromDirection: .bottom)
               segue.destination.transitioningDelegate = self
               segue.destination.modalPresentationStyle = .custom
           }
       }
       
     
     
     @IBAction func dismiss (_sender: Any) {
         
             dismiss(animated: true, completion: nil)
     }
    

    /*
     // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension OfficeViewController: BonsaiControllerDelegate {
    
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
            return BonsaiController(fromView: officeButton, backgroundColor: backgroundColor, presentedViewController: presented, delegate: self)
            
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
