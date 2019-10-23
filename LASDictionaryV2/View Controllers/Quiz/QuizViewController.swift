//
//  QuizViewController.swift
//  LASDictionaryV2
//
//  Created by Jackie on 10/21/19.
//  Copyright © 2019 LAS. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    
    
    @IBOutlet weak var questionsLabel: UILabel!
    @IBOutlet weak var answer0: UIButton!
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    @IBOutlet weak var progressLabel: UILabel!
    
    
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
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        currentQuestion = questions[0]
        setQuestion()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func submitAsnwer0(_ sender: Any) {
        checkAnswer(idx: 0)
    }
    
    @IBAction func submitAsnwer1(_ sender: Any) {
        checkAnswer(idx: 1)
    }
    
    @IBAction func submitAsnwer2(_ sender: Any) {
        checkAnswer(idx: 2)
    }
    
    @IBAction func submitAsnwer3(_ sender: Any) {
        checkAnswer(idx: 3)
    }
    
    //This checks to see if the answer is correct then loads the next questions
    
    func checkAnswer(idx: Int) {
        if (idx == currentQuestion!.correctAnswer) {
            noCorrect += 1
        }
        loadNextQuestion()
    }
    
    
    
    func loadNextQuestion() {
        //shows next question
        if (currentQuestionPos + 1 < questions.count) {
            currentQuestionPos += 1
            currentQuestion = questions[currentQuestionPos]
            setQuestion()
        } else {
            performSegue(withIdentifier: "sgShowResults", sender: nil)
        }
        
    }
    
    func setQuestion() {
        questionsLabel.text = currentQuestion!.question
        answer0.setTitle(currentQuestion?.answers[0], for: .normal)
        answer1.setTitle(currentQuestion?.answers[1], for: .normal)
        answer2.setTitle(currentQuestion?.answers[2], for: .normal)
        answer3.setTitle(currentQuestion?.answers[3], for: .normal)
        progressLabel.text = "\(currentQuestionPos + 1) / \(questions.count)"

    }
    
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "sgShowResults") {
            let vc = segue.destination as! ResultsViewController
            vc.noCorrect = noCorrect
            vc.total = questions.count
        }
    }
    
    
    

}
