//
//  DetailViewController.swift
//  LASDictionaryV2
//
//  Created by Jackie on 2/28/19.
//  Copyright © 2019 LAS. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var signDetailNameLabel: UILabel!
    @IBOutlet weak var signImage: UIImageView!
    
    //Not sure which type of array..thing I need, or what one does what still. So will use both until I figure out what one does what.
    //https://guides.codepath.com/ios/Using-UITableView - uses the non commented out one.
//    var signsArray = [Signs]()
    var signs: Signs!
    

    
    
 
   
    
    //https://guides.codepath.com/ios/Using-UITableView
    override func viewDidLoad() {
        super.viewDidLoad()
    signDetailNameLabel.text = signs.signName
    }
    
    
}
