//
//  CollapsableTableViewCelll.swift
//  LASDictionaryV2
//
//  Created by Jackie on 6/17/20.
//  Copyright © 2020 LAS. All rights reserved.
//
import UIKit
class CollapsibleTableViewCell: UITableViewCell {
    //this is all done progmatically.
    let nameLabel = UILabel()
    var index: Int!

    
    // MARK: Initalizers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let marginGuide = contentView.layoutMarginsGuide
        
        

        // configure nameLabel
        contentView.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
        nameLabel.topAnchor.constraint(equalTo: marginGuide.topAnchor).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        nameLabel.numberOfLines = 0
        nameLabel.font = UIFont.systemFont(ofSize: 16)

      

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
   
}
