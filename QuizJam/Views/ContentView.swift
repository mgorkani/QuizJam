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
                    
                    //Sample Palettes
                    Spacer()
                    Section(header: Text("Palette 1")) {
                        Text("SSSS").background(Color.snow)
                            .foregroundColor(Color.black)
                        Text("orangeRed").background(Color.orangeRed)
                            .foregroundColor(Color.snow)
                        
                        Text("maximumYellow").background(Color.maximumYellow)
                            .foregroundColor(Color.snow)
                        
                        Text("oceanBlue").background(Color.oceanBlue)
                            .foregroundColor(Color.snow)
                        
                        Text("carribeanOcean").background(Color.carribeanOcean)
                            .foregroundColor(Color.snow)
                        
                        Text("blizzardBlue").background(Color.blizzardBlue)
                            .foregroundColor(Color.black)
                    }
                    Spacer()
                    
                    Section(header: Text("Palette 2")) {
                        Text("cream").background(Color.cream)
                            .foregroundColor(Color.black)
                        Text("burntSienna").background(Color.burntSienna)
                            .foregroundColor(Color.white)
                        Text("eggShell").background(Color.eggShell)
                            .foregroundColor(Color.white)
                        Text("slate").background(Color.slate)
                            .foregroundColor(Color.white)
                        Text("bush").background(Color.bush)
                            .foregroundColor(Color.white)
                    }
                }
            }
            .navigationTitle("QuizJam")
            navigationBarTitleTextColor(Color.maximumYellow)
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
        .environmentObject(ModelData())
    }
}
