////
////  SignCard.swift
////  LASDictionaryV2
////
////  Created by Jackie on 10/29/19.
////  Copyright © 2019 LAS. All rights reserved.
////
//
//import UIKit
//
////struct SignCard: Decodable {
////  let name: String
//////  let description: String
//////  let image: UIImage
////
////  enum CodingKeys: String, CodingKey {
////    case name
//////    case description
//////    case image
////  }
////
////  init(from decoder: Decoder) throws {
////    let container = try decoder.container(keyedBy: CodingKeys.self)
////    name = try container.decode(String.self, forKey: .name)
//////    description = try container.decode(String.self, forKey: .description)
//////    let imageName = try container.decode(String.self, forKey: .image)
//////    image = UIImage(named: imageName)!
////  }
////}
//
//
//
//struct SignCard: Codable {
//    var name: String
//}
//
//func signsPlist() {
//if let path = Bundle.main.path(forResource: "Signs", ofType: "plist"),
//    let xml = FileManager.default.contents(atPath: path),
//    let preferences = try? PropertyListDecoder().decode(SignCard.self, from: xml)
//
//{
//    print(preferences.name)
//}
//
//
//}
