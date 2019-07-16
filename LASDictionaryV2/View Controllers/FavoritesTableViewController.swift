//
//  FavoritesTableViewController.swift
//  LASDictionaryV2
//
//  Created by Jackie on 6/27/19.
//  Copyright © 2019 LAS. All rights reserved.
//

import UIKit

class FavoritesTableViewController: UITableViewController {
    
    
    var favoriteSigns = UserDefaults.standard.savedSigns()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let gesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress))
        tableView.addGestureRecognizer(gesture)
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        favoriteSigns = UserDefaults.standard.savedSigns()
        tableView.reloadData()
        if let tabItems = tabBarController?.tabBar.items {
            let tabItem = tabItems[1]
            tabItem.badgeValue = nil
        }
    }

    
    
    // MARK: - Table view data source
    
    @objc func handleLongPress(gesture: UILongPressGestureRecognizer) {
        let location = gesture.location(in: tableView)
        guard let selectedIndexPath = tableView.indexPathForRow(at: location) else {return}
        print(selectedIndexPath.row)
        
        let alertController = UIAlertController(title: "Remove Favorited Sign?", message: nil, preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "Yes", style: .destructive, handler: { (_) in
            //where we remvove the sign/favorite from table
            let selectedSign = self.favoriteSigns[selectedIndexPath.row]
                self.favoriteSigns.remove(at: selectedIndexPath.row)
               self.tableView.deleteRows(at: [selectedIndexPath], with: .automatic)
            UserDefaults.standard.deletePodcast(sign: selectedSign)

           

        }))
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel ))
        
        present(alertController, animated: true)
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
      
        
        return favoriteSigns.count
    }
    
    
   

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favoriteCell", for: indexPath) as! FavoritesTableViewCell

            cell.sign = self.favoriteSigns[indexPath.row]
        
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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

    //7-15-19 - trying to segue from favorites table view to detailView. - it takes me to the correct view, but its not loading anything. - maybe i'll make a seperate/but the same view for the saved signs.
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showFavroiteDetail", let controller = (segue.destination as? UINavigationController)?.topViewController as? DetailViewController {
            if let indexPath = tableView.indexPathForSelectedRow {
                
                let sign: Signs
//                if inSearchMode {
//                    sign = favoriteSigns[indexPath.row]
//                } else {
//                    sign = favoriteSigns[indexPath.row]
//                }
                sign = favoriteSigns[indexPath.row]
                
                
                //Dictionary button view, is dictionarytableview, the main table view click on is detail view. maybe need another segue with button.
                
                
                controller.signs = sign
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }
    

}
