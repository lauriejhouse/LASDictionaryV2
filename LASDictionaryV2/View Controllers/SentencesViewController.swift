//
//  SentencesViewController.swift
//  LASDictionaryV2
//
//  Created by Jackie on 4/7/20.
//  Copyright © 2020 LAS. All rights reserved.
//

import UIKit
//going to try and be able to combine the two sentences VCs. Like how the MainVC is done.
class SentencesViewController: UIViewController, UISearchDisplayDelegate, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource {
   
    
    
    var filteredSigns = [Signs]()
     var inSearchMode = false
    let searchController = UISearchController(searchResultsController: nil)

    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
   

    

    override func viewDidLoad() {
           super.viewDidLoad()
           tableView.delegate = self
           tableView.dataSource = self
           searchBar.delegate = self
           searchBar.returnKeyType = UIReturnKeyType.done
           //searchBar.endEditing(true)
          //searchBar.searchTextField.textColor = .init(red: 46/255, green: 42/255, blue: 177/255, alpha: 1)
           
           let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.init(red: 45/255, green: 46/255, blue: 60/255, alpha: 1)]
           navigationController?.navigationBar.titleTextAttributes = textAttributes
           
           
       }



           
           // MARK: - Search Bar

           func searchBarIsEmpty() -> Bool {
               //Returns true if empty or nil
               
               return searchController.searchBar.text?.isEmpty ?? true
           }
           
           func filterContentForSearchText(_ searchText: String
                                           //, scope: String = ""
           ) {
               
               filteredSigns = DataStore.instance.signs.filter({(signs : Signs) -> Bool in return signs.signName.lowercased().contains(searchText)//.lowercased().contains(searchText.lowercased())
                   
               })
               tableView.reloadData()
           }
           
           func searchBarSearchButtonClicked(_ searchBar: UISearchBar)
           {
               inSearchMode = false
               self.searchBar.endEditing(true)
           }
           
//           //ORIGNAL SEARCH BAR
//           func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//               if searchBar.text == nil || searchBar.text == "" {
//                   inSearchMode = false
//                   view.endEditing(true)
//                   tableView.reloadData()
//               } else {
//                   inSearchMode = true
//                   filteredSigns = DataStore.instance.signs.filter{$0.signName.range(of: searchBar.text!, options: .forcedOrdering) != nil} //options: .caseInsensitive) != nil}
//
//                   tableView.reloadData()
//               }
//           }
          
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //let words = searchText.components(separatedBy: " ")
        
        // showLinks is a function I make to display the words in buttons as they are searched for.
        //showLinks(forWords: words)
        
        //adding the orignal code to the modified
        if searchBar.text == nil || searchBar.text == "" {
            inSearchMode = false
            view.endEditing(true)
            tableView.reloadData()
        } else {
            inSearchMode = true
            filteredSigns = DataStore.instance.signs.filter{$0.signName.range(of: searchBar.text!, options: .forcedOrdering) != nil}
            tableView.reloadData()
        }
    }
           
    
    func showLinks (forWords: Signs) {
        //every time a search term is entered into the search bar it shows the corresponding link. That works as a popover for showing the video?
    }
           
           func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
               print("search button tapped")
           }
           
    
    
    
      // MARK: - Navigation

        //4/10/2020 - will need ot change this so it links up to the sentences "detail" view, or collection view, some view that displays all the saved videos.
    
    
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "sentences", let controller = (segue.destination as? UINavigationController)?.topViewController as? SentencesDetailViewController {
                if let indexPath = tableView.indexPathForSelectedRow {

                    let sign: Signs
                    if inSearchMode {
                        sign = filteredSigns[indexPath.row]
                    } else {
                        sign = DataStore.instance.signs[indexPath.row]
                    }
    //                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                  //   let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController

                    //Dictionary button view, is dictionarytableview, the main table view click on is detail view. maybe need another segue with button.


                    controller.signs = sign
                    controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                    controller.navigationItem.leftItemsSupplementBackButton = true
                }
            }
        }
    
    

        
        
        

        // MARK: - Table view data source

        func numberOfSections(in tableView: UITableView) -> Int {
            // #warning Incomplete implementation, return the number of sections
            
            return 1
        }
       
     
        
        
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            // #warning Incomplete implementation, return the number of rows
            if inSearchMode {
                return filteredSigns.count
            }

    //        return signsArray.count. returning 0 makes it so only shows results when typing in the search box.
            return 0
        }


        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "sentencesTableCell", for: indexPath) as! SentencesTableViewCell
            //added as signtableviewcell. if crashes, try to fix, or remove. Worked fine without it

            let sign: Signs

            if inSearchMode {
                sign = filteredSigns[indexPath.row]
            } else {
                sign = DataStore.instance.signs[indexPath.row]
            }

            cell.configureTableCell(signs: sign)
    //        cell.accessoryType = .detailDisclosureButton

            return cell
        }
        

}



extension SentencesViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
}