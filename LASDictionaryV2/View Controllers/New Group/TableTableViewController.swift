//
//  TableTableViewController.swift
//  LASDictionaryV2
//
//  Created by Jackie Norstrom on 8/5/20.
//  Copyright © 2020 LAS. All rights reserved.
//

import UIKit

class TableTableViewController: UITableViewController {
    
    
    
    
    let alphabetsArray = [
        
           Alphabets(isoCode: "lsf", name: "Aa"),
           Alphabets(isoCode: "lsf", name: "Bb"),
           Alphabets(isoCode: "lsf", name: "Cc"),
           Alphabets(isoCode: "lsf", name: "Dd"),
           Alphabets(isoCode: "lsf", name: "Ee"),
           Alphabets(isoCode: "lsf", name: "Ff"),
           Alphabets(isoCode: "lsf", name: "Gg"),
           Alphabets(isoCode: "see", name: "Aa"),
           Alphabets(isoCode: "see", name: "Bb"),
           Alphabets(isoCode: "see", name: "Cc"),
           Alphabets(isoCode: "see", name: "Dd"),
           Alphabets(isoCode: "see", name: "Ee")

       ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
    
        
    }
    
    let sectionTitles = [
          "French",
          "English",
          "Spanish",
          "Uncatagorized"
      ]
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        
        return sectionTitles.count
    }
  
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return sectionTitles.count
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let alphabet = alphabetsArray[indexPath.row]

        let cell = tableView.dequeueReusableCell(withIdentifier: "labelCell", for: indexPath)
        
        cell.textLabel?.text = alphabet.name

        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        guard sectionTitles.indices ~= section else {
                  print("No section title for this section")
                  return nil
              }

        return sectionTitles[section]
          }
        
        //need to get the index path of the iso name for the alphabets.
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


