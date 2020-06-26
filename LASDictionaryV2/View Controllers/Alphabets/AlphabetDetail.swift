//
//  AlphabetDetail.swift
//  LASDictionaryV2
//
//  Created by Jackie on 6/17/20.
//  Copyright © 2020 LAS. All rights reserved.
//

import UIKit


class AlphabetDetail: UIViewController {
    
   @IBOutlet weak var alphabetLabel: UILabel?
    
    
    var game = "" {
        didSet {
            alphabetLabel?.text = game
        }
    }
    
    
    override func viewDidLoad() {
        game = "Chess"  
    }
    
    
}
