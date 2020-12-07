//
//  MainNumbers.swift
//  LASDictionaryV2
//
//  Created by Jackie on 12/7/20.
//  Copyright © 2020 LAS. All rights reserved.
//

import UIKit

class MainNumbers: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    var selectedImage: String?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
    }
    
    
    
    
}
