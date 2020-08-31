//
//  DetailTableViewCell.swift
//  LASDictionaryV2
//
//  Created by Jackie on 8/25/20.
//  Copyright © 2020 LAS. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var alphabetLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
