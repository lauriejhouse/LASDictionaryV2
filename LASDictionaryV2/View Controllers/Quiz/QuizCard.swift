//
//  QuizCard.swift
//  LASDictionaryV2
//
//  Created by Jackie on 1/20/20.
//  Copyright © 2020 LAS. All rights reserved.
//

import UIKit


struct QuizCard: Decodable {
  let name: String
    
  
    enum CodingKeys: String, CodingKey {
    case name
    
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    name = try container.decode(String.self, forKey: .name)

  }
    
    
    
}
