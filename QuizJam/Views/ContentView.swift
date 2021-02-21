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
    @State private var showPractice = false
    @State private var showManage = false
    
    init(saveAction: @escaping () -> Void) {
        self.saveAction = saveAction
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack(spacing: 35, content: {
                    Button(action: {
                        showPractice.toggle()
                    }) {
                        ButtonTextUI(buttonText: "Practice")
                            .foregroundColor(Color.snow)
                            .background(Color.orangeRed)
                            .cornerRadius(25)
                            .shadow(color: .orangeRed , radius: 10, x: 5, y: 5)
                            .fullScreenCover(isPresented: $showPractice, content: {
                                PracticeView()
                            })
                        
                    }
                    Button(action: {
                        showManage.toggle()
                    }) {
                        ButtonTextUI(buttonText: "Manage")
                            .foregroundColor(Color.snow)
                            .background(Color.oceanBlue)
                            .cornerRadius(25)
                            .shadow(color: .oceanBlue, radius: 10, x: 5, y: 5)
                            .fullScreenCover(isPresented: $showManage, content: {
                                CardList()
                            })
                        
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

