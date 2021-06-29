//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by CJ Gaspari on 6/28/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            ForEach(0 ..< 3) { row in
                HStack(spacing: 20) {
                    Text("1")
                    Text("2")
                    Text("3")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
