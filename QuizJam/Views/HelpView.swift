//
//  HelpView.swift
//  QuizJam
//
//  Created by Chaithra Pabbathi on 2/20/21.
//

import SwiftUI

struct HelpView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack (alignment: .leading, spacing: 30) {
            HelpItemView(systemImageName: "hand.tap", description: "Tap a card to flip it. Question is on one side and its answer on the other.")
            HelpItemView(systemImageName: "hand.point.left", description: "Swipe left if you get the answer right. Total number of cards swiped left are shown under the green bar.")
            HelpItemView(systemImageName: "hand.point.right", description: "Swipe right if you get the answer wrong. Total number of cards swiped right are shown under the red bar.")
            
            Button{
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("OK")
                    .fontWeight(.heavy)
                    .padding(8)
                    .padding(.horizontal)
                    .background(Capsule()
                                    .fill(Color.red))
                    .foregroundColor(.white)
            }
            .padding(.top)
            .frame(maxWidth: .infinity, alignment: .center)
        }
        .padding(.horizontal, 60)
    }
}

struct HelpView_Previews: PreviewProvider {
    static var previews: some View {
        HelpView()
    }
}
