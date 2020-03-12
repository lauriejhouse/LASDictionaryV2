//
//  MainTableViewController.swift
//  LASDictionaryV2
//
//  Created by Jackie on 2/27/19.
//  Copyright © 2019 LAS. All rights reserved.
//

import UIKit

class MainTableViewController: UIViewController, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource, UITabBarDelegate, UISearchDisplayDelegate {
    
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
    
    //ORIGNAL SEARCH BAR
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == "" {
            inSearchMode = false
            view.endEditing(true)
            tableView.reloadData()
        } else {
            inSearchMode = true
            filteredSigns = DataStore.instance.signs.filter{$0.signName.range(of: searchBar.text!, options: .forcedOrdering) != nil} //options: .caseInsensitive) != nil}

            tableView.reloadData()
        }
    }
    
    
    //modified search bar
//         func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//            // filteredData here is the result, data is the local array
//            filteredData = searchText.isEmpty ? data : data.filter { (item: String) -> Bool in
//
//            //filteredSigns = searchText.isEmpty ? DataStore.instance.signs : DataStore.instance.signs.filter { (item: String) -> Bool in
//        //filteredSigns = DataStore.instance.signs.filter{$0.signName.range(of: searchBar.text!, options: .caseInsensitive) != nil}
//
//                // If dataItem matches the searchText, return true to include it
//                return item.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
//            }
//            // Reload UI element as per your requirement
//        }
    
    
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        print("search button tapped")
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! SignTableViewCell
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
    


    
    // MARK: - Navigation

    //7-15-19 - going to need to also link/use this to go from favorite cell to detailVC?
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail", let controller = (segue.destination as? UINavigationController)?.topViewController as? DetailViewController {
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
    

    
   

}

extension MainTableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
}

