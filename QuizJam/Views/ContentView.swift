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
                    NavigationLink(destination: CardList()) {
                    HStack(spacing: 25, content: {
                        NavigationLink(destination: Text("Practice")){
                            ButtonTextUI(buttonText: "Practice")
                                .foregroundColor(Color.snow)
                                .background(Color.orangeRed)
                                .cornerRadius(25)
                        }
                        NavigationLink(destination: CardList()) {

                            ButtonTextUI(buttonText: "Manage")
                                .foregroundColor(Color.snow)
                                .background(Color.oceanBlue)
                                .cornerRadius(25)
                        }
                    })

//                    //Sample Palettes
//                    Spacer()
//                    Section(header: Text("Palette 1")) {
//                        Text("SSSS").background(Color.snow)
//                            .foregroundColor(Color.black)
//                        Text("orangeRed").background(Color.orangeRed)
//                            .foregroundColor(Color.snow)
//
//                        Text("maximumYellow").background(Color.maximumYellow)
//                            .foregroundColor(Color.snow)
//
//                        Text("oceanBlue").background(Color.oceanBlue)
//                            .foregroundColor(Color.snow)
//
//                        Text("carribeanOcean").background(Color.carribeanOcean)
//                            .foregroundColor(Color.snow)
//
//                        Text("blizzardBlue").background(Color.blizzardBlue)
//                            .foregroundColor(Color.black)
//                    }
//                    Spacer()

                    }
                    Spacer()
            }
        }
            .navigationTitle("QuizJam")
           // navigationBarTitleTextColor(Color.maximumYellow)
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
