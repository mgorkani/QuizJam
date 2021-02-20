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
    
    var completePercentage: CGFloat {
        CGFloat(currentCard) / CGFloat(cards.count)
    }
    
    @State private var practiceComplete = false
    
    var body: some View {
        VStack(spacing: 30) {
            ZStack(alignment: .bottomLeading) {
                ForEach(0 ..< cards.count, id: \.self) { index in
                    CardView(card: cards[index])
                        .offset(getOffset(for: index))
                        .opacity(!practiceComplete && index == currentCard ? 1.0 : 0)
                        .animation(.easeOut)
                }
                
                Button {
                    restartPractice()
                } label: {
                    Label("Restart", systemImage: "arrow.counterclockwise")
                        .font(.largeTitle)
                        .foregroundColor(.fontColor)
                }
                .disabled(!practiceComplete)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                .background(CardBackground())
                .opacity(practiceComplete ? 1 : 0)
            }
            .gesture(
                DragGesture()
                    .onChanged({ dragInfo in
                        guard currentCard < cards.count else {
                            return
                        }
                        
                        saveDragInfo(dragInfo)
                    })
                    .onEnded { _ in
                        guard currentCard < cards.count else {
                            return
                        }
                        
                        if abs(dragEndLocation.x - dragStartLocation.x) < screenbounds.width * 0.2 {
                            dragOffset = .zero
                        } else {
                            if dragEndLocation.x < dragStartLocation.x {
                                recordWrongAnswer()
                            } else {
                                recordRightAnswer()
                            }
                            
                            if currentCard < cards.count - 1 {
                                currentCard += 1
                                dragOffset = .zero
                            } else {
                                currentCard += 1
                                practiceComplete = true
                            }
                        }
                    }
            )
            
            CompletionBar(percentage: completePercentage)
                .frame(maxHeight: 10)
                .clipShape(RoundedRectangle(cornerRadius: 25.0))
            
            HStack {
                AnswerCountView(answerType: .wrong, count: wrongCount, animate: animateWrongAnswerCount)
                
                Spacer()
                
                AnswerCountView(answerType: .right, count: rightCount, animate: animateRightAnswerCount)
            }
        }
    }
    
    fileprivate func restartPractice() {
        gradedAnswers.removeAll()
        currentCard = 0
        dragOffset = .zero
        dragStartLocation = CGPoint()
        dragEndLocation = CGPoint()
        animateRightAnswerCount = false
        animateWrongAnswerCount = false
        practiceComplete = false
    }
    
    fileprivate func saveDragInfo(_ dragInfo: DragGesture.Value) {
        dragOffset = dragInfo.translation
        dragStartLocation = dragInfo.startLocation
        dragEndLocation = dragInfo.location
    }
    
    fileprivate func recordWrongAnswer() {
        gradedAnswers.append(false)
        
        animateWrongAnswerCount.toggle()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            animateWrongAnswerCount.toggle()
        }
    }
    
    fileprivate func recordRightAnswer() {
        gradedAnswers.append(true)
        
        animateRightAnswerCount.toggle()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            animateRightAnswerCount.toggle()
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
