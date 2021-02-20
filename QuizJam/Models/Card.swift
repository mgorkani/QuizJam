//
//  Card.swift
//  QuizJam
//
//  Created by Monika Gorkani on 2/19/21.
//

import Foundation

class Card : Codable, Identifiable, ObservableObject {
    var id =  UUID()
    
    @Published var prompt: String
    @Published var answer: String
    
    private enum CodingKeys: String, CodingKey {
            case prompt, answer
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(prompt, forKey: .prompt)
        try container.encode(answer, forKey: .answer)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        answer = try container.decode(String.self, forKey: .answer)
        prompt = try container.decode(String.self, forKey: .prompt)
    }
    
    init(prompt:String, answer:String) {
        self.prompt = prompt
        self.answer = answer
    }
    static let example = Card(prompt: "Who played the 13th Doctor in Doctor Who?", answer: "Jodie Whittaker")
}
