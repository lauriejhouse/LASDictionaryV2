//
//  DictionaryDetailViewController.swift
//  LASDictionaryV2
//
//  Created by Jackie on 3/14/19.
//  Copyright © 2019 LAS. All rights reserved.
//

import UIKit


class DictionaryDetailViewController: UIViewController {
    
    @IBOutlet weak var dictionaryDetailSignLabel: UILabel!
    
    var signsDictoinary: Signs!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //safe unwrapping
        if let dictionaryLabel = dictionaryDetailSignLabel
        {
            dictionaryLabel.text = signsDictoinary?.signName.capitalized
        }
    }
    
    
    
}
