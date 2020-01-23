//
//  QuizCardStor.swift
//  LASDictionaryV2
//
//  Created by Jackie on 1/21/20.
//  Copyright © 2020 LAS. All rights reserved.
//

import UIKit


struct QuizCardStore {
  
  static let defaultPets: [QuizCard] = {
    return parseQuiz()
  }()
  
  private static func parseQuiz() -> [QuizCard] {
    guard let fileURL = Bundle.main.url(forResource: "QuizSigns", withExtension: "plist") else {
      return []
    }

    do {
      let quizData = try Data(contentsOf: fileURL, options: .mappedIfSafe)
      let quiz = try PropertyListDecoder().decode([QuizCard].self, from: quizData)
      return quiz
    } catch {
      print(error)
      return []
    }
  }
}
