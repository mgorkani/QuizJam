//
//  AnswerCountView.swift
//  QuizJam
//
//  Created by Chaithra Pabbathi on 2/19/21.
//

import SwiftUI

struct AnswerCountView: View {
    var answerType: AnswerType
    var count: Int
    var animate: Bool = false
    
    var body: some View {
        HStack {
            if answerType == .right {
                Text("\(count)")
                    .font(.system(size: 27, weight: .heavy, design: .rounded))
                Image(systemName: "checkmark.circle.fill")
                    .font(.system(size: 35, weight: .heavy, design: .rounded))
                    .foregroundColor(.green)
            } else {
                Image(systemName: "xmark.circle.fill")
                    .font(.system(size: 35, weight: .heavy, design: .rounded))
                    .foregroundColor(.red)
                Text("\(count)")
                    .font(.system(size: 27, weight: .heavy, design: .rounded))
            }
        }
        .scaleEffect(animate ? 0.8 : 1)
        .animation(animate ? Animation.easeInOut(duration: 1) : .none)
    }
    
    enum AnswerType {
        case right, wrong
    }
}

struct AnswerCountView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            AnswerCountView(answerType: .right, count: 10, animate: false)
            AnswerCountView(answerType: .wrong, count: 10, animate: true)
        }
    }
}
