//
//  SentencesCollectionView.swift
//  
//
//  Created by Jackie on 4/6/20.
//

import UIKit

class SentencesCollectionView: UICollectionView, UISearchDisplayDelegate, UISearchBarDelegate {
    
    private let reuseIdentifier = "sentenceCell"
    

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let sectionInsets = UIEdgeInsets(top: 50.0,
    left: 20.0,
    bottom: 50.0,
    right: 20.0)

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
