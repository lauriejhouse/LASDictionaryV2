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
    @IBOutlet weak var popButton: UIButton! //drink button
    
    
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
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "SmallVC") as! SmallViewController
        //vc.view.backgroundColor = UIColor(red: 208/255.0, green: 5/255.0, blue: 30/255.0, alpha: 1)
        vc.transitioningDelegate = self
        vc.modalPresentationStyle = .custom
        present(vc, animated: true, completion: nil)
        

        
    }
    
    // MARK: Storyboard
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("Prepare Segue")
        
        if segue.destination is SmallViewController {
            transitionType = .slide(fromDirection: .bottom)
            segue.destination.transitioningDelegate = self
            segue.destination.modalPresentationStyle = .custom
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.addSubview(playerView)
        
    
        
        preparePlayer()

       
        }
    
    private func preparePlayer() {
        if let filePath = Bundle.main.path(forResource: "want", ofType: ".mov") {
            let fileURL = NSURL(fileURLWithPath: filePath)
            videoPlayer = VideoPlayer(urlAsset: fileURL, view: player)
            //videoPlayer = VideoPlayer(urlAsset: fileURL, view: playerView)

            if let player = videoPlayer {
                player.playerRate = 0.67
            }
        }
    }
    

    

    
    //mARK: - Pop Button
    
//    @IBAction func showAsPopupButton(_ sender: Any) {
//        print("Popup Button Action")
//
//        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SmallVC") as! SmallViewController
//        BonsaiPopupUtility.shared.show(viewController: vc)
//    }
    
    
    //this needs to change to the big full screen mode?
    @IBAction func bubbleBUtton(_ sender: UIButton) {
        print("Bubble Button Action")
        //showSmallVC(transition: .bubble)
        
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "SmallVC") as! SmallViewController //goes to the drink?
        BonsaiFullScreenPopUtility.shared.show(viewController: vc, fromView: sender)

    }
    

    
    @IBAction func foodButton (_ sender: UIButton) {
        print("Bubble Button Action")
        //showSmallVC(transition: .bubble)
        
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "FoodVC") as! FoodViewController //goes to the food??
        BonsaiFullScreenPopUtility.shared.show(viewController: vc, fromView: sender)

    }
}



extension SentenceStarters: BonsaiControllerDelegate {
    
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
            return BonsaiController(fromView: popButton, backgroundColor: backgroundColor, presentedViewController: presented, delegate: self)
            
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
