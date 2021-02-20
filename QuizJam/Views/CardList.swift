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
    var body: some View {
        NavigationView {
            
            List {
                ForEach(modelData.cards) {card in
                    NavigationLink(destination: EditCard(card: card)) {
                        Text(card.prompt)
                    }
                }
                .onDelete(perform: delete)
            }
            .navigationBarItems(leading: EditButton(), trailing: Button(action: onAdd) { Image(systemName: "plus") })
            .navigationTitle("Flash Cards")
        }
        .sheet(isPresented: self.$showingEditScreen, onDismiss: self.hideEdit, content: {
            AddCard().environmentObject(modelData)
        })

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
