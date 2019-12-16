//
//  DataStore.swift
//  LASDictionaryV2
//
//  Created by Jackie Norstrom on 11/22/19.
//  Copyright © 2019 LAS. All rights reserved.
//

import Foundation

class DataStore {
    static let instance = DataStore()
    
    var signs: [Signs] = []
    init() {
        self.parseJSONSignDictionary()
    }
    
       func parseJSONSignDictionary() {

               if let url = Bundle.main.url(forResource: "convertcsv", withExtension: "json") {
               do {
                   let date = Date()
                   let data = try Data(contentsOf: url)
                   if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {

                       (json["results"] as? [[String:Any]])?.forEach { j in
                           if let name = j["identifier"] as? String, let id = j["id"] as? Int {


                               let sign = Signs(name: name, number: id)
                               signs.append(sign)
                           }
                       }

                   }
                   print("Took", Date().timeIntervalSince(date))
               } catch {
                   print(error.localizedDescription)
               }
           }

       }
       
       
       
    
       
       
}
