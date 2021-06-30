//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by CJ Gaspari on 6/28/21.
//

import SwiftUI

struct ContentView: View {
    @State private var gameModel: GameModel =
        GameModel(scoreTitle: "New Game", message: "Would you like to start a new game?", score: 0, showingScore: true)
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var countries =
        ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
        .shuffled()

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.black, .blue]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack (spacing: 30) {
                VStack {
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                ForEach(0 ..< 3) { number in
                    Button(action: {
                        self.flagTapped(number)
                        self.askQuestion()
                    }) {
                        Image(self.countries[number])
                            .renderingMode(.original)
                            .clipShape(Capsule())
                            .overlay(Capsule().stroke(Color.white, lineWidth: 1))
                            .shadow(color: .white, radius: 2)
                    }
                }
                Spacer()
                Text("Current score: \(gameModel.score)")
                    .font(.title)
                    .foregroundColor(.white)
            }
        }
        .alert(isPresented: $gameModel.showingScore, content: {
            Alert(title: Text(gameModel.scoreTitle), message: Text(gameModel.message), dismissButton: .default(Text("Continue")) {
                self.askQuestion()
            })
        })
        .statusBar(hidden: true)
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            gameModel.scoreTitle = "Correct"
            gameModel.message = "Your score is \(gameModel.score)"
            gameModel.score += 1
        } else {
            gameModel.showingScore = true
            gameModel.score = 0
            gameModel.message = "The flag you tapped is: \(countries[number])"
            gameModel.scoreTitle = "Incorrect"
        }
        
    }
    
    func askQuestion() {
        //shuffle in place
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
