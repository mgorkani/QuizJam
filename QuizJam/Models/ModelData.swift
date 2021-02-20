//
//  ModelData.swift
//  QuizJam
//
//  Created by Monika Gorkani on 2/19/21.
//

import Foundation
final class ModelData: ObservableObject {
    @Published var cards =  [Card]()
    
    init() {
        load()
    }

    private static var documentsFolder: URL {
        do {
            return try FileManager.default.url(for: .documentDirectory,
                                               in: .userDomainMask,
                                               appropriateFor: nil,
                                               create: false)
        } catch {
            fatalError("Can't find documents directory.")
        }
    }
    
    private static var fileURL: URL {
        return documentsFolder.appendingPathComponent("cards.data")
    }
    
    func load() {
        guard let data = try? Data(contentsOf: Self.fileURL) else {
            cards = loadFileName("cardData.json")
            return
        }
        guard let parsedCards = try? JSONDecoder().decode([Card].self, from: data) else {
            fatalError("Can't decode saved cards data.")
        }
        cards = parsedCards
    }

    func loadFileName<T: Decodable>(_ filename: String) -> T {
        let data: Data

        guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
        }

        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
        }

        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
        }
    }
    
    func save() {
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let cards = self?.cards else { fatalError("Self out of scope") }
            guard let data = try? JSONEncoder().encode(cards) else { fatalError("Error encoding data") }
            do {
                let outfile = Self.fileURL
                try data.write(to: outfile)
            } catch {
                fatalError("Can't write to file")
            }
        }
    }
    
    

}
