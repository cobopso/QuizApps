//
//  Question.swift
//  QuizApps
//
//  Created by Nguyễn Hữu Khánh on 19/03/2021.
//

import Foundation

struct Question {
    
    let img: String
    let text : String
    let answears: [String]
    let rightAnswer: String
    
    init(photo: String, q: String, a: [String], correctAnswer: String) {
        img = photo
        text = q
        answears = a
        rightAnswer = correctAnswer
    }
}
