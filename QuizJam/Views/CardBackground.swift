//
//  CardBackground.swift
//  QuizJam
//
//  Created by Chaithra Pabbathi on 2/19/21.
//

import SwiftUI

struct CardBackground: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                .fill(Color.cardBorderBackgroundColor)
                .shadow(color: colorScheme == .dark ? Color.clear : Color.gray, radius: 10, x: 5, y: 5)
            RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                .scale(0.985)
                .fill(Color.cardBackgroundColor)
                .blur(radius: 3.0)
        }
    }
}

struct CardBackground_Previews: PreviewProvider {
    static var previews: some View {
        CardBackground()
    }
}
