//
//  HeaderCell.swift
//  LASDictionaryV2
//
//  Created by Jackie on 6/11/20.
//  Copyright © 2020 LAS. All rights reserved.
//

import UIKit

class HeaderCell: UITableViewCell {
    
    @IBOutlet var titleLabel: UILabel?
    @IBOutlet var toggleButton: UIButton?
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
