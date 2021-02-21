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
            Section(header: Text("Prompt")
                                .foregroundColor(.primary)) {
                TextEditor(text: $card.prompt.onChange(update))
                    .font(.headline)
                    .padding(.bottom, 2)
                    .disableAutocorrection(true)
                    .foregroundColor(.primary)
            }
            Section(header: Text("Answer")
                                .foregroundColor(.primary)) {
                TextEditor(text: $card.answer.onChange(update))
                    .font(.subheadline)
                    .disableAutocorrection(true)
                    .foregroundColor(.primary)
            }
            
        }.navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                HStack {
                    Text("Edit").font(.headline).fontWeight(.bold)
                    Image(systemName: "square.and.pencil")
                }
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
