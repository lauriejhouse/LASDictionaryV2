//
//  UserDefaults.swift
//  LASDictionaryV2
//
//  Created by Jackie Norstrom on 7/12/19.
//  Copyright © 2019 LAS. All rights reserved.
//

import Foundation


extension UserDefaults {
    
    static let favoritedSignsKey = "favoritedSignsKey"
    
    func savedSigns() -> [Signs] {
        guard let savedSignsData = UserDefaults.standard.data(forKey: UserDefaults.favoritedSignsKey) else { return [] }
        guard let savedPodcasts = NSKeyedUnarchiver.unarchiveObject(with: savedSignsData) as? [Signs] else { return [] }
        //to conform with the iOS12 depreciation, I think I put the do/try unarchiver stuff here/
        return savedPodcasts
    }
    
    func deletePodcast(sign: Signs) {
        let signs = savedSigns()
        let filteredSigns = signs.filter { (p) -> Bool in
            return p.signName != sign.signName //&& p.artistName != sign.artistName
        }
        let data = NSKeyedArchiver.archivedData(withRootObject: filteredSigns)
        UserDefaults.standard.set(data, forKey: UserDefaults.favoritedSignsKey)
    }
    
}
