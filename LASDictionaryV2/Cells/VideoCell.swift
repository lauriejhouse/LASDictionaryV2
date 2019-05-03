//
//  VideoCell.swift
//  LASDictionaryV2
//
//  Created by Jackie on 3/27/19.
//  Copyright © 2019 LAS. All rights reserved.
//

import UIKit

class VideoCell: UICollectionViewCell {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //custom logic goes here
        
    }
    
    let thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.blue
        return imageView
    }()
    
    //might not need setup view since using storyboard.
    func setupViews() {
        
    
        addSubview(thumbnailImageView)
        thumbnailImageView.frame  = CGRect(x: 0, y: 0, width: 100, height: 100)
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
