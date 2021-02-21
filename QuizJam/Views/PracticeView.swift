//
//  PracticeView.swift
//  QuizJam
//
//  Created by Chaithra Pabbathi on 2/19/21.
//

import SwiftUI

struct PracticeView: View {
    @State private var cards = [Card]()
    @EnvironmentObject var modelData: ModelData
    
    let screenbounds = UIScreen.main.bounds
    
    @State private var gradedAnswers = [Bool]()
    @State private var currentCard = 0
    @State private var dragOffset = CGSize()
    @State private var dragStartLocation = CGPoint()
    @State private var dragEndLocation = CGPoint()
    
    var rightCount: Int {
        gradedAnswers.filter{ $0 }.count
    }
    
    var wrongCount: Int {
        gradedAnswers.filter{ !$0 }.count
    }
    
    @State private var practiceComplete = false
    
    @Environment(\.presentationMode) var presentationMode
    @State private var showHelp = false
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "xmark")
                            .font(.title3)
                            .foregroundColor(.gray)
                    })
                    
                    Spacer()
                    Button(action: {
                        showHelp.toggle()
                    }, label: {
                        Image(systemName: "questionmark.circle")
                            .font(.title3)
                            .foregroundColor(.gray)
                    })
                    
                   
                }
                
                Spacer()
                
                HStack {
                    Spacer()
                    
                    if !practiceComplete {
                        Text("\(currentCard + 1) / \(cards.count)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .transition(.move(edge: .trailing))
                            .animation(.easeIn)
                            .padding(.trailing, 5)
                    }
                }
            }
            .padding([.horizontal, .top])
            .navigationBarHidden(true)
            
            VStack(spacing: 120) {
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
                                    recordRightAnswer()
                                } else {
                                    recordWrongAnswer()
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
                
                CompletionBar(rightAnswerCount: rightCount, wrongAnswerCount: wrongCount, cardCount: cards.count)
                    .frame(maxHeight: 35)
                    .padding(.horizontal, 30)
                //                .padding(.bottom, 45)
                
            }
            .padding(.horizontal, 45)
            .padding(.vertical, 120)
            .onAppear(perform: {
                cards = modelData.cards.shuffled()
            })
        }
        .sheet(isPresented: $showHelp, content: {
            HelpView()
        })
    }
    
    fileprivate func restartPractice() {
        gradedAnswers.removeAll()
        currentCard = 0
        dragOffset = .zero
        dragStartLocation = CGPoint()
        dragEndLocation = CGPoint()
        practiceComplete = false
    }
    
    fileprivate func saveDragInfo(_ dragInfo: DragGesture.Value) {
        dragOffset = dragInfo.translation
        dragStartLocation = dragInfo.startLocation
        dragEndLocation = dragInfo.location
    }
    
    fileprivate func recordWrongAnswer() {
        gradedAnswers.append(false)
    }
    
    fileprivate func recordRightAnswer() {
        gradedAnswers.append(true)
    }
    
    func getOffset(for index: Int) -> CGSize {
        if index < currentCard {
            if gradedAnswers[index] {
                return CGSize(width: -1 * screenbounds.width, height: -1 * screenbounds.height * 0.25)
            } else {
                return CGSize(width: screenbounds.width, height: -1 * screenbounds.height * 0.25)
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
        PracticeView()
            .preferredColorScheme(.dark)
            .padding()
            .environmentObject(ModelData())
    }
}
