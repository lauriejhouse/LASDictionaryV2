//
//  ImageDetailView.swift
//  LASDictionaryV2
//
//  Created by Jackie Norstrom on 9/30/20.
//  Copyright © 2020 LAS. All rights reserved.
//

import UIKit

class ImageDetailView: UIViewController {
    
    @IBOutlet weak var imageDetail: UIImageView!
    
    
    var selectedAuteur: Auteur!

    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        imageDetail.isUserInteractionEnabled = true

    }
    
  
   

    
}
