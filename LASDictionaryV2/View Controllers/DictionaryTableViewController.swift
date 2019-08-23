//
//  DictionaryTableViewController.swift
//  LASDictionaryV2
//
//  Created by Jackie on 3/11/19.
//  Copyright © 2019 LAS. All rights reserved.
//

import UIKit

//https://makeapppie.com/2015/02/17/swift-swift-tutorials-introducing-table-views/ tutorial for how to do sections. Also look at LBTA sections/contacts tutorial.


/*
 
 https://stackoverflow.com/questions/44877074/display-data-from-json-in-alphabetical-sections-in-table-view-in-swift
 
 */
class DictionaryTableViewController: UITableViewController {
    
    var signs = [Signs]()

    var filteredSigns = [Signs]()
    var inSearchMode = false
//    var sections = ["A", "B","C", "D", "E","F", "G","H", "I","J", "K","L","M", "N","O", "P","Q", "R","S", "T","U", "V","A", "W","X", "Y", "Z"]
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        parseJSONSignDictionary()
        
    }
    
    
    
    
    func parseJSONSignDictionary() {
        
        //        if let url = Bundle.main.url(forResource: "LASsignsJSON", withExtension: "json") {
        if let url = Bundle.main.url(forResource: "csvjson", withExtension: "json") {
            do {
                let date = Date()
                let data = try Data(contentsOf: url)
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
                    
                    (json["results"] as? [[String:Any]])?.forEach { j in
                        if let name = j["identifier"] as? String, let id = j["id"] as? Int {
                        
                            let sign = Signs(name: name, number: id)
                            signs.append(sign)
                        }
                    }
                    
                }
                print("Took", Date().timeIntervalSince(date))
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    



    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        //return sections.count
        
        //return signs.count
        
        //original
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        //original
        return signs.count
        
        //trying to fix sections
       //return signs[section].signName.count
        //return sections.count
        
        //return sections[section].signs.count

    }
    
    
//
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//
//        //need to put abc section titles here.
//        return self.signs[section].signName
//
//        //return sections[section].name
//
//    }
    

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dictionaryCell", for: indexPath) as! DictionaryTableViewCell

        let sign = signs[indexPath.row]

        cell.configureDictionaryTableCell(signs: sign)


        return cell

//        let section = sections[indexPath.section]
//        let report = section.signs[indexPath.row]
//
//        return report
    }

    



    
    //ADDING ABS TO RIGHT SIDE
    
//    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int)  -> UIView? {
//
//        let headerView = UIView()
//
//        headerView.backgroundColor = UIColor.self.init(red: 254/255, green:  170/255, blue: 25/255, alpha: 1.0)
//
//        let headerLabel = UILabel(frame: CGRect(x: 8, y: 5, width: tableView.bounds.size.width, height: tableView.bounds.size.height))
//
//        headerLabel.font = UIFont(name: "Trebuchet MS", size: 15)
//
//        headerLabel.textColor = UIColor.darkGray
//
//        headerLabel.text = self.tableView(self.tableView, titleForHeaderInSection: section)
//
//        headerLabel.sizeToFit()
//
//        headerView.addSubview(headerLabel)
//
//        return headerView
//    }

    
    
}


