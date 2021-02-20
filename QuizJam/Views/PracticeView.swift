//
//  PracticeView.swift
//  QuizJam
//
//  Created by Chaithra Pabbathi on 2/19/21.
//

import SwiftUI

struct PracticeView: View {
    var cards: [Card]
    var screenbounds = UIScreen.main.bounds
    
    @State private var gradedAnswers = [Bool]()
    @State private var currentCard = 0
    @State private var dragOffset = CGSize()
    @State private var dragStartLocation = CGPoint()
    @State private var dragEndLocation = CGPoint()
    
    @State private var animateRightAnswerCount = false
    @State private var animateWrongAnswerCount = false
    
    var rightCount: Int {
        gradedAnswers.filter{ $0 }.count
    }
    
    var wrongCount: Int {
        gradedAnswers.filter{ !$0 }.count
    }
    
    var body: some View {
        VStack(spacing: 30) {
            ZStack {
                ForEach(0 ..< cards.count, id: \.self) { index in
                    CardView(card: cards[currentCard])
                        .offset(getOffset(for: index))
                        .opacity(index == currentCard ? 1.0 : 0)
                        .animation(.easeOut)
                }
            }
            .gesture(
                DragGesture()
                    .onChanged({ dragInfo in
                        dragOffset = dragInfo.translation
                        dragStartLocation = dragInfo.startLocation
                        dragEndLocation = dragInfo.location
                    })
                    .onEnded { _ in
                        if abs(dragEndLocation.x - dragStartLocation.x) < screenbounds.width * 0.2 {
                            dragOffset = .zero
                        } else {
                            if dragEndLocation.x < dragStartLocation.x {
                                gradedAnswers.append(false)
                                
                                animateWrongAnswerCount.toggle()
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                    animateWrongAnswerCount.toggle()
                                }
                            } else {
                                gradedAnswers.append(true)
                                
                                animateRightAnswerCount.toggle()
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                    animateRightAnswerCount.toggle()
                                }
                            }
                            
                            if currentCard < cards.count - 1 {
                                currentCard += 1
                                dragOffset = .zero
                            }
                        }
                    }
            )
            
            HStack {
                AnswerCountView(answerType: .wrong, count: wrongCount, animate: animateWrongAnswerCount)
                
                Spacer()
                
                AnswerCountView(answerType: .right, count: rightCount, animate: animateRightAnswerCount)
            }
        }
    }
    
    func getOffset(for index: Int) -> CGSize {
        if index < currentCard {
            if gradedAnswers[index] {
                return CGSize(width: 2 * screenbounds.width, height: -1 * screenbounds.height * 0.25)
            } else {
                return CGSize(width: -1 * screenbounds.width, height: -1 * screenbounds.height * 0.25)
            }
        } else if index == currentCard {
            return dragOffset
        } else {
            return .zero
        }
    }
}

struct PracticeView_Previews: PreviewProvider {
    static var previews: some View {
        let cards = ModelData()
        
        PracticeView(cards: cards.cards)
            .padding()
    }
}
