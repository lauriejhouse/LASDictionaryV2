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
               question: "Did you know the sign?",
               answers: ["Yes", "No", "Needs Practice"],
               correctAnswer: 0),
           Question(
               question: "About?",
               answers: ["Yes", "No", "Needs Practice"],
                correctAnswer: 0),
           Question(
               question: "Is this correct",
               answers: ["Yes", "No", "Needs Practice"],
               correctAnswer: 0)
       ]
       
       var currentQuestion: Question?
       var currentQuestionPos = 0
       
       var noCorrect = 0
    
    
    
    
    
    var signs: Signs?
    var signCard: SignCard?
    
     override func viewDidLoad() {
          super.viewDidLoad()
        
        currentQuestion = questions[0]
        setQuestion()
        
        
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
        checkAnswer(idx: 0)

    }
    
    @IBAction func submitAnswer1(_ sender: Any) {
        checkAnswer(idx: 1)

    }
    
    @IBAction func submitAnswer2(_ sender: Any) {
        checkAnswer(idx: 2)

    }
    @IBAction func submitAnswer3(_ sender: Any) {
        checkAnswer(idx: 3)

    }
    
    func checkAnswer(idx: Int) {
           if(idx == currentQuestion!.correctAnswer) {
               noCorrect += 1
           }
           loadNextQuestion()
       }
    
    func loadNextQuestion() {
          // Show next question
          if(currentQuestionPos + 1 < questions.count) {
              currentQuestionPos += 1
              currentQuestion = questions[currentQuestionPos]
              setQuestion()
          // If there are no more questions show the results
          } else {
              performSegue(withIdentifier: "showResults", sender: nil)
          }

      }
    
    
    // Set labels and buttions for the current question
       func setQuestion() {
           titleLabel.text = currentQuestion!.question
           answer0.setTitle(currentQuestion!.answers[0], for: .normal)
           answer1.setTitle(currentQuestion!.answers[1], for: .normal)
           answer2.setTitle(currentQuestion!.answers[2], for: .normal)
           //answer3.setTitle(currentQuestion!.answers[3], for: .normal)
           progressLabel.text = "\(currentQuestionPos + 1) / \(questions.count)"
       }
       
       // Set the background as a blue gradient
       func setGradientBackground() {
           let colorTop =  UIColor.black.cgColor
           let colorBottom = UIColor.blue.cgColor
           
           let gradientLayer = CAGradientLayer()
           gradientLayer.colors = [ colorTop, colorBottom]
           gradientLayer.locations = [ 0.0, 1.0]
           gradientLayer.frame = self.view.bounds
           
           self.view.layer.insertSublayer(gradientLayer, at: 0)
       }
       
       // Before we move to the results screen pass the how many we got correct, and the total number of questions
       override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if(segue.identifier == "showResults") {
            let vc = segue.destination as! ResultsViewController
               vc.noCorrect = noCorrect
               vc.total = questions.count
           }
       }
    
    
    
    
    
    
}
    
    
    
    
 
    
    

