//
//  AlphabetsTableViewController.swift
//  LASDictionaryV2
//
//  Created by Jackie on 6/4/20.
//  Copyright © 2020 LAS. All rights reserved.
//

import UIKit

class AlphabetsTableViewController: UITableViewController {
    
    var sections = sectionsData
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Auto resizing the height of the cell
        tableView.estimatedRowHeight = 44.0
        tableView.rowHeight = UITableView.automaticDimension
        
        self.title = "Language Alphabets"
    }
    var signs: Signs?
}

//
// MARK: - View Controller DataSource and Delegate
//
extension AlphabetsTableViewController {
    //var signs: Signs

    
       override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "alphabets", let _ = (segue.destination as? UINavigationController)?.topViewController as? AlphabetDetail {
//                if let indexPath = tableView.indexPathForSelectedRow {
//
//                    //let sign: Signs
////                    if inSearchMode {
////                        sign = filteredSigns[indexPath.row]
////                    } else {
////                        sign = DataStore.instance.signs[indexPath.row]
////                    }
//    //                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
//                  //   let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
//
//                    //Dictionary button view, is dictionarytableview, the main table view click on is detail view. maybe need another segue with button.
//
//
//                    //controller.signs = sign
//                    controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
//                    controller.navigationItem.leftItemsSupplementBackButton = true
//                }
            }
        }
    
    

    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].collapsed ? 0 : sections[section].items.count
    }
    
    // Cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CollapsibleTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as? CollapsibleTableViewCell ??
            CollapsibleTableViewCell(style: .default, reuseIdentifier: "cell")
        
        let item: Item = sections[indexPath.section].items[indexPath.row]
        
        cell.nameLabel.text = item.name
        //cell.detailLabel.text = item.detail
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    // Header
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as? CollapsibleTableViewHeader ?? CollapsibleTableViewHeader(reuseIdentifier: "header")
        
        header.titleLabel.text = sections[section].name
        header.arrowLabel.text = ">"
        header.setCollapsed(sections[section].collapsed)
        
        header.section = section
        header.delegate = self
        
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44.0
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1.0
    }

}

//
// MARK: - Section Header Delegate
//
extension AlphabetsTableViewController: CollapsibleTableViewHeaderDelegate {
    
    func toggleSection(_ header: CollapsibleTableViewHeader, section: Int) {
        let collapsed = !sections[section].collapsed
        
        // Toggle collapse
        sections[section].collapsed = collapsed
        header.setCollapsed(collapsed)
        
        tableView.reloadSections(NSIndexSet(index: section) as IndexSet, with: .automatic)
    }
    
}
