//
//  AlphabetDetail.swift
//  LASDictionaryV2
//
//  Created by Jackie on 6/17/20.
//  Copyright © 2020 LAS. All rights reserved.
//

import UIKit


class AlphabetDetail: UITableViewController {
    
    var selectedAuteur: Auteur!
    //var sectionData = [sectionsData]
    let moreInfoText = "Tap For Details >"


    //var alphabets: Item?
    
   @IBOutlet weak var alphabetLabel: UILabel?
    

          override func viewDidLoad() {
            super.viewDidLoad()
            title = selectedAuteur.name
            self.tableView.contentInsetAdjustmentBehavior = .never
          }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
              return selectedAuteur.films.count
            }
            
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
              let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
              let film = selectedAuteur.films[indexPath.row]
              cell.textLabel?.text = film.plot
              
              return cell
            }
    
    
        }

        
        
        



//https://guides.codepath.com/ios/Using-UITableView
