//
//  Card.swift
//  QuizJam
//
//  Created by Monika Gorkani on 2/19/21.
//

import Foundation

struct Card : Codable, Identifiable {
    var id =  UUID()
    
    let prompt: String
    let answer: String
    
    private enum CodingKeys: String, CodingKey {
            case prompt, answer
    }

}
