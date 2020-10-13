//
//  FullImageView.swift
//  LASDictionaryV2
//
//  Created by Jackie Norstrom on 10/7/20.
//  Copyright © 2020 LAS. All rights reserved.
//

import UIKit

class FullImageView: UIViewController {
    

    var selectedAuteurFilm: Film?
//
    @IBOutlet weak var fullImageView: UIImageView!
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        fullImageView.image = UIImage (named: selectedAuteurFilm?.poster ?? "")

       }
    

    
 

    
    }
    

    
    
    

