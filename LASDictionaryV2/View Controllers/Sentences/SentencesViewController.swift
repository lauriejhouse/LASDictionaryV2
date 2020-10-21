//
//  SentencesViewController.swift
//  LASDictionaryV2
//
//  Created by Jackie on 10/19/20.
//  Copyright © 2020 LAS. All rights reserved.
//

import UIKit

class SentencesViewController: UIViewController {
    
    
    var signs = [Signs]()
    var groups = [[String]]()
    
    var groupA = ["The","Do","Can","What","Where","Why"]
    var groupB = ["are","you"]
    var groupC = ["The","Do","Want","doing","Where","Why"]
    
    struct Wood {
        let text: String
        let name: String
    }
    
    
    @IBOutlet weak var label:  UILabel!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        groups.append(groupA)
        groups.append(groupB)
        groups.append(groupC)

        print("The groups are:", groups)
        
        groups[1].append("Food")
        print("After adding Food the groups are:", groups)
        
        print ("Group B still contains:", groups)

//        if let label = label
//            {
//                label.text = groups
//        }
                  // Do any additional setup after loading the view.
        
        
        let string = "The rain in Spain"
          
          let words = ["clouds","rain","wind"]
          let arrayResult = words.contains("rain")
         
          
          let combinedResult = words.contains(where: string.contains)
        
        print ("\(arrayResult)")
        print ("\(combinedResult)")

    }
    


}
