//
//  DictionaryTableViewController.swift
//  LASDictionaryV2
//
//  Created by Jackie on 3/11/19.
//  Copyright © 2019 LAS. All rights reserved.
//

import UIKit
import Foundation

//https://makeapppie.com/2015/02/17/swift-swift-tutorials-introducing-table-views/ tutorial for how to do sections. Also look at LBTA sections/contacts tutorial.


/*
 https://stackoverflow.com/questions/54548519/swift-how-to-configure-a-tableview-with-multiple-sections-dynamically-using-jso
 https://stackoverflow.com/questions/44877074/display-data-from-json-in-alphabetical-sections-in-table-view-in-swift
 https://stackoverflow.com/questions/53256086/handling-json-with-alamofire-swiftyjson-and-adding-to-uitableview-in-swift
 */
class DictionaryTableViewController: UITableViewController {
    
    //original
    var signs = [Signs]()
    
    
    //var signs = [[String: [Signs]]]()
    var cars = [String]()
    var signsDictionary = [String: [String]]()
    //var signSectionTitles = [String]()
    var signSectionTitles = ["A", "B","C", "D", "E","F", "G","H", "I","J", "K","L","M", "N","O", "P","Q", "R","S", "T","U", "V","A", "W","X", "Y", "Z"]
    


    var filteredSigns = [Signs]()
    var inSearchMode = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        parseJSONSignDictionary()
        
    
        
        //cars = [Signs]
        for car in signSectionTitles {


            let carKey = String(car.prefix(1))
                if var carValues = signsDictionary[carKey] {
                    carValues.append(car)
                    signsDictionary[carKey] = carValues
                } else {
                    signsDictionary[carKey] = [car]
                }
        }
        
        // 2The keys of the carsDictionary are sorted by alphabetical order.

        signSectionTitles = [String](signsDictionary.keys)
        signSectionTitles = signSectionTitles.sorted(by: { $0 < $1 })
        
        
        
        
        
       //https://stackoverflow.com/questions/39565272/uitableview-with-alphabetical-index-swift
       //9/30/19 - kinda got working. doesn't display them sorted correctly
//            sectionsArray.sort { $0 < $1 }
//                      var index = 0;
//          // for ( var i = 0; i < sectionsArray.count; i++ )
//        for i in 0..<(sectionsArray.count - 1)
//           {
//
//               let commonPrefix = sectionsArray[i].commonPrefix(with: sectionsArray[index], options: .caseInsensitive)
//
//
//            if (commonPrefix.count == 0 ) {
//
//                   let string = sectionsArray[index].uppercased();
//
//                   let firstCharacter = string[string.startIndex]
//
//                   let title = "\(firstCharacter)"
//
//                   let newSection = (index: index, length: i - index, title: title)
//
//                   sections.append(newSection)
//
//                   index = i;
//
//               }
//
//           }
        
        
            
        
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
        
        return signSectionTitles.count
        
        
        //original
        //return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        //original
        //return signs.count
        
      
        
        let carKey = signSectionTitles[section]
                if let carValues = signsDictionary[carKey] {
                    return carValues.count
                }
                    
                return 0

    }
    
   
    
    

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

        //need to put abc section titles here.
            return signSectionTitles[section]
        //return sections[section].name

    }
    

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dictionaryCell", for: indexPath) as! DictionaryTableViewCell

        let sign = signs[indexPath.row]

        cell.configureDictionaryTableCell(signs: sign)
        //cell.textLabel?.text = sectionsArray[sections[indexPath.section].index + indexPath.row]
        
        let carKey = signSectionTitles[indexPath.section]
                 if let carValues = signsDictionary[carKey] {
                     cell.textLabel?.text = carValues[indexPath.row]
                 }

        return cell


    }
    
    
//This puts the indexed abc's on the right side of the screen
     override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
           return signSectionTitles
       }

   
//
    override func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {

        return index

    }
    



    

    
    
}


