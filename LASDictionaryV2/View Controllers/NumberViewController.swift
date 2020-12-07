//
//  NumberViewController.swift
//  LASDictionaryV2
//
//  Created by Jackie on 12/2/20.
//  Copyright © 2020 LAS. All rights reserved.
//

import UIKit

class NumberViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
   // @IBOutlet weak var numberLabel: UILabel!
    
    var numbers = ["1","2","3","4","5"]
    var selectedImage: String?
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
        }
    }

    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        // Do any additional setup after loading the view.

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numbers.count
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "numberCell", for: indexPath)

        cell.textLabel?.text = self.numbers[indexPath.row]
        //numbersView.image = UIImage(named: "numbers\(numbers)")
        //need to get image show up when cell is clicked

        return cell
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //maybe put it here? cause when you select the row it should update the image view.
        if let vc = storyboard?.instantiateViewController(identifier: "MainNumbers") as? MainNumbers {
            vc.selectedImage = numbers[indexPath.row]
        }
    }
    
    

}
