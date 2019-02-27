//
//  SignCell.swift
//  LASDictionaryV2
//
//  Created by Jackie on 2/27/19.
//  Copyright © 2019 LAS. All rights reserved.
//

import UIKit

class SignCell: UICollectionViewCell {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var thumbImg: UIImageView!
    
    
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
        
        layer.cornerRadius = 5.0
    }
    
    var signs: Signs!
    
    func configureCell(signs: Signs) {
        
        self.signs = signs
        nameLabel.text = self.signs.signName.capitalized
        thumbImg.image = UIImage(named: "\(self.signs.signNumber)")
        
    }
    
    
}
