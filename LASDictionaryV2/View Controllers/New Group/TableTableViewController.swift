//
//  TableTableViewController.swift
//  LASDictionaryV2
//
//  Created by Jackie Norstrom on 8/5/20.
//  Copyright © 2020 LAS. All rights reserved.
//

import UIKit

class TableTableViewController: UITableViewController {
  let auteurs = Auteur.auteursFromBundle()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 34, weight: .bold) ]
    navigationItem.largeTitleDisplayMode = .automatic
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let destination = segue.destination as? AlphabetDetail,
      let indexPath = tableView.indexPathForSelectedRow {
      destination.selectedAuteur = auteurs[indexPath.row]
    }
  }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return auteurs.count
  }
 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    let auteur = auteurs[indexPath.row]
    
    cell.textLabel?.text = auteur.bio
        
    return cell
  }
}

