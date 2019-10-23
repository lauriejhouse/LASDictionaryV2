//
//  ResultsViewController.swift
//  LASDictionaryV2
//
//  Created by Jackie on 10/21/19.
//  Copyright © 2019 LAS. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var resultsLabel: UILabel!
    
    var noCorrect = 0
    var total = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        resultsLabel.text = "You got \(noCorrect) out of \(total) correct"
        
        var percentRight = Double(noCorrect) / Double(total)
        percentRight *= 100
        
        // Based on the percentage of questions you got right present the user with different message
               var title = ""
               if(percentRight < 40) {
                   title = "Not Good"
               } else if(percentRight < 70) {
                   title = "Almost"
               } else {
                   title = "Good Job"
               }
               titleLabel.text = title
        
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
