//
//  SentencesLabelView.swift
//  LASDictionaryV2
//
//  Created by Jackie on 4/27/20.
//  Copyright © 2020 LAS. All rights reserved.
//

import UIKit

class SentencesLabelView: UIViewController {
    
    var labelSigns: Signs?
    
    @IBOutlet weak var signsLabel: UILabel!
    
    //func showLinks goes here? or would it go under the search bar or both?
    
   func configureSentenceLabel(words: Signs) {
           
           self.labelSigns = words
           signsLabel.text = self.labelSigns?.signName.capitalized
           
       }
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
