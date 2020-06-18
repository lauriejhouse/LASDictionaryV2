//
//  ExampleData.swift
//  LASDictionaryV2
//
//  Created by Jackie on 6/17/20.
//  Copyright © 2020 LAS. All rights reserved.
//

import Foundation
//
// MARK: - Section Data Structure
//
public struct Item {
    var name: String
    //var detail: String
    
    //delete detail from here to clean up codde
    public init(name: String, detail: String) {
        self.name = name
        //self.detail = detail
    }
}

public struct Section {
    var name: String
    var items: [Item]
    var collapsed: Bool
    
    public init(name: String, items: [Item], collapsed: Bool = false) {
        self.name = name
        self.items = items
        self.collapsed = collapsed
    }
}

public var sectionsData: [Section] = [
    Section(name: "English", items: [
        Item(name: "Aa", detail: ""),
        Item(name: "Bb", detail: "")
        
    ]),
    Section(name: "Greek", items: [
        Item(name: "Αα", detail: "iPad Pro delivers epic power, in 12.9-inch and a new 10.5-inch size."),
        Item(name: "Ββ", detail: "The second-generation iPad Air tablet computer designed, developed, and marketed by Apple Inc."),
        Item(name: "Κκ", detail: "iPad mini 4 puts uncompromising performance and potential in your hand."),
        Item(name: "Δδ", detail: "")
    ]),
    Section(name: "Spanish", items: [
        Item(name: "Aa", detail: "The iPhone 6S has a similar design to the 6 but updated hardware, including a strengthened chassis and upgraded system-on-chip, a 12-megapixel camera, improved fingerprint recognition sensor, and LTE Advanced support."),
        Item(name: "Bb", detail: "The iPhone 6 and iPhone 6 Plus are smartphones designed and marketed by Apple Inc."),
        Item(name: "Cc", detail: "The iPhone SE was received positively by critics, who noted its familiar form factor and design, improved hardware over previous 4-inch iPhone models, as well as its overall performance and battery life."),
        Item(name: "Dd", detail: "")
    ])
]
