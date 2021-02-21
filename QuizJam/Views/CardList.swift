//
//  CardList.swift
//  QuizJam
//
//  Created by Monika Gorkani on 2/19/21.
//

import SwiftUI

struct CardList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showingEditScreen = false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    init(){
        UITableView.appearance().backgroundColor = UIColor(Color.oceanBlue)
    }
    var body: some View {

        NavigationView {
                ZStack {
                    VStack {
                        List {
                            HStack {
                                Spacer()
                                Text("\(modelData.cards.count) Cards")
                                    .foregroundColor(.secondary)
                                Spacer()
                            }
                            // .background(Color.blizzardBlue)
                            
                            
                            ForEach(modelData.cards) {card in
                                NavigationLink(destination: EditCard(card: card)) {
                                    VStack(alignment: .leading) {
                                        Text(card.prompt)
                                            .font(.headline)
                                            .foregroundColor(.black)
                                            .padding(.bottom, 2)
                                        Text(card.answer)
                                            .font(.subheadline)
                                            .foregroundColor(Color.gray)
                                    }
                                    .padding(.vertical)
                                }
                            }
                            .onDelete(perform: delete)
                            .listRowBackground(Color.white)
                        }
                    }
                    
                    .navigationBarTitle("Flashcard Bank", displayMode: .automatic)
                    .navigationBarItems(leading:
                                            HStack {
                                                Button(action: { self.presentationMode.wrappedValue.dismiss()
                                                },label: {
                                                    Image(systemName: "chevron.backward")
                                                        .imageScale(.large)
                                                        .foregroundColor(Color.snow)
                                                })
                                                EditButton()
                                                    .foregroundColor(Color.snow)
                                                
                                            },
                                        trailing:
                                            Button(action: onAdd) { Image(systemName: "plus")
                                                .imageScale(.large)
                                            })                                                    .foregroundColor(Color.snow)
                }
            
           
        }
        
        .navigationBarHidden(true)
        .sheet(isPresented: self.$showingEditScreen, onDismiss: self.hideEdit, content: {
            AddCard().environmentObject(modelData)
        })
    }
    func dismiss() {
        self.presentationMode.wrappedValue.dismiss()
    }
    func onAdd() {
        self.showingEditScreen = true
    }
    func delete(at offsets: IndexSet) {
        modelData.cards.remove(atOffsets: offsets)
    }
    func hideEdit() {
        self.showingEditScreen = false
    }
    
    
}

struct CardList_Previews: PreviewProvider {
    static var previews: some View {
        CardList().environmentObject(ModelData())
    }
}
