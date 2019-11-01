//
//  FavoritesTableViewController.swift
//  LASDictionaryV2
//
//  Created by Jackie on 6/27/19.
//  Copyright © 2019 LAS. All rights reserved.
//

import UIKit

class FavoritesTableViewController: UITableViewController, UITabBarDelegate {
    
    
    var favoriteSavedSigns = UserDefaults.standard.savedSigns()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        let gesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress))
        tableView.addGestureRecognizer(gesture)
    
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        favoriteSavedSigns = UserDefaults.standard.savedSigns()
        tableView.reloadData()
        
//        if let tabItems = tabBarController?.tabBar.items {
//            let tabItem = tabItems[1]
//            tabItem.badgeValue = nil
//        }
        
    }


    
    // MARK: - Table view data source
    
    @objc func handleLongPress(gesture: UILongPressGestureRecognizer) {
        let location = gesture.location(in: tableView)
        guard let selectedIndexPath = tableView.indexPathForRow(at: location) else {return}
        print(selectedIndexPath.row)
        
        //add in the ability for the name of the favorited sign to pop up when wanting to delete it.
        let alertController = UIAlertController(title: "Remove Favorited Sign?", message: nil, preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "Yes", style: .destructive, handler: { (_) in
            //where we remvove the sign/favorite from table
            let selectedSign = self.favoriteSavedSigns[selectedIndexPath.row]
                self.favoriteSavedSigns.remove(at: selectedIndexPath.row)
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

        return favoriteSavedSigns.count
    }
    
    
   

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favoriteCell", for: indexPath) as! FavoritesTableViewCell

            cell.sign = self.favoriteSavedSigns[indexPath.row]
        
        return cell
    }
 

   

  


    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "favoriteDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let controller = segue.destination as? FavoriteDetailViewController
                controller?.signs = favoriteSavedSigns[indexPath.row]
            }
        }
    }


    


    
    
    
    
}
