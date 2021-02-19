//
//  CardList.swift
//  QuizJam
//
//  Created by Monika Gorkani on 2/19/21.
//

import SwiftUI

struct CardList: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        NavigationView {
            List {
                ForEach(modelData.cards) {card in
                    Text(card.prompt)
                }
                .onDelete(perform: delete)
            }
            .navigationBarItems(leading: EditButton(), trailing: Button(action: onAdd) { Image(systemName: "plus") })
            .navigationTitle("Flash Cards")
        }
    }
    
    func onAdd() {
        // To be implemented in the next section
    }
    func delete(at offsets: IndexSet) {
        modelData.cards.remove(atOffsets: offsets)
    }
    
    
    
}

struct CardList_Previews: PreviewProvider {
    static var previews: some View {
        CardList().environmentObject(ModelData())
    }
}
