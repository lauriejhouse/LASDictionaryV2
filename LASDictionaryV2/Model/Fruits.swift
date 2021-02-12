//
//  Fruits.swift
//  LASDictionaryV2
//
//  Created by Jackie on 2/2/21.
//  Copyright © 2021 LAS. All rights reserved.
//

import Foundation

class Fruits: NSObject, Decodable, NSCoding, Comparable {
    
    
    
    private var name: String!
    private var number: Int!
    
    
    var fruitName : String {
        return name
    }
    
    var signNumber: Int {
        return number
    }
    
    static func <(lhs: Fruits, rhs: Fruits) -> Bool {
        return lhs.fruitName < rhs.fruitName
    }
    
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(fruitName, forKey: "fruitNameKey")
    }
    
    required init?(coder aDecoder: NSCoder) {
        print("Trying to turn Data into Fruit")
        self.name = aDecoder.decodeObject(forKey: "fruitNameKey") as? String
    }
    
    init(name: String, number: Int) {

        self.name = name
        self.number = number
    }
    
   
}
