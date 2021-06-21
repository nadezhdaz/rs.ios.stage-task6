//
//  Game.swift
//  DurakGame
//
//  Created by Дима Носко on 16.06.21.
//

import Foundation

protocol GameCompatible {
    var players: [Player] { get set }
}

struct Game: GameCompatible {
    var players: [Player]
}

extension Game {

    func defineFirstAttackingPlayer(players: [Player]) -> Player? {
        var minimumTrump = Card(suit: .clubs, value: .six)
        var firstPlayer = players.randomElement()
        
        for player in players where player.hand != nil {
                for card in player.hand! {
                    if card.isTrump && minimumTrump.checkValue(card: card) {
                        minimumTrump = card
                        firstPlayer = player
                    }
                }
            
        }
        return firstPlayer
    }
    
    

}
