//
//  DetailTableViewController.swift
//  LASDictionaryV2
//
//  Created by Jackie Norstrom on 9/24/20.
//  Copyright © 2020 LAS. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {
    
    
    var selectedAuteur: Auteur!
    let kShowBigSegueIdentifier = "showBigImageSegue"

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableView.automaticDimension
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return  selectedAuteur.films.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! DetailTableViewCell

        let film = selectedAuteur.films[indexPath.row]
        //let auteur = autuers[indexPath.row]
        
        cell.alphabetLabel.text = film.title
        cell.alphabetImage.image = UIImage(named: film.poster)
        cell.alphabetImage.contentMode = .scaleAspectFit
    
                        
        return cell
    }

    
    
//   override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//    let cell = tableView.cellForRow(at: indexPath) as! DetailTableViewCell
//        self.imageTapped(image: cell.alphabetImage.image!)
//
//
//
//    }

//    func imageTapped(image:UIImage){
//        let newImageView = UIImageView(image: image)
//        newImageView.frame = UIScreen.main.bounds
//        newImageView.backgroundColor = .black
//        newImageView.contentMode = .scaleAspectFit
//        newImageView.isUserInteractionEnabled = true
//        let tap = UITapGestureRecognizer(target: self, action: #selector(DetailTableViewController.dismissFullscreenImage(_:)))
//        newImageView.addGestureRecognizer(tap)
//        self.view.addSubview(newImageView) //add code here to make sure that the view scrolls?
//        self.navigationController?.isNavigationBarHidden = true
//        self.tabBarController?.tabBar.isHidden = true
//        //see if subview has an update/reload view
//
//
//    }
//
//    @objc func dismissFullscreenImage(_ sender: UITapGestureRecognizer) {
//        self.navigationController?.isNavigationBarHidden = false
//        self.tabBarController?.tabBar.isHidden = false
//        sender.view?.removeFromSuperview()
//    }
    
    
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard segue.identifier == kShowBigSegueIdentifier, let bigImageVC = segue.destination as? FullImageView, let bigPhotoImageView = sender as? UIImage else { return }
//        bigImageVC.bigPhotoImageView = bigPhotoImageView
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//
//        if segue.identifier == "showDetail", let controller = (segue.destination as? UINavigationController)?.topViewController as? FullImageView {
//
//
//            if let indexPath = tableView.indexPathForSelectedRow {
//                let film = Auteur
//            }
//
//
//        }
//    }
    

}
