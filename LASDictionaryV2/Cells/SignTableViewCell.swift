//
//  SignTableViewCell.swift
//  LASDictionaryV2
//
//  Created by Jackie on 2/28/19.
//  Copyright © 2019 LAS. All rights reserved.
//

import UIKit

class SignTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    var signs: Signs!
    let sections:Array<Any> = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]


  
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
   

    
    func configureTableCell(signs: Signs) {
        
        self.signs = signs
        nameLabel.text = self.signs.signName.capitalized
        
    }

}
