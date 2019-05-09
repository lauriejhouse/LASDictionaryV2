//
//  MainTableViewController.swift
//  LASDictionaryV2
//
//  Created by Jackie on 2/27/19.
//  Copyright © 2019 LAS. All rights reserved.
//

import UIKit

//Alter search results? Or make it so you don't have to type capitqlized. or it searches for the middle of the word?
//need to display search relsuts only when typing. else show blank ui table view. - is that possible
//https://guides.codepath.com/ios/Search-Bar-Guide#overview  -  Notice that the search results are displayed in the same table, and there is no presentation of a separate search interface


/* TO DO
 
 1. Favorites Menu/Button - put it in cell like in LBTA
 2. Sort/List dictionary table in ABC order/seperated by letters like in LBTA.
 3.
 
 
 THINGS TO CONSIDER:
 
 ** Should I change to all progmatic? - that would be LAS v3.
 ** OED API!!! Use that for the dictionary part, and use a 'static' json file for the LAS database stuff?
 */


 //****** NAMES OF VIDEO AND JSON/FIREBASE/SIGN NAME HAVE TO BE THE SAME OR IT CRASHES*****

class MainTableViewController: UIViewController, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource, UITabBarDelegate {
    
    var signsArray = [Signs]()
    var filteredSigns = [Signs]()
    var inSearchMode = false
    
    @IBAction func dictionaryButton(_ sender: Any) {
         performSegue(withIdentifier: "showDetail", sender: self)
    }
    let searchController = UISearchController(searchResultsController: nil)

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!

    @IBAction func favoritesButton(_ sender: Any) {
        performSegue(withIdentifier: "showFavorites", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        searchBar.returnKeyType = UIReturnKeyType.done
        
        parseJSONSignDictionary()
        

    }
    
    
    
 
    
    
    
    //allows the signs to show up in teh table, pulled from teh csv file.
    func parseJSONSignDictionary() {
        
//        if let url = Bundle.main.url(forResource: "LASsignsJSON", withExtension: "json") {
            if let url = Bundle.main.url(forResource: "csvjson", withExtension: "json") {
            do {
                let date = Date()
                let data = try Data(contentsOf: url)
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
                    
                    (json["results"] as? [[String:Any]])?.forEach { j in
                        if let name = j["identifier"] as? String, let id = j["id"] as? Int {
//                        if let name = j["Sign Name"] as? String, let id = j["id"] as? Int {

                            let sign = Signs(name: name, number: id)
                            signsArray.append(sign)
                        }
                    }
                    
                }
                print("Took", Date().timeIntervalSince(date))
            } catch {
                print(error.localizedDescription)
            }
        }
        
    }
    
    
    // MARK: - Search Bar

    func searchBarIsEmpty() -> Bool {
        //Returns true if empty or nil
        
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        filteredSigns = signsArray.filter({(signs : Signs) -> Bool in return signs.signName.lowercased().contains(searchText.lowercased())
            
        })
        tableView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == "" {
            inSearchMode = false
            view.endEditing(true)
            tableView.reloadData()
        } else {
            inSearchMode = true
            filteredSigns = signsArray.filter{$0.signName.range(of: searchBar.text!) != nil}
            
            tableView.reloadData()
        }
    }
    
//    func isFiltering() -> Bool {
//        return searchController.isActive && !searchBarIsEmpty()
//    }
    
    

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
            sign = signsArray[indexPath.row]
        }
        //using configure cell instead of this. change back to this if it doesn;t work.
//        cell.textLabel!.text = sign.signName
//        cell.detailTextLabel!.text = candy.category
        cell.configureTableCell(signs: sign)
        return cell
    }
    
  
  
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    //This shows the dictionary view, that just lists the words. Static for now.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail", let controller = (segue.destination as? UINavigationController)?.topViewController as? DetailViewController {
            if let indexPath = tableView.indexPathForSelectedRow {

                let sign: Signs
                if inSearchMode {
                    sign = filteredSigns[indexPath.row]
                } else {
                    sign = signsArray[indexPath.row]
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
