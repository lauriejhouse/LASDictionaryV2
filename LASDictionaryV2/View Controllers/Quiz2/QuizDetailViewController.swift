//
//  QuizDetailViewController.swift
//  LASDictionaryV2
//
//  Created by Jackie on 1/22/20.
//  Copyright © 2020 LAS. All rights reserved.
//

import UIKit
import Firebase

class QuizDetailViewController: UIViewController {
    
    
    
    @IBOutlet weak var quizLabel: UILabel!
        @IBOutlet weak var quizVideoView: quizVideoView!
        
        var signs: Signs?
        
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
        if let label = quizLabel
            {
                label.text = signs?.signName
        }
            
            guard let videoName = signs?.signName.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {return}
            
            
            let httpsReference = Storage.storage().reference(forURL: "https://firebasestorage.googleapis.com/v0/b/lasdictionaryv2.appspot.com/o/\(videoName).mov")
            
            httpsReference.downloadURL() { url, error in
                print("URL",url as Any)
                print("ERROR", error as Any)
                if let url = url, error == nil {
                    self.quizVideoView.configureForUrl(url)
                    self.quizVideoView.isLoop = true
                    self.quizVideoView.play()
                }
            }
            
            
        }
        
        

        
        
        
        
    }
