//
//  ContentView.swift
//  QuizJam
//
//  Created by Monika Gorkani on 2/19/21.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.scenePhase) private var scenePhase
    
    let saveAction: () -> Void
    @State private var showPreview = false
    @State private var fullScreen = true
    
    init(saveAction: @escaping () -> Void) {
        self.saveAction = saveAction
        
        NavBarTheme.navigationBarColors(background: UIColor(Color.clear), titleColor: UIColor(Color.darkColor))
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.white.edgesIgnoringSafeArea(.all)
                VStack(spacing: 35, content: {
                    NavigationLink(destination: PracticeView()) {
                        ButtonTextUI(buttonText: "Practice")
                            .foregroundColor(Color.snow)
                            .background(Color.orangeRed)
                            .cornerRadius(25)
                            .shadow(color: .orangeRed , radius: 10, x: 5, y: 5)
                    }

                    NavigationLink(destination: CardList()) {
                        ButtonTextUI(buttonText: "Manage")
                            .foregroundColor(Color.snow)
                            .background(Color.oceanBlue)
                            .cornerRadius(25)
                            .shadow(color: .oceanBlue, radius: 10, x: 5, y: 5)
                    }
                })
                Spacer()
            }
            .onChange(of: scenePhase) { phase in
                if phase == .inactive { saveAction() }
            }
            .navigationBarTitle("QuizJam")
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView() {
        }
        .environmentObject(ModelData())
    }
}

