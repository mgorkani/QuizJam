//
//  CardView.swift
//  QuizJam
//
//  Created by Chaithra Pabbathi on 2/19/21.
//

import SwiftUI

struct CardView: View {
    var card: Card
    
    @State private var flipped = false
    @State private var textDisplayedOnCard = ""
    
    var body: some View {
        CardBackground()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay(
                CardContents(contents: flipped ? card.answer : card.prompt, flipped: flipped)
            )
            .rotation3DEffect(
                .degrees(flipped ? 180 : 0),
                axis: (x: 0.0, y: 1.0, z: 0.0))
            .animation(.easeOut(duration: 0.35))
            .onTapGesture {
                flipped.toggle()
                    textDisplayedOnCard = flipped ? card.answer : card.prompt
            }
            .onAppear(perform: {
                textDisplayedOnCard = card.prompt
            })
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            CardView(card: Card.example)
        }
        .padding()
    }
}
