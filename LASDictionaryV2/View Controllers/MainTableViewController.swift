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
 
 1. Favorites Menu/Button - put it in cell like in LBTA - Done.
 2. Sort/List dictionary table in ABC order/seperated by letters like in LBTA. - Done

 

 1. Going to have to get video view up and going and firebase stuff back up and running.
 2. OED API? Cross reference whats in FM vs OED? - in the excel sheet words with descritpion are in the database. Figure out how to seperate the two. CSV for LAS signs/words. API for the OED other. - But i need to get rid of duplicates/figure out which are duplicates
 Remove all Words that don't have a descritpoin from excel file - those are the OED words. Use JSON for LAS words. And AlamoFire and OED API 6/2/19 - words are seperated. 6/4-2019 - Maybe not be able to use API because of client issues on OED API.
 
 
 4. Need to seperate/pull the letters from the csv, and put them into another cvs.
 
 5. DUPILCATE SIGNS. SOME LOWERCASE, SOME PROPER CASE! 6/11/19 - DELETE ALL LOWERCASE DUPLICATES. Keeping the Proper cap oens. 7/11/19 - this has been done by Becca, just need to put the new csv/json file in. - Fixed
 
 6. ***If no video, have default image show of 'video coming soon'?
 
 7. Need to get Dicitonary tab up and running - can pull code from V2, or modify this code in V4. - Done
 8. Need 'button'/tab to change to other languages???? I'm not sure if we were still doing this. - 6/11/19 - still doing this. Will need to seperate the CSV file for other languages. 6/24/19 - LAS = de ja vu (anglizied words), other languages like Latin will have the other languages tabs.
 9. Need seperate baby signs searchController and VC. Also need seperate JSON for that.
 
 10. Improve tab bar images to better reflect the LAS app, as well as a possible color scheme?
 11. Add offline viewiong/download of videos incase people don't have wifi access.
 
 
 12. If doing other lagnuages/ for the different alphabets can use soemthing similar to LBTA podcast lesson 7; where it lists the podcast name and picture with how many episodes in each. the LAS version would list alphabet language, with how many 'words'/letters are in each one.
 
 13. Use swipe away navigation (Youtube LBTA) to go from playing video back to selection? Make the App cooler instead of with a standard back button.
 
 14. Full screen videos.
 
 To be built waaay later.
 14. Have a sentences section.
 15. Also need a quiz section - see if possible - QuizLAS - Add favorited signs into quiz section. - seperate mini app so main LAS app doesn't get bogged down. can use practice sentences here too.
 
 16. ABLITY TO DOWNLOAD VIDEOS FOR OFFLINE VIEWING?
 
 
 ***** New email for LAS signs that need to be added to the app. For questions, corrections, signs they want added. General support email for the app.  - Use instabug for bug reports/features. - customer support/information tab.
 
 
 BETA BY MARCH if possible

 WHY WAS I DOING PROGMATIC RESTRUCTURE? To have more control over it, but now I'm stuck at the video part of it and can't get it to work correctly. I need to add teh video view to somewhere. Or maybe add a view controller nib/xib file. Going back to V2 to work on that some more since it works fine. And I'll go back to V4 to try some more in a few days. Going to get the favorite function working.
 
 // 7/22/19 - maybe make the tab bar controller progmatically? Just the tab bar part.
 
 7/31/19 - SUDDENLY THE KEYBOARD WON'T GO AWAY IN SIMULATOR when on search bar. - fixed? with hitting the done + a function.
  - when going back to search after adding/going to favorites VC, the search bar is still up, burt the incorrect words are displayed. the visable search is still there, but the words when clicked on have been reset to default/first ABC orderd words. - need to figure out a way to Clear/refresh the main table view
 
 ***** DON'T NEED TO DO BADGES IF I CAN'T GET IT TO WORK RIGHT AWAY! FOCUS ON WHY THE DETAIL VIEW FOR SIGS ISN'T WORKING!!!
 

 */


// 9/10/19 - added datasource 'target' by right clicking and ctrl dragging from tableView on storyboard to first yellow/white box.


class MainTableViewController: UIViewController, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource, UITabBarDelegate {
    
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
    }
    

    
    // MARK: - Search Bar

    func searchBarIsEmpty() -> Bool {
        //Returns true if empty or nil
        
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        filteredSigns = DataStore.instance.signs.filter({(signs : Signs) -> Bool in return signs.signName.lowercased().contains(searchText.lowercased())
            
        })
        tableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar)
    {
        inSearchMode = false
        self.searchBar.endEditing(true)
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == "" {
            inSearchMode = false
            view.endEditing(true)
            tableView.reloadData()
        } else {
            inSearchMode = true
            filteredSigns = DataStore.instance.signs.filter{$0.signName.range(of: searchBar.text!, options: .caseInsensitive) != nil}
            
            tableView.reloadData()
        }
    }
    
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

