////
////  SignCardStore.swift
////  LASDictionaryV2
////
////  Created by Jackie on 10/29/19.
////  Copyright © 2019 LAS. All rights reserved.
////
//
//import UIKit
//
//
//var signsArray = [Signs]()
//
//struct signCardStore {
//    
//
//    
//    static let defaultSign: [SignCard] = {
//        //return parseJSON()
//        return parsePets()
//    }()
//    
//    
//    private static func parsePets() -> [SignCard] {
//      guard let fileURL = Bundle.main.url(forResource: "Signs", withExtension: "plist") else {
//        return []
//      }
//
//      do {
//        let petData = try Data(contentsOf: fileURL, options: .mappedIfSafe)
//        let pets = try PropertyListDecoder().decode([SignCard].self, from: petData)
//        return pets
//      } catch {
//        print(error)
//        return []
//      }
//    }
//
//    
////  private static  func parseJSON() -> [SignCard] {
////
////            if let url = Bundle.main.url(forResource: "csvjson", withExtension: "json") {
////            do {
////                let date = Date()
////                let data = try Data(contentsOf: url)
////                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
////
////                    (json["results"] as? [[String:Any]])?.forEach { j in
////                        if let name = j["identifier"] as? String, let id = j["id"] as? Int {
////
////
////                            let sign = Signs(name: name, number: id)
////                            signsArray.append(sign)
////                        }
////                    }
////
////                }
////                print("Took", Date().timeIntervalSince(date))
////            } catch {
////                print(error.localizedDescription)
////
////            }
////        }
////
////  return []  }
//    
//    
//}
//
//
//
////    func parseJSON() {
////
////            if let url = Bundle.main.url(forResource: "csvjson", withExtension: "json") {
////            do {
////                let date = Date()
////                let data = try Data(contentsOf: url)
////                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
////
////                    (json["results"] as? [[String:Any]])?.forEach { j in
////                        if let name = j["identifier"] as? String, let id = j["id"] as? Int {
////
////
////                            let sign = Signs(name: name, number: id)
////                            signsArray.append(sign)
////                        }
////                    }
////
////                }
////                print("Took", Date().timeIntervalSince(date))
////            } catch {
////                print(error.localizedDescription)
////            }
////        }
////
////    }
////
////
////}
