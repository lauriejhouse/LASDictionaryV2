//
//  RevealViewController.swift
//  LASDictionaryV2
//
//  Created by Jackie on 10/29/19.
//  Copyright © 2019 LAS. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit
import Firebase

class RevealViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var signView: QuizVideoView!
    
    @IBOutlet weak var count: UILabel!
    
    var signs: Signs?
    var signCard: SignCard?
    
     override func viewDidLoad() {
          super.viewDidLoad()
      if let label = titleLabel
          {
              //label.text = signs?.signName
            label.text = signCard?.name
      }
          
          //guard let videoName = signs?.signName.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {return}
        guard let videoName = signCard?.name.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {return}
          
          let httpsReference = Storage.storage().reference(forURL: "https://firebasestorage.googleapis.com/v0/b/lasdictionaryv2.appspot.com/o/\(videoName).mov")
          
          httpsReference.downloadURL() { url, error in
              print("URL",url as Any)
              print("ERROR", error as Any)
              if let url = url, error == nil {
                  self.signView.configureForUrl(url)
                  self.signView.isLoop = true
                  self.signView.play()
              }
          }
          
          
      }
    @IBAction func dismissPressed(_sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func topButton(sender: AnyObject) {
//        let point = CGPoint(x: 0,y :0) // CGFloat, Double, Int
//        let hitPoint = sender.convert(point, to: self.view)
//       let hitIndex = self.view.indexpath
//        let object = objectAtIndexPath(hitIndex)
//        object.incrementKey("count")
//        object.saveInBackground()
        
        FirebaseService.shared.databaseReference
            .child("items")
            .child(itemID!)
            .runTransactionBlock({ (currentData: MutableData) -> TransactionResult in
                if var item =  currentData.value as? [String : AnyObject] {
                let uid = SharedUser.current!.id

                var usersLikedIdsArray = item["liked_who"] as? [String : Bool] ?? [:]
                var likesCount = item["likes"] as? Int ?? 0

                    if usersLikedIdsArray[uid] == nil  {
                        likesCount += 1
                        usersLikedIdsArray[uid] = true
                        self.setImage(self.activeImage!, for: .normal)
                        self.updateClosure?(true)
                    } else {
                        likesCount -= 1
                        usersLikedIdsArray.removeValue(forKey: uid)
                        self.setImage(self.unactiveImage!, for: .normal)
                        self.updateClosure?(false)
                    }

                item["liked_who"] = usersLikedIdsArray as AnyObject?
                item["likes"] = likesCount as AnyObject?

                currentData.value = item

                return TransactionResult.success(withValue: currentData)
            }
            return TransactionResult.success(withValue: currentData)
        }) { (error, committed, snapshot) in
            if let error = error {
                self.owner?.show(error: error)
            }
        }
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
    
    
    
    
 
    
    

