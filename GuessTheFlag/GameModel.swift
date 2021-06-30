//
//  GameModel.swift
//  GuessTheFlag
//
//  Created by CJ Gaspari on 6/29/21.
//

class GameModel {
    public var showingScore: Bool
    public var scoreTitle: String
    public var message: String
    public var score: Int
    
    public init() {
        self.showingScore = false
        self.scoreTitle = ""
        self.message = ""
        self.score = 0
    }
    
    public init(scoreTitle: String, message: String, score: Int, showingScore: Bool) {
        self.scoreTitle = scoreTitle
        self.message = message
        self.score = score
        self.showingScore = showingScore
    }
}
