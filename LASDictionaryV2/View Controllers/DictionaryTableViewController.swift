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
    
    
    var signsDictionary = [String: [String]]()
    var signsSectionTitles = [String]()
    //this one maybe changed to the original var signs, and change from string ot any?
    var signsArray = [String]()
    



    var filteredSigns = [Signs]()
    var inSearchMode = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
       //parseJSONSignDictionary()
        signsArray = ["Audi", "Aston Martin","BMW", "Bugatti", "Bentley","Chevrolet", "Cadillac","Dodge","Ferrari", "Ford","Honda","Jaguar","Lamborghini","Mercedes", "Mazda","Nissan","Porsche","Rolls Royce","Toyota","Volkswagen", "Zebra"]
           for car in signsArray {
             let carKey = String(car.prefix(1))
                 if var carValues = signsDictionary[carKey] {
                     carValues.append(car)
                     signsDictionary[carKey] = carValues
                 } else {
                     signsDictionary[carKey] = [car]
                 }
         }
        
        signsSectionTitles = [String](signsDictionary.keys)
           signsSectionTitles = signsSectionTitles.sorted(by: { $0 < $1 })

    }
    
    
    
   
     
    

    



    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        
        
        
        return signsSectionTitles.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
       let carKey = signsSectionTitles[section]
            if let carValues = signsDictionary[carKey] {
                return carValues.count
            }
                
            return 0
        }
    
   

    

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "dictionaryCell", for: indexPath) as! DictionaryTableViewCell

      let cell = tableView.dequeueReusableCell(withIdentifier: "dictionaryCell", for: indexPath)
             
           // Configure the cell...
           let carKey = signsSectionTitles[indexPath.section]
           if let carValues = signsDictionary[carKey] {
               cell.textLabel?.text = carValues[indexPath.row]
           }

           return cell
       }

    


    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
           return signsSectionTitles[section]
       }
       
      override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
           return signsSectionTitles
       }
    

    
    
}


