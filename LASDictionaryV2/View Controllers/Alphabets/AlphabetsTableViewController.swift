//
//  AlphabetsTableViewController.swift
//  LASDictionaryV2
//
//  Created by Jackie on 6/4/20.
//  Copyright © 2020 LAS. All rights reserved.
//

import UIKit

class AlphabetsTableViewController: UITableViewController {
    
    
    //var carsDictionary = [String: [String]]()
    // var alphabetDictionary = [String: [String]]() - this is a dictionary which uses key value pairs.
      
    //var carSectionTitles = [String]()
    //var carSectionTitles = [String]()
    
    //var cars = [String]()
    //var alphabets = [String]()
    
    struct Section {
      var name: String!
      var items: [String]!
      var collapsed: Bool!
        
      init(name: String, items: [String], collapsed: Bool = false) {
        self.name = name
        self.items = items
        self.collapsed = false
      }
    }
        
    var sections = [Section]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //cars = ["Audi", "Aston Martin","BMW", "Bugatti", "Bentley","Chevrolet", "Cadillac","Dodge","Ferrari", "Ford","Honda","Jaguar","Lamborghini","Mercedes", "Mazda","Nissan","Porsche","Rolls Royce","Toyota","Volkswagen" ]
         //cars = ["English", "Spanish","Italian", "EAa", "SBb","ICc", "Ii","Ss","Ee", "Ford","Honda","Jaguar","Lamborghini","Mercedes", "Mazda","Nissan","Porsche","Rolls Royce","Toyota","Volkswagen" ]
        
        //would cars = the different languages. That would make sense?
    
        //1 The first letter is extracted from each car and is used as a key of the carsDictionary. With this key a new array of cars is crated, or when the key exists the car item is appened to the array. [but what about for my app, would it work the same with languages? grab the first letter]
//       for car in cars {
//               let carKey = String(car.prefix(1)) //prefix 1 means that the first letter will be extracted, if it was prefix 2, the second lettr would be extracted?
//                   if var carValues = carsDictionary[carKey] {
//                       carValues.append(car)
//                       carsDictionary[carKey] = carValues
//                   } else {
//                       carsDictionary[carKey] = [car]
//                   }
//           }
//        //2 Keys of the carsDictionary are sorted by alphabetical order
//        carSectionTitles = [String](carsDictionary.keys)
//        carSectionTitles = carSectionTitles.sorted(by: {$0 < $1})
        
        sections = [
            Section(name: "English", items: ["Aa", "Bb", "MacBook Pro", "iMac", "Mac Pro", "Mac mini", "Accessories", "OS X El Capitan"]),
            Section(name: "Spanish", items: ["Aa", "Bb", "iPad mini 4", "Accessories"]),
            Section(name: "Greek", items: ["Αα", "iPhone 6", "iPhone SE", "Accessories"])
        ]
        
    }
    
    

   

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        //1 Number of items in carSectionTitles array will be rutrned in the numberofSections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //2 number of rows based on number of cars in each section index is returned.
//        let carKey = carSectionTitles[section]
//        if let carValues = carsDictionary[carKey] {
//            return carValues.count
//        }
//        return 0
        
        if section == 0 {
            return 1
        }
        
        var count = sections.count
        for section in sections {
            count += section.items.count }
        return count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "title") as UITableViewCell?
            //cell?.textLabel?.text = "Apple"
            return cell!
        }
        
        // Calculate the real section index and row index
        let section = getSectionIndex(indexPath.row)
        let row = getRowIndex(indexPath.row)
        
        if row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "header") as! HeaderCell
            cell.titleLabel!.text = sections[section].name
            cell.toggleButton!.tag = section
            cell.toggleButton!.setTitle(sections[section].collapsed! ? "+" : "-", for: UIControl.State())
            cell.toggleButton!.addTarget(self, action: #selector(AlphabetsTableViewController.toggleCollapse), for: .touchUpInside)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as UITableViewCell?
            cell?.textLabel?.text = sections[section].items[row - 1]
            return cell!
        }
    }

    //ORIGINAL
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        //3For each section index the car name is assigned to the text property of the textLabel property of the current cell.
//        if indexPath.section == 0 {
//            let cell = tableView.dequeueReusableCell(withIdentifier: "title") as UITableViewCell!
//            cell?.textLabel?.text = "Apple"
//            return cell!
//        }
//
//        //calculate real section and row index
//
//        let section = getSectionIndex(indexPath.row)
//        let row = getRowIndex(indexPath.row)
//
//        if row == 0 {
//            let cell = tableView.dequeueReusableCell(withIdentifier: "header") as? HeaderCell
//            cell?.titleLabel?.text = sections[section].name
//            cell?.toggleButton.tag = section
//            cell?.toggleButton?.setTitle(sections[section].collapsed! ? "+" : "-", for: .normal)
//            cell?.toggleButton?.addTarget(self, action: #selector(AlphabetsTableViewController.toggleCollapse), for: .touchUpInside)
//            return cell } else {
//            let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as UITableViewCell!
//            cell?.textLabel?.text = sections[section].items[row -1]
//            return cell
//        }
//        }
//
//        //let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
//        //        let cell = tableView.dequeueReusableCell(withIdentifier: "alphabets", for: indexPath)
////            let carKey = carSec
    ///

////        if let carValues = carsDictionary[carKey] {
////            cell.textLabel?.text  = carValues[indexPath.row]
//
//
//
//
//        return cell
//    }
    
    
    func getSectionIndex(_ row: NSInteger) -> Int {
           let indices = getHeaderIndices()
           
           for i in 0..<indices.count {
               if i == indices.count - 1 || row < indices[i + 1] {
                   return i
               }
           }
           
           return -1
       }
       
       func getRowIndex(_ row: NSInteger) -> Int {
           var index = row
           let indices = getHeaderIndices()
           
           for i in 0..<indices.count {
               if i == indices.count - 1 || row < indices[i + 1] {
                   index -= indices[i]
                   break
               }
           }
           
           return index
       }
       
       func getHeaderIndices() -> [Int] {
           var index = 0
           var indices: [Int] = []
           
           for section in sections {
               indices.append(index)
               index += section.items.count + 1
           }
           
           return indices
       }
    
    
    
    
      @objc func toggleCollapse(_ sender: UIButton) {
          let section = sender.tag
          let collapsed = sections[section].collapsed
          
          // Toggle collapse
          sections[section].collapsed = !collapsed!
          
          let indices = getHeaderIndices()
          
          let start = indices[section]
          let end = start + sections[section].items.count
          
          tableView.beginUpdates()
          for i in start ..< end + 1 {
              tableView.reloadRows(at: [IndexPath(row: i, section: 1)], with: .automatic)
          }
          tableView.endUpdates()
      }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return tableView.rowHeight
        }
        
        //calculate the real section index and row index. The getSectionIndex and getRowIndex helpers calculate the section index and row index based on the indexPath.row, remembe we need to take the header into account.
        let section = getSectionIndex(indexPath.row)
        let row = getRowIndex(indexPath.row)
        
        //header has fixed hight
        if row == 0 {
            return 50.0
        }
        
        return sections[section].collapsed! ? 0 : 44.9
        
    }
    

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return carSectionTitles[section]
        
        switch section {
        case 0: return "Manufacture"
        case 1: return "Products"
        case 2: return ""
        default:
            return ""
        }
    }

//    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
//        return carSectionTitles
//    }
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

}
