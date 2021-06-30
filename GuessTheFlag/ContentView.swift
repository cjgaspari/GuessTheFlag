//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by CJ Gaspari on 6/28/21.
//

import SwiftUI

struct ContentView: View {
    var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
    var correctAnswer = Int.random(in: 0...2)

    var body: some View {
        ZStack {
            Color.gray.edgesIgnoringSafeArea(.all)
            VStack (spacing: 30) {
                VStack {
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .bold()
                }
                ForEach(0 ..< 3) { number in
                    Button(action: {
                        //flag was tapped
                    }) {
                        Image(self.countries[number])
                            .renderingMode(.original)
                    }
                }
                Spacer()
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
