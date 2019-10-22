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
// http://txt.do/1kl2e

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
    var signsArray = [Any]()




    var filteredSigns = [Signs]()
    var inSearchMode = false
    
   
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        tableView.delegate = self
//        tableView.dataSource = self
//
//       //parseJSONSignDictionary()
//        signsArray = ["Audi", "Aston Martin","BMW", "Bugatti", "Bentley","Chevrolet", "Cadillac","Dodge","Ferrari", "Ford","Honda","Jaguar","Lamborghini","Mercedes", "Mazda","Nissan","Porsche","Rolls Royce","Toyota","Volkswagen", "Zebra"]
//           for sign in signsArray {
//             let carKey = String(sign.prefix(1))
//                 if var carValues = signsDictionary[carKey] {
//                     carValues.append(sign)
//                     signsDictionary[carKey] = carValues
//                 } else {
//                     signsDictionary[carKey] = [sign]
//                 }
//         }
//
//
//
//        signsSectionTitles = [String](signsDictionary.keys)
//           signsSectionTitles = signsSectionTitles.sorted(by: { $0 < $1 })
//
//    }
    
    override func viewDidLoad() {
              super.viewDidLoad()
            getData()
            //parseJSONSignDictionary()
          }
    
    var dataArray = [(String,[Restaurant])]()
    var indexTitles = [String]()

//this works with teh dummy data. trying my own data now http://lauricellaadvancedsign.com/csvjson.json. gotta figure out what things to replace. results = hoods, dont' need neighborhoodNames, or let names. because i dont' have any neighborhoodNames. Going to try making them the same.
    
    //going to try and redo the parsingJSON stuff so it fits in the get data func. Or if I make it more like the neighborhoods one, with hoods being resutls, and neighborhood names being something else, signNames or something. That way I have the two needed strings for the lets.
    
    func getData() {
        
        let url = URL(string: "https://barhoppersf.com/json/neighborhoods.json")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            guard let data = data else {return}
            
            let json = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String : AnyObject]
            
            guard let hoods = json??["hoods"] else { return }

            guard let names = hoods["neighborhoodNames"] as? [String:[AnyObject]] else { return }

            self.makeDataSource(names: names)
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }.resume()
    }
    
    
    

        func makeDataSource(names:[String:[AnyObject]]) {
        //Temporary array to hold restaurants on different indexes
        var dict = [String:[Restaurant]]()

        //Character set taken to check whether the starting key is alphabet or any other character
        let letters = NSCharacterSet.letters

        for (_,value) in names {
            //Iterating Restaurants
            for resObj in value {
                if let restaurantName = resObj["name"] as? String {
                    let restaurant = Restaurant(name: restaurantName)
                    var key = String(describing: restaurant.name.first!)

                    key = isKeyCharacter(key: key, letters: letters) ? key : "#"

                    if let keyValue = dict[key] {
                        //Already value exists for that key
                        var filtered = keyValue
                        filtered.append(restaurant)

                        //Sorting of restaurant names alphabetically
                       // filtered = filtered.sorted(by: {$0.0.name < $0.1.name})
                        dict[key] = filtered
                    } else {
                        let filtered = [restaurant]
                        dict[key] = filtered
                    }
                }
            }
        }
        //To sort the key header values
        self.dataArray = Array(dict).sorted(by: { $0.0 < $1.0 })

        //Logic to shift the # category to bottom
        let temp = self.dataArray[0]
        self.dataArray.removeFirst()
        self.dataArray.append(temp)

        //For setting index titles
        self.indexTitles = Array(dict.keys.sorted(by: <))

        //Making the index title # at the bottom
        let tempIndex = self.indexTitles[0]
        self.indexTitles.removeFirst()
        self.indexTitles.append(tempIndex)
    }

    
    
    func isKeyCharacter(key:String,letters:CharacterSet) -> Bool {
        let range = key.rangeOfCharacter(from: letters)
        if let _ = range {
            //Your key is an alphabet
            return true
        }
        return false
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {

        //return signsSectionTitles.count
        return dataArray.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
//       let carKey = signsSectionTitles[section]
//            if let carValues = signsDictionary[carKey] {
//                return carValues.count
//            }
//
//            return 0
        
        return dataArray[section].1.count

        }
    
   

    

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "dictionaryCell", for: indexPath) as! DictionaryTableViewCell

//      let cell = tableView.dequeueReusableCell(withIdentifier: "dictionaryCell", for: indexPath)
//
//           // Configure the cell...
//           let carKey = signsSectionTitles[indexPath.section]
//           if let carValues = signsDictionary[carKey] {
//               cell.textLabel?.text = carValues[indexPath.row]
//           }
//
//           return cell
        
       let cell = tableView.dequeueReusableCell(withIdentifier: "dictionaryCell") as! DictionaryTableViewCell
           let restaurant = dataArray[indexPath.section].1[indexPath.row]
           cell.dictionarySignLabel.text = restaurant.name
           return cell
       }
    

    
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
   override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return dataArray[section].0
    }
    
  override  func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return self.indexTitles
    }
    


//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//           return signsSectionTitles[section]
//       }
//
//      override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
//           return signsSectionTitles
//       }
    

    
    
}


