//
//  Card.swift
//  QuizJam
//
//  Created by Monika Gorkani on 2/19/21.
//

import Foundation

struct Card : Codable {
    let prompt: String
    let answer: String

    static var example: Card {
        Card(prompt: "Who played the 13th Doctor in Doctor Who?", answer: "Jodie Whittaker")
    }
}
