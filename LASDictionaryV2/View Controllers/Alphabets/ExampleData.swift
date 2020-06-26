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
    
    public init(name: String) {
        self.name = name
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
        Item(name: "Aa"),
        Item(name: "Bb")
        
    ]),
    Section(name: "Greek", items: [
        Item(name: "Αα"),
        Item(name: "Ββ"),
        Item(name: "Κκ"),
        Item(name: "Δδ")
    ]),
    Section(name: "French", items: [
        Item(name: "Aa"),
        Item(name: "Bb"),
        Item(name: "Cc"),
        Item(name: "Dd")
    ])
]
