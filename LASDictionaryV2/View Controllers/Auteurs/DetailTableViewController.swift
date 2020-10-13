//
//  DetailTableViewController.swift
//  LASDictionaryV2
//
//  Created by Jackie Norstrom on 9/24/20.
//  Copyright © 2020 LAS. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {
    
    var selectedAutuer = Auteur.auteursFromBundle()
    var auteurs: Auteur!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: - Table view data source
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let fullImageViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FullImageView") as! FullImageView
        
        fullImageViewController.selectedAuteurFilm = auteurs.films[indexPath.row]
        navigationController?.pushViewController(fullImageViewController, animated: true)
    }
        

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return  auteurs.films.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! DetailTableViewCell

        let film = auteurs.films[indexPath.row]
        //let auteur = autuers[indexPath.row]
        
        cell.alphabetLabel.text = film.title
        cell.alphabetImage.image = UIImage(named: film.poster)
        cell.alphabetImage.contentMode = .scaleAspectFit
    
                        
        return cell
    }

    
    

}
