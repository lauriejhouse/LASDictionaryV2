//
//  FavoritesTableViewCell.swift
//  LASDictionaryV2
//
//  Created by Jackie Norstrom on 6/28/19.
//  Copyright © 2019 LAS. All rights reserved.
//


/*
 
 Have the favorites table view have teh video view right in the table cell? Or would that make the views too big? I can do a test run to try it. If I don't like it I'll go back to having the favorites list link to the video view.
 
 7/9/2019 - First going to try and "link" the table view to go to the video view, if that doesn't work, or is too many clicks then i will add the video view into the cell directly.
 */


import UIKit

class FavoritesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var favoriteLabel: UILabel!

    var sign: Signs! {
        didSet {
            favoriteLabel.text = sign.signName
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
