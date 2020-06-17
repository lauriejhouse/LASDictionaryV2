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
        guard let savedSigns = NSKeyedUnarchiver.unarchiveObject(with: savedSignsData) as? [Signs] else { return [] }
        //to conform with the iOS12 depreciation, I think I put the do/try unarchiver stuff here/

        return savedSigns
    }
    
    func deletePodcast(sign: Signs) {
        let signs = savedSigns()
        let filteredSigns = signs.filter { (s) -> Bool in
            return s.signName != sign.signName
        }
        let data = NSKeyedArchiver.archivedData(withRootObject: filteredSigns)
        UserDefaults.standard.set(data, forKey: UserDefaults.favoritedSignsKey)
    }
    
    
    
    
    
    static let quizSignsKey = "quizSignsKey"
    
    func savedQuiz() -> [Signs] {
        guard let savedQuizData = UserDefaults.standard.data(forKey: UserDefaults.quizSignsKey) else {return [] }
        guard let savedQuizs = NSKeyedUnarchiver.unarchiveObject(with: savedQuizData) as? [Signs] else {return [] }
        
        return savedQuizs
        
    }
    
    func deleteQuiz(sign: Signs) {
           let signs = savedQuiz()
           let filteredSigns = signs.filter { (s) -> Bool in
               return s.signName != sign.signName
           }
           let data = NSKeyedArchiver.archivedData(withRootObject: filteredSigns)
           UserDefaults.standard.set(data, forKey: UserDefaults.quizSignsKey)
       }
    
    
}
