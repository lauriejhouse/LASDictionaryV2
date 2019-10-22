//
//  SignModel.swift
//  LASDictionaryV2
//
//  Created by Jackie on 10/21/19.
//  Copyright © 2019 LAS. All rights reserved.
//

import Foundation

class SignModel {
    
    
    
    private var _signName: String!
    
    
    var signName: String {
        return _signName
    }

    
    
//    func encode(with aCoder: NSCoder) {
//        aCoder.encode(signName, forKey: "signNameKey")
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        print("Trying to turn Data into Sign")
//        self._signName = aDecoder.decodeObject(forKey: "signNameKey") as? String
//    }
    
    init(name: String) {

        self._signName = name
    }
    
   
}
