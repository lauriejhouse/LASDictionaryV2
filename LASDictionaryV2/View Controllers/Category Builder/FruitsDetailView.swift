//
//  FruitsDetailView.swift
//  LASDictionaryV2
//
//  Created by Jackie on 2/5/21.
//  Copyright © 2021 LAS. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit
import Firebase


class FruitsDetailView: UIViewController {
    
    
    @IBOutlet weak var fruitsLabel: UILabel!
    
    var fruit: Fruits?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let label = fruitsLabel
        {
            label.text = fruit?.fruitName.capitalized
          //whats the difference between uppercased and capitalized

        }
        
        
    }
    
    
    
    
}
