//
//  FullImageView.swift
//  LASDictionaryV2
//
//  Created by Jackie Norstrom on 10/7/20.
//  Copyright © 2020 LAS. All rights reserved.
//

import UIKit

class FullImageView: UIViewController {
    
    @IBOutlet weak var fullImageView: UIImageView!
    
    var imageUrl:String?
    var imageToShow: UIImage?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if imageUrl != nil {
            //fullImageView.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named:   "imagePlaceholder") )
            
        }else{
       if let image = imageToShow {
         fullImageView.image = image
        }
     }
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
       return self.fullImageView
    }
    
   
    
    
    
}
