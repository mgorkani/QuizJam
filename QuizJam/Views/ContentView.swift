//
//  ContentView.swift
//  QuizJam
//
//  Created by Monika Gorkani on 2/19/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {

            
        let cream = Color(red: 0.96, green: 0.95, blue: 0.87, opacity: 1)
        let burntSienna = Color(red: 0.88, green: 0.48, blue: 0.37, opacity: 1)
        let eggShell = Color(red: 0.95, green: 0.80, blue: 0.56,opacity: 1 )
        let slate = Color(red: 0.24, green: 0.25, blue: 0.36, opacity: 1)
        let bush = Color(red: 0.51, green: 0.70, blue: 0.60, opacity: 1)
        
//        let backgroundColor = LinearGradient(gradient: Gradient(colors: [burntSienna, slate]), startPoint: .top, endPoint: .bottom)
        
        
        ZStack {
           // backgroundColor.ignoresSafeArea()
            slate.ignoresSafeArea()
            VStack(spacing: 100) {
                Button(action: {
                    print("Button was tapped")
                }) {
                    Text("Practice")
                        .font(.largeTitle).bold()
                        .foregroundColor(cream)
                        .padding()
                        .background(burntSienna)
                        .cornerRadius(25)
                }
                
                Button(action: {
                    print("Button was tapped")
                }) {
                    Text("Manage")
                        .font(.largeTitle).bold()
                        .foregroundColor(cream)
                        .padding()
                        .background(bush)
                        .cornerRadius(25)

                }
            }
        }
       // .background(cream)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
