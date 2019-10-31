//
//  RevealViewController.swift
//  LASDictionaryV2
//
//  Created by Jackie on 10/29/19.
//  Copyright © 2019 LAS. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit
import Firebase

class RevealViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var signView: QuizVideoView!
    
    var signs: Signs?
    var signCard: SignCard?
    
     override func viewDidLoad() {
          super.viewDidLoad()
      if let label = titleLabel
          {
              //label.text = signs?.signName
            label.text = signCard?.name
      }
          
          //guard let videoName = signs?.signName.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {return}
        guard let videoName = signCard?.name.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {return}
          
          let httpsReference = Storage.storage().reference(forURL: "https://firebasestorage.googleapis.com/v0/b/lasdictionaryv2.appspot.com/o/\(videoName).mov")
          
          httpsReference.downloadURL() { url, error in
              print("URL",url as Any)
              print("ERROR", error as Any)
              if let url = url, error == nil {
                  self.signView.configureForUrl(url)
                  self.signView.isLoop = true
                  self.signView.play()
              }
          }
          
          
      }
    
    
}
    
    
    
    
 
    
    

