//
//  DictionaryDetailViewController.swift
//  LASDictionaryV2
//
//  Created by Jackie on 3/14/19.
//  Copyright © 2019 LAS. All rights reserved.
//

import UIKit


class DictionaryDetailViewController: UIViewController {
    
    @IBOutlet weak var dictionarySignLabel: UILabel!
    
    var signs: Signs!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //safe unwrapping
        if let label = dictionarySignLabel
        {
            label.text = signs?.signName
        }
    }
    
    
    
}
