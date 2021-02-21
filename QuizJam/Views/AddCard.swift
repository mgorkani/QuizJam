//
//  EditCard.swift
//  QuizJam
//
//  Created by Monika Gorkani on 2/19/21.
//

import SwiftUI

struct AddCard: View {
    @State private var newPrompt = ""
    @State private var newAnswer = ""
   
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var modelData: ModelData
        
    var body: some View {
        NavigationView {
            Form {
                
                Section(header: Text("Prompt")
                            .bold()
                            .font(.subheadline)
                            .foregroundColor(.primary)) {
                    TextEditor(text: $newPrompt).font(.headline)
                        .foregroundColor(.primary)
                        .padding(.bottom, 2)
                }
                Section(header: Text("Answer")
                            .bold()
                            .font(.subheadline)
                            .foregroundColor(.primary)) {
                    TextEditor(text: $newAnswer)
                        .font(.subheadline)
                        .foregroundColor(.primary)
                }
                
            }
            .navigationBarItems(leading: Button("Close"){self.dismiss()}, trailing: Button("Save"){self.addCard()}).navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        Text("Add").font(.headline).fontWeight(.bold)
                        Image(systemName: "plus.rectangle.fill.on.rectangle.fill")
                    }
                }
            }
        }
    }
    func addCard() {
        
        let trimmedPrompt = newPrompt.trimmingCharacters(in: .whitespaces)
        let trimmedAnswer = newAnswer.trimmingCharacters(in: .whitespaces)
        guard trimmedPrompt.isEmpty == false && trimmedAnswer.isEmpty == false else {
            presentationMode.wrappedValue.dismiss()
            return
        }
    
        let card = Card(prompt: trimmedPrompt, answer: trimmedAnswer)
        modelData.cards.insert(card, at: 0)
        presentationMode.wrappedValue.dismiss()
        
    }
    func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
}

struct Add_Previews: PreviewProvider {
    static var previews: some View {
        AddCard().environmentObject(ModelData())
    }
    
}
