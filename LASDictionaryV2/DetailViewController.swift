//
//  DetailViewController.swift
//  LASDictionaryV2
//
//  Created by Jackie on 2/28/19.
//  Copyright © 2019 LAS. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class DetailViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var signDetailNameLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    //Not sure which type of array..thing I need, or what one does what still. So will use both until I figure out what one does what.
    //https://guides.codepath.com/ios/Using-UITableView - uses the non commented out one.
//    var signsArray = [Signs]()
    var signs: Signs!
    var player: AVPlayer!
 
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        //safe unwrapping
        if let label = signDetailNameLabel
        {
            label.text = signs?.signName
        }
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
//    private let reuseIdentifier = "cellId"

    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! VideoCell
        
//        cell.backgroundColor = UIColor.red
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
    }
    
    
    
    
    
    
    
    
    
}
