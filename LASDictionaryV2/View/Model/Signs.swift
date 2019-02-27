//
//  Signs.swift
//  LASDictionaryV2
//
//  Created by Jackie on 2/27/19.
//  Copyright © 2019 LAS. All rights reserved.
//

import Foundation

class Signs {
    
    private var _signName: String!
    private var _signNumber: Int!
    
    
    var signName: String {
        return _signName
    }
    
    var signNumber: Int {
        return _signNumber
    }
    
    
    
    init(name: String, number: Int) {
        
        self._signName = name
        self._signNumber = number
    }
    
}
