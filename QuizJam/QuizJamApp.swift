//
//  QuizJamApp.swift
//  QuizJam
//
//  Created by Monika Gorkani on 2/19/21.
//

import SwiftUI

@main
struct QuizJamApp: App {
    @StateObject private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView() {
                modelData.save()
            }
            .environmentObject(modelData)
        }
    }
}
