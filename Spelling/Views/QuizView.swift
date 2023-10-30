//
//  QuizView.swift
//  Spelling
//
//  Created by Russell Gordon on 2023-10-30.
//

import SwiftUI

struct QuizView: View {
    
    // MARK: Stored properties
    @State var currentItem = itemsToSpell.randomElement()!
    
    @State var userGuess = ""
    
    @State var currentOutcome: Outcome = .undetermined
    
    @State var history: [Result] = []
    
    // MARK: Computed properties
    var body: some View {
        
        HStack {
            VStack {
                Image(currentItem.imageName)
                    .resizable()
                    .scaledToFit()
                
                HStack {
                    TextField("Enter the name of the item", text: $userGuess)
                        .padding(.horizontal)
                    
                    Text(currentOutcome.rawValue)
                }
                .padding(.horizontal)
                
                HStack {
                    Spacer()
                    
                    Button(action: {
                        newWord()
                    }, label: {
                        Text("New word")
                    })
                    
                    Button(action: {
                        checkGuess()
                    }, label: {
                        Text("Submit")
                    })
                }
                .padding()
            }
            
            List(
                filtering(
                    originalList: history,
                    on: .correct
                )
            ) { currentResult in
                HStack {
                    Image(currentResult.item.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)
                    
                    Text(currentResult.guessProvided)
                    
                    Spacer()
                    
                    Text(currentResult.outcome.rawValue)
                }
            }
        }
        
        
    }
    
    // MARK: Functions
    
    func checkGuess() {
        if userGuess == currentItem.word {
            print("Correct")
            currentOutcome = .correct
        } else {
            print("Incorrect")
            currentOutcome = .incorrect
        }
    }
    
    func newWord() {
        
        // Add the current result to the history
        // Add to start of list so it is always visible once there are many results
        history.insert(
            Result(
                item: currentItem,
                guessProvided: userGuess,
                outcome: currentOutcome
            ),
            at: 0
        )
        // DEBUG: What is in the history list?
        print(history)
        
        // Reset quiz page
        currentItem = itemsToSpell.randomElement()!
        userGuess = ""
        currentOutcome = .undetermined
    }
}

#Preview {
    QuizView()
}
