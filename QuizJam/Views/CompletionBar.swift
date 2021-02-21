//
//  CompletionBar.swift
//  QuizJam
//
//  Created by Chaithra Pabbathi on 2/19/21.
//

import SwiftUI

struct CompletionBar: View {
    var rightAnswerCount = 0
    var wrongAnswerCount = 0
    var cardCount = 0
    
    var rightAnswerPercentage: CGFloat {
        if cardCount != 0 {
            return CGFloat(rightAnswerCount) / CGFloat(cardCount)
        } else {
            return 0
        }
    }
    
    var wrongAnswerPercentage: CGFloat {
        if cardCount != 0 {
            return CGFloat(wrongAnswerCount) / CGFloat(cardCount)
        } else {
            return 0
        }
    }
    
    var remainingPercentage: CGFloat {
        if cardCount != 0 {
            return CGFloat(cardCount - rightAnswerCount - wrongAnswerCount) / CGFloat(cardCount)
        } else {
            return 0
        }
    }
    
    var body: some View {
        GeometryReader { geo in
            let totalWidth = geo.frame (in: .global).width
            
            VStack(spacing: 2) {
                HStack(spacing: 0) {
                    Rectangle()
                        .fill(Color.rightAnswerColor)
                        .frame(width: totalWidth * rightAnswerPercentage)
                    
                    Rectangle()
                        .fill(Color.completionBarBackgroundColor)
                    
                    Rectangle()
                        .fill(Color.wrontAnswerColor)
                        .frame(width: totalWidth * wrongAnswerPercentage)
                }
                .frame(maxWidth: .infinity)
                .clipShape(RoundedRectangle(cornerRadius: 25.0))
                .shadow(color: .gray, radius: 5, x: 5, y: 5)
                
                HStack(spacing: 0) {
                    Text("\(rightAnswerCount)")
                        .font(.caption)
                        .foregroundColor(.gray)
                        .frame( maxWidth: totalWidth * rightAnswerPercentage, alignment: .leading)

                    Text("\(cardCount - rightAnswerCount - wrongAnswerCount)")
                        .font(.caption)
                        .foregroundColor(.gray)
                        .frame( maxWidth: totalWidth * remainingPercentage, alignment: .center)

                    Text("\(wrongAnswerCount)")
                        .font(.caption)
                        .foregroundColor(.gray)
                        .frame(maxWidth: totalWidth * wrongAnswerPercentage, alignment: .trailing)
                }
                .animation(.linear)
                .padding(.top, 5)
                .frame(maxWidth: .infinity)
            }
            
        }
    }
}

struct CompletionBar_Previews: PreviewProvider {
    static var previews: some View {
        CompletionBar(rightAnswerCount: 2, wrongAnswerCount: 7, cardCount: 10)
    }
}
