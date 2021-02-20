//
//  CompletionBar.swift
//  QuizJam
//
//  Created by Chaithra Pabbathi on 2/19/21.
//

import SwiftUI

struct CompletionBar: View {
    var percentage: CGFloat
    
    var body: some View {
        print(percentage)
        
        return GeometryReader { geo in
            ZStack(alignment: .bottomLeading) {
                Rectangle()
                    .fill(Color.completionBarBackgroundColor)
                
                Rectangle()
                    .fill(Color.completionBarButtonColor)
                    .frame(width: geo.frame(in: .global).width * percentage)
            }
        }
    }
}

struct CompletionBar_Previews: PreviewProvider {
    static var previews: some View {
        CompletionBar(percentage: 0.24)
    }
}
