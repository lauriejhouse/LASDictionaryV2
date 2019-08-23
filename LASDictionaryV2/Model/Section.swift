//
//  Section.swift
//  LASDictionaryV2
//
//  Created by Jackie Norstrom on 8/23/19.
//  Copyright © 2019 LAS. All rights reserved.
//

import Foundation
import UIKit


struct Section {
    let name : String
    let signs : [Signs]
}

struct Sign : Decodable {
    let name : String
    let id : String
    
    private enum CodingKeys : String, CodingKey {
        case name = "identifier"
        case id = "id"

    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        id = try container.decode(String.self, forKey: .id)
    }
    

}



