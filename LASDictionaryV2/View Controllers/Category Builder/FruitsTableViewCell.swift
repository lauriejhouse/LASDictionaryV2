//
//  FruitsTableViewCell.swift
//  LASDictionaryV2
//
//  Created by Jackie on 2/3/21.
//  Copyright © 2021 LAS. All rights reserved.
//

import UIKit

class FruitsTableViewCell: UITableViewCell {
    
    //var fruits = [Fruits]()
    var fruit: Fruits?
    
    @IBOutlet weak var fruitLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureTableCell(fruits: Fruits) {
        
        self.fruit = fruits
        fruitLabel.text = fruit?.fruitName.capitalized
        //videoImage.image = UIImage(named: "\(self.signs.signNumber)")
        
    }
    
    

}
