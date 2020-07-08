//
//  AlphabetDetail.swift
//  LASDictionaryV2
//
//  Created by Jackie on 6/17/20.
//  Copyright © 2020 LAS. All rights reserved.
//

import UIKit


class AlphabetDetail: UIViewController {
    
    
    var sectionData = [sectionsData]

    var alphabets: Item?
    
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

//https://guides.codepath.com/ios/Using-UITableView
