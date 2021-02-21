//
//  ContentView.swift
//  QuizJam
//
//  Created by Monika Gorkani on 2/19/21.
//

import SwiftUI

struct ContentView: View {
    @State private var showPractice = false
    
    var body: some View {
        Button("Practice") {
            showPractice.toggle()
        }
        .fullScreenCover(isPresented: $showPractice, content: {
            PracticeView()
                .environmentObject(ModelData())
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
