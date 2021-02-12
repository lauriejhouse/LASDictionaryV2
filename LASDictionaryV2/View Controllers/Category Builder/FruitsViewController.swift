//
//  VocabBuilderViewController.swift
//  LASDictionaryV2
//
//  Created by Jackie on 1/29/21.
//  Copyright © 2021 LAS. All rights reserved.
//

import UIKit
import Firebase
import SwiftyJSON

class FruitsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var fruitsTableview: UITableView!
    
    
 
    
var filteredSigns = [Fruits]()
var fruits = [Fruits]()
    var inSearchMode = false
    
    override func viewDidLoad() {
           super.viewDidLoad()
        

   
        fruitsTableview.delegate = self
        fruitsTableview.dataSource = self
    
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "fruitCell", for: indexPath) as! FruitsTableViewCell

        let fruit: Fruits
        
        fruit = FruitsDataStore.fruitsInstance.fruits[indexPath.row]
        
            cell.configureTableCell(fruits: fruit)
           return cell
       }
    
    
     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        
        return 1
    }
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
  
        return 3
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "fruitsDetail", let controller = (segue.destination as? UINavigationController)?.topViewController as? FruitsDetailView {
            if let indexPath = fruitsTableview.indexPathForSelectedRow {

                let fruits: Fruits?

                fruits = FruitsDataStore.fruitsInstance.fruits[indexPath.row]
                
        
                
                
                
//                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
              //   let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                
                //Dictionary button view, is dictionarytableview, the main table view click on is detail view. maybe need another segue with button.
                

            controller.fruit = fruits
            //controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
        
        
        
    }
    
    
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//        let cell = tableView.cellForRow(at: indexPath) as! FruitsTableViewCell?
//            let _ = cell?.fruitLabel.text
//        }
    //https://stackoverflow.com/questions/14356869/how-to-get-the-cell-label-text-values-from-a-selected-row-of-uitableview/14359418



}
