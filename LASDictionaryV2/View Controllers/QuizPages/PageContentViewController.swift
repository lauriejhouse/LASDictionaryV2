//
//  PageContentViewController.swift
//  
//
//  Created by Jackie Norstrom on 3/30/20.
//

import UIKit
import Firebase

//maybe make the quiz flashcard based. see about using gifs in it instead.

class PageContentViewController: UIPageViewController {
    
    var signs: Signs?
    
    
    var pageIndex: Int = 0
    var strTitle: String!
    var strPhotoName: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        
       

        // Do any additional setup after loading the view.
    }
    
    var arrPageTitle: NSArray = NSArray()
    var arrPagePhoto: NSArray = NSArray()

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
