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
    
    
    @IBOutlet weak var answer0: UIButton!
    
    @IBOutlet weak var answer1: UIButton!
    
    @IBOutlet weak var answer2: UIButton!
    
    @IBOutlet weak var progressLabel: UILabel!
    
    //https://www.seemuapps.com/swift-make-a-trivia-quiz-game
    
   struct Question {
           let question: String
           let answers: [String]
           let correctAnswer: Int
       }
       
       
       var questions: [Question] = [
           Question(
               question: "What is 1+1?",
               answers: ["1", "2", "3", "4"],
               correctAnswer: 1),
           Question(
               question: "Have you subscrbed to Seemu Apps",
               answers: ["Yes", "No", "I will", "No Thanks"],
               correctAnswer: 0),
           Question(
               question: "What is the Capital of Australia?",
               answers: ["Sydney", "Melbourne", "Adelaide", "Canberra"],
               correctAnswer: 3)
       ]
       
       var currentQuestion: Question?
       var currentQuestionPos = 0
       
       var noCorrect = 0
    
    
    
    
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
    @IBAction func dismissPressed(_sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    

    
    @IBAction func submitAnswer0(_ sender: Any) {

    }
    
    @IBAction func submitAnswer1(_ sender: Any) {

    }
    
    @IBAction func submitAnswer2(_ sender: Any) {

    }
    @IBAction func submitAnswer3(_ sender: Any) {

    }
    
    
    
    
    
}
    
    
    
    
 
    
    

