//
//  SentencesViewController.swift
//  LASDictionaryV2
//
//  Created by Jackie on 4/7/20.
//  Copyright © 2020 LAS. All rights reserved.
//

import UIKit

class SentencesViewController: UIViewController, UISearchDisplayDelegate, UISearchBarDelegate {
    
    var filteredSigns = [Signs]()
    let searchController = UISearchController(searchResultsController: nil)

    
    @IBOutlet weak var searchBar: UISearchBar!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
