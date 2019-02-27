//
//  signTableCell.swift
//  LASDictionaryV2
//
//  Created by Jackie on 2/27/19.
//  Copyright © 2019 LAS. All rights reserved.
//

import UIKit

class signTableCell: UITableViewCell {
    
    @IBOutlet weak var signNameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var signs: Signs!
    
    func configureCell(signs: Signs) {
        
        self.signs = signs
        signNameLabel.text = self.signs.signName.capitalized
        
    }

}
