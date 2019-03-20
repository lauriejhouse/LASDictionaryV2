//
//  DictionaryTableViewController.swift
//  LASDictionaryV2
//
//  Created by Jackie on 3/11/19.
//  Copyright © 2019 LAS. All rights reserved.
//

import UIKit

class DictionaryTableViewController: UITableViewController {
    
    var signs = [Signs]()
//    var signsArray = [Signs]()
    var filteredSigns = [Signs]()
    var inSearchMode = false
//    var sections = ["A", "B","C", "D", "E","F", "G","H", "I","J", "K","L","M", "N","O", "P","Q", "R","S", "T","U", "V","A", "W","X", "Y", "Z"]
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        parseSignsCSV()
        
    }
    
    
    
    
    
    func parseSignsCSV() {
        let path = Bundle.main.path(forResource: "signs", ofType: "csv")!
        do {
            let csv = try CSV(contentsOfURL: path)
            let rows = csv.rows
            //            print(rows)
            for row in rows {
                let pokeId = Int(row["id"]!)!
                let name = row["identifier"]!
                
                let poke = Signs(name: name, number: pokeId)
                signs.append(poke)
            }
            
            
            
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return signs.count
//        return 26
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return signs.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dictionaryCell", for: indexPath) as! DictionaryTableViewCell

        let poke = signs[indexPath.row]
//        let poke = signs[indexPath.section][indexPath.row]

        cell.configureDictionaryTableCell(signs: poke)
        
        return cell
    }
    
    
    //adding abcs on the right hand side of the iphone.
//    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
//        return sections.count
//    }
    
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "This is a section"
//    }

    
    //    For making dictionary non static later - trying to get it to work like the search portion does, going to 'detail view'

//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "showDictionary" {
////            if let indexPath = tableView.indexPathForSelectedRow {
////
////                let sign: Signs
////                if inSearchMode {
////                    sign = filteredSigns[indexPath.row]
////                } else {
////                    sign = signs[indexPath.row]
////                }
////                let controller = (segue.destination as! UINavigationController).topViewController as! DictionaryDetailViewController
////
////
////                controller.signsDictoinary = sign
////                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
////                controller.navigationItem.leftItemsSupplementBackButton = true
////            }
//        }
//    }
    
    

}


