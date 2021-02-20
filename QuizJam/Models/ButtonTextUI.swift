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
            .frame(width: 160, height: 140, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}
