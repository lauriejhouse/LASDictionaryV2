//
//  DictionaryTableViewCell.swift
//  LASDictionaryV2
//
//  Created by Jackie on 3/11/19.
//  Copyright © 2019 LAS. All rights reserved.
//

import UIKit

class DictionaryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dictionarySignLabel: UILabel!

    var signs: Signs!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    func configureDictionaryTableCell(signs: Signs) {
        
        self.signs = signs
        dictionarySignLabel.text = self.signs.signName.capitalized
        //        signImage.image = UIImage(named: "\(self.signs.signNumber)")
        
    }

}
