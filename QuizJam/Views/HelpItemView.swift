//
//  HelpItemView.swift
//  QuizJam
//
//  Created by Chaithra Pabbathi on 2/20/21.
//

import SwiftUI

struct HelpItemView: View {
    var systemImageName: String
    var description: String
    
    var body: some View {
        HStack (spacing: 20) {
            Image(systemName: systemImageName)
                .font(.system(size: 40, weight: .medium, design: .rounded))
                .foregroundColor(.red)
            Text(description)
                .font(.system(.headline, design: .rounded))
                .multilineTextAlignment(.leading)
        }
    }
}

struct HelpItemView_Previews: PreviewProvider {
    static var previews: some View {
        HelpItemView(systemImageName: "hand.tap", description: "Tap a card to flip it. Question is on one side and answer is on the other side.")
    }
}
