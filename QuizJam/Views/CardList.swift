//
//  CardList.swift
//  QuizJam
//
//  Created by Monika Gorkani on 2/19/21.
//

import SwiftUI

struct CardList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showingEditScreen = false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        NavigationView {
            List {
                HStack {
                    Spacer()
                    Text("\(modelData.cards.count) Cards")
                        .foregroundColor(.secondary)
                    Spacer()
                }
                
                ForEach(modelData.cards) {card in
                    NavigationLink(destination: EditCard(card: card)) {
                        VStack(alignment: .leading) {
                            Text(card.prompt)
                                .font(.headline)
                                .foregroundColor(.black)
                                .padding(.bottom, 2)
                            Text(card.answer)
                                .font(.subheadline)
                                .foregroundColor(Color.oceanBlue)
                        }
                        .padding(.vertical)
                    }
                }
                .onDelete(perform: delete)
            }
            .navigationTitle("Flashcard Bank")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: onAdd) {
                        Text("Add")
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: dismiss) {
                        Text("Close").bold()
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
        }
        .sheet(isPresented: self.$showingEditScreen, onDismiss: self.hideEdit, content: {
            AddCard().environmentObject(modelData)
        })

    }
    func dismiss() {
        self.presentationMode.wrappedValue.dismiss()
    }
    func onAdd() {
        self.showingEditScreen = true
    }
    func delete(at offsets: IndexSet) {
        modelData.cards.remove(atOffsets: offsets)
    }
    func hideEdit() {
        self.showingEditScreen = false
    }
    
    
}

struct CardList_Previews: PreviewProvider {
    static var previews: some View {
        CardList().environmentObject(ModelData())
    }
}
