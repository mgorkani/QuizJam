//
//  ButtonTextUI.swift
//  QuizJam
//
//  Created by Sandra Quel on 2/19/21.
//

import SwiftUI

struct ButtonTextUI: View {
    var buttonText: String
    
    var body: some View {
        Text(buttonText)
            .font(.title)
            .foregroundColor(Color.snow)
            .padding()
            .frame(minWidth: 0, maxWidth: 300, minHeight: 0, maxHeight: 200)
    }
}
