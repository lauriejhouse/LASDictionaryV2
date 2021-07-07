//
//  Sign.swift
//  LASDictionaryV2
//
//  Created by Jackie on 10/23/20.
//  Copyright © 2020 LAS. All rights reserved.
//

import Foundation

struct Sentences: Decodable {
    let signName: String
    
}

extension Sentences {
  static func sentence() -> [Sentences] {
    guard
      let url = Bundle.main.url(forResource: "convertcsv", withExtension: "json"),
      let data = try? Data(contentsOf: url)
      else {
        return []
    }
    
    do {
      let decoder = JSONDecoder()
      return try decoder.decode([Sentences].self, from: data)
    } catch {
      return []
    }
  }
}
