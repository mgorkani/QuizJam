//
//  CardContents.swift
//  QuizJam
//
//  Created by Chaithra Pabbathi on 2/19/21.
//

import SwiftUI

struct CardContents: View {
    var contents: String
    var flipped: Bool
    
    var body: some View {
        Text(flipped ? "Answer:\n" + contents : contents)
            .fontWeight(.bold)
            .multilineTextAlignment(.center)
            .foregroundColor(.fontColor)
            .font(.title2)
            .padding(20)
            .rotation3DEffect(
                flipped ? .degrees(180) : .zero,
                axis: (x: 0.0, y: 1.0, z: 0.0))
            .animation(.none)
            .background(Color.cardBackgroundColor)
    }
}

struct CardContents_Previews: PreviewProvider {
    static var previews: some View {
        CardContents(contents: "What is your name?", flipped: true)
    }
}
