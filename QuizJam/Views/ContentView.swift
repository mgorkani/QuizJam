//
//  ContentView.swift
//  QuizJam
//
//  Created by Monika Gorkani on 2/19/21.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.white.edgesIgnoringSafeArea(.all)
                VStack {
                    HStack(spacing: 25, content: {
                        Button(action: {
                            print("Practice button was tapped")
                        }) {
                            ButtonTextUI(buttonText: "Practice")
                                .foregroundColor(Color.snow)
                                .background(Color.orangeRed)
                                .cornerRadius(25)
                        }
                        Button(action: {
                            print("Manage button was tapped")
                        }) {
                            ButtonTextUI(buttonText: "Manage")
                                .foregroundColor(Color.snow)
                                .background(Color.oceanBlue)
                                .cornerRadius(25)
                        }
                    })
                    Spacer()
                }
            }
            .navigationTitle("QuizJam")
        }
    }
    
    @available(iOS 14, *)
    func navigationBarTitleTextColor(_ color: Color) -> some View {
        let uiColor = UIColor(color)
        
        // Set appearance for both normal and large sizes.
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: uiColor ]
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: uiColor ]
        
        return self
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
