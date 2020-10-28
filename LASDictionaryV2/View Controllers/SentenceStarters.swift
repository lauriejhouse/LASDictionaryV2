//
//  SentenceStarters.swift
//  LASDictionaryV2
//
//  Created by Jackie on 10/27/20.
//  Copyright © 2020 LAS. All rights reserved.
//

import UIKit
import BonsaiController

class SentenceStarters: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
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
