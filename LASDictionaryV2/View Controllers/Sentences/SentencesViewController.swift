//
//  SentencesViewController.swift
//  LASDictionaryV2
//
//  Created by Jackie on 10/19/20.
//  Copyright © 2020 LAS. All rights reserved.
//

import UIKit

class SentencesViewController: UIViewController {
   
    var sentences: [Signs] = []
    var sign: [Signs] = []
    
   
    let searchController = UISearchController(searchResultsController: nil)
    var inSearchMode = false

    
   
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 1 is a property on UISearchController that conforms to the new protocol, UISearchResultsUpdating. With this protocol, UISearchResultsUpdating will inform your class of any text changes within the UISearchBar.
        searchController.searchResultsUpdater = self
        // 2 obscures the view controller containing the information you’re searching. This is useful if you’re using another view controller for your searchResultsController. In this instance, you’ve set the current view to show the results, so you don’t want to obscure your view.
        searchController.obscuresBackgroundDuringPresentation = false
        // 3
        searchController.searchBar.placeholder = "Search Sentencces"
        // 4
        navigationItem.searchController = searchController
        // 5
        definesPresentationContext = true
        
    }
 
    
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      
      if let indexPath = tableView.indexPathForSelectedRow {
        tableView.deselectRow(at: indexPath, animated: true)
      }
    }
    
   
    //MARK: - Search Bar stuff
    
//    var isSearchBarEmpty: Bool {
//        return searchController.searchBar.text?.isEmpty ?? true
//    }
//    
//    func filterContentForSearchText(_ searchText: String) {
//        sentences = sign.filter
//        return sentence.signName.lowercased()
//    }
    

}

//MARK: - Table View Stuff

extension SentencesViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return sign.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "sentencesCell", for: indexPath) as! SentencesTableViewCell
    let sentence = sign[indexPath.row]
    cell.textLabel?.text = sentence.signName
    //cell.detailTextLabel?.text = candy.category.rawValue
    return cell
  }
}


extension SentencesViewController: UISearchResultsUpdating {
  func updateSearchResults(for searchController: UISearchController) {
    // TODO
  }
}



//
//
//
//class SentencesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, UISearchDisplayDelegate {
//
//
//
//
//    var signs = [Signs]()
//    var signsSearch: [Signs] = []
//    let searchController = UISearchController(searchResultsController: nil)
//    var inSearchMode = false
//
//
//
//    @IBOutlet weak var searchBar: UISearchBar!
//
//    @IBOutlet weak var tableView: UITableView!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        tableView.delegate = self
//        tableView.dataSource = self
//        searchBar.delegate = self
//        searchBar.returnKeyType = UIReturnKeyType.done
//        //searchBar.endEditing(true)
//       //searchBar.searchTextField.textColor = .init(red: 46/255, green: 42/255, blue: 177/255, alpha: 1)
//
//        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.init(red: 45/255, green: 46/255, blue: 60/255, alpha: 1)]
//        navigationController?.navigationBar.titleTextAttributes = textAttributes
//    }
//
//
//
//    //should i break up the signName into a few different categories? Like parts of sentence: subject, predicate,  direct object, indirect object, subject complement
//
////    func searchBar(_searchBar: UISearchBar, textDidChange searchText: String) {
////
////        let searArr = searchText.lowercased().components(separatedBy: " ")
////        signsSearch = signs.filter {
////            item in
////            let lowName = item.signName.lowercased()
////            //let lowName = DataStore.instance.signs//.filter{$0.signName.range(of: searchBar.text!, options: .forcedOrdering) != nil}
////            let res = searArr.filter {
////                lowName.contains($0)
////            }
////            return !res.isEmpty
////        }
////    }
//
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        if searchBar.text == nil || searchBar.text == "" {
//
//            inSearchMode = false
//            view.endEditing(true)
//            tableView.reloadData()
//        } else {
//            inSearchMode = true
//            signsSearch = DataStore.instance.signs.filter{$0.signName.range(of: searchBar.text!, options: .forcedOrdering) != nil} //options: .caseInsensitive) != nil}
//
//            tableView.reloadData()
//        }
//
//
//    }
//
//
//    func filterContentForSearchText(_ searchText: String
//                                    //, scope: String = ""
//    ) {
//
//        signsSearch = DataStore.instance.signs.filter({(signs : Signs) -> Bool in return signs.signName.lowercased().contains(searchText)//.lowercased().contains(searchText.lowercased())
//
//        })
//        tableView.reloadData()
//    }
//
//
//
//    func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//
//        return 1
//    }
//
//
//
//
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        if inSearchMode {
//            return signsSearch.count
//        }
//
////        return signsArray.count. returning 0 makes it so only shows results when typing in the search box.
//        return 0
//    }
//
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "sentencesCell", for: indexPath) as! SentencesTableViewCell
//        //added as signtableviewcell. if crashes, try to fix, or remove. Worked fine without it
//
//        let sign: Signs
//
//        if inSearchMode {
//            sign = signsSearch[indexPath.row]
//        } else {
//            sign = DataStore.instance.signs[indexPath.row]
//        }
//
//        cell.configureSententesCell(signs: sign)
////        cell.accessoryType = .detailDisclosureButton
//
//        return cell
//    }
//
//
//
//
//
//}
//
//extension SentencesViewController: UISearchResultsUpdating {
//    func updateSearchResults(for searchController: UISearchController) {
//        filterContentForSearchText(searchController.searchBar.text!)
//    }
//}
//
