//
//  ContentView.swift
//  QuizJam
//
//  Created by Monika Gorkani on 2/19/21.
//

import SwiftUI

struct DetailView: View {
    var body: some View {
        Text("Example Detail View")
    }
}

struct ContentView: View {
    @Environment(\.scenePhase) private var scenePhase
    let saveAction: () -> Void
    @State private var showPreview = false
    @State private var fullScreen = false
    
    init(saveAction: @escaping () -> Void) {
        NavBarTheme.navigationBarColors(background: UIColor(.clear), titleColor: UIColor(Color.maximumYellow))
        self.saveAction = saveAction
    }
    
    var body: some View {
        NavigationView {
            
            ZStack {
                Color.white.edgesIgnoringSafeArea(.all)
                VStack(spacing: 25, content: {
                    NavigationLink(destination: DetailView()) {
                        ButtonTextUI(buttonText: "Practice")
                            .foregroundColor(Color.snow)
                            .background(Color.orangeRed)
                            .cornerRadius(25)
                    }
                    
                    Button(action: {
                        showPreview.toggle()
                    }) {
                        ButtonTextUI(buttonText: "Manage")
                            .foregroundColor(Color.snow)
                            .background(Color.oceanBlue)
                            .cornerRadius(25)
                            .sheet(isPresented: $showPreview, content: {
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
    
    //    @available(iOS 14, *)
    //    func navigationBarTitleTextColor(_ color: Color) -> some View {
    //        let uiColor = UIColor(color)
    //
    //        // Set appearance for both normal and large sizes.
    //        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: uiColor ]
    //        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: uiColor ]
    //
    //        return self
    //    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView() {
            
        }
        .environmentObject(ModelData())
    }
}

