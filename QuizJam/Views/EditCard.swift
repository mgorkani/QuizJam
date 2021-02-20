//
//  EditCard.swift
//  QuizJam
//
//  Created by Monika Gorkani on 2/19/21.
//

import SwiftUI

struct EditCard: View {
    
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var modelData: ModelData
    @ObservedObject var card: Card
    var cardIndex: Int {
        modelData.cards.firstIndex(where: { $0.id == card.id })!
    }
    
    
    var body: some View {
        
        Form {
            Section(header: Text("Prompt")) {
                TextEditor(text: $card.prompt.onChange(update))
            }
            Section(header: Text("Answer")) {
                TextEditor(text: $card.answer.onChange(update))
            }
            
        }
        
    }
    
    func update() {
        modelData.objectWillChange.send()
    }
    
}

extension Binding {
    func onChange(_ handler: @escaping () -> Void) -> Binding<Value> {
        Binding(
            get: { self.wrappedValue },
            set: { newValue in
                self.wrappedValue = newValue
                handler()
            }
        )
    }
}

struct EditCard_Previews: PreviewProvider {
    static let modelData = ModelData()
    static var previews: some View {
        EditCard(card: modelData.cards[0])
    }
}
