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
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return signs.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dictionaryCell", for: indexPath) as! DictionaryTableViewCell

        let poke = signs[indexPath.row]
        cell.configureDictionaryTableCell(signs: poke)
        
        return cell
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDictionary" {
         
            
    }
    }
    
    

}


