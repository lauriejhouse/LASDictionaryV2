//
//  SentencesTableViewCell.swift
//  LASDictionaryV2
//
//  Created by Jackie on 10/21/20.
//  Copyright © 2020 LAS. All rights reserved.
//

import UIKit

class SentencesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var label: UILabel!
    var signs: Signs?
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureSententesCell(signs: Signs) {
        
        self.signs = signs
        label.text = self.signs?.signName.capitalized
        //videoImage.image = UIImage(named: "\(self.signs.signNumber)")
        
    }

}
