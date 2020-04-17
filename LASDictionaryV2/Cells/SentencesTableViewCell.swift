//
//  SentencesTableViewCell.swift
//  LASDictionaryV2
//
//  Created by Jackie on 4/7/20.
//  Copyright © 2020 LAS. All rights reserved.
//

import UIKit

class SentencesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var sentenceLabel: UILabel!
    var sentencesSigns: Signs?
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    func configureTableCell(signs: Signs) {
        
        self.sentencesSigns = signs
        sentenceLabel.text = self.sentencesSigns?.signName.capitalized
        
    }
    
}
