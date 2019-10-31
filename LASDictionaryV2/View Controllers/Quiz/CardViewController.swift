//
//  CardViewController.swift
//  LASDictionaryV2
//
//  Created by Jackie on 10/29/19.
//  Copyright © 2019 LAS. All rights reserved.
//

import UIKit


class CardViewController: UIViewController {
    
   static let cardCornerRadious: CGFloat = 25
    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    
    var pageIndex: Int?
    var signCard: SignCard?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = signCard?.name
        cardView.layer.cornerRadius = CardViewController.cardCornerRadious
        cardView.layer.masksToBounds = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if segueIdentifier(for: segue) == .reveal,
         let destinationViewController = segue.destination as? RevealViewController {
        destinationViewController.signCard = signCard
       }
     }
    
    @IBAction func handleTap() {
        performSegue(withIdentifier: .reveal, sender: nil)
    }
    
    
    
}


extension CardViewController: SegueHandlerType {
  enum SegueIdentifier: String {
    case reveal
  }
}
