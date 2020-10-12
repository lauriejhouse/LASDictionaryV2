//
//  FullImageView.swift
//  LASDictionaryV2
//
//  Created by Jackie Norstrom on 10/7/20.
//  Copyright © 2020 LAS. All rights reserved.
//

import UIKit

class FullImageView: UIViewController {
    
    var selectedFilm: Film?
//    var selectedAuteur = [Film]()
     var    auteur: Auteur!
//
    @IBOutlet weak var fullImageView: UIImageView!
    
    
//    let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapHandler(sender:)))
//
//
//
//    @objc func tapHandler(sender: UITapGestureRecognizer) {
//        if sender.state == .ended {
//            fullImageView.contentMode = .scaleAspectFit
//             // change the size of the image view so that it fills the whole screen
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fullImageView.image = UIImage (named: selectedFilm?.poster ?? "image")
        self.fullImageView.frame = self.view.frame
//
//        self.fullImageView.addGestureRecognizer(tapGestureRecognizer)
//        self.fullImageView.isUserInteractionEnabled = true
        
        
        //fullImageView.contentMode = .scaleAspectFit
    }
    

    
 
       
    
    
    
    }
    

    
    
    

