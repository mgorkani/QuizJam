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
            }
            .navigationTitle("Flash Cards")
        }
    }
}

struct CardList_Previews: PreviewProvider {
    static var previews: some View {
        CardList().environmentObject(ModelData())
    }
}
