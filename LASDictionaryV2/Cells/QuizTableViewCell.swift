//
//  QuizTableViewCell.swift
//  LASDictionaryV2
//
//  Created by Jackie on 1/22/20.
//  Copyright © 2020 LAS. All rights reserved.
//

import UIKit

class QuizTableViewCell: UITableViewCell {
    
    @IBOutlet weak var quizLabel: UILabel!

   var sign: Signs! {
            didSet {
                quizLabel.text = sign.signName
            }
        }

        override func awakeFromNib() {
            super.awakeFromNib()
            // Initialization code
        }


    //if the label doesn't work where it is, put this here instead. ***I need to edit/fix this so that it shows the filtered favorite signs.
    //     func configureFavoriteTableCell(signs: Signs) {
    //
    //     self.signs = signs
    //     favoriteLabel.text = self.signs.signName.capitalized
    //     //        signImage.image = UIImage(named: "\(self.signs.signNumber)")
    //
    //     }
     
     
        
        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)
            
            
            // Configure the view for the selected state
        }
        
        

    }
