//
//  NumberTableViewCell.swift
//  LASDictionaryV2
//
//  Created by Jackie on 12/2/20.
//  Copyright © 2020 LAS. All rights reserved.
//

import UIKit

class NumberTableViewCell: UITableViewCell {
    
    @IBOutlet weak var numberLabel: UILabel!
    
    var numbers = ["1","2","3","4","5"]

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
