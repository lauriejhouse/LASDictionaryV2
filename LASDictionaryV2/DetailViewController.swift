//
//  DetailViewController.swift
//  LASDictionaryV2
//
//  Created by Jackie on 2/28/19.
//  Copyright © 2019 LAS. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var signDetailNameLabel: UILabel!
    @IBOutlet weak var signImage: UIImageView!
    
    var detailSign: Signs? {
        didSet {
            configureView()
        }
    }
 
    func configureView() {
        if let detailSign = detailSign {
            if let signDetailNameLabel = signDetailNameLabel, let signImage = signImage/*,  TODO: ADD IMAGE VIEW FOR SIGN let candyImageView = candyImageView */
            {
                signDetailNameLabel.text = detailSign.signName
                signImage.image = UIImage(named: "\(detailSign.signNumber)")
                title = detailSign.signName
                
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    
}
