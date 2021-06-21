//
//  Player.swift
//  DurakGame
//
//  Created by Дима Носко on 15.06.21.
//

import Foundation

protocol PlayerBaseCompatible {
    var hand: [Card]? { get set }
}

final class Player: PlayerBaseCompatible {
    var hand: [Card]?

    func checkIfCanTossWhenAttacking(card: Card) -> Bool {
        if self.hand != nil {
            return self.hand!.contains(where: { $0.value == card.value })
        } else {
            return false
        }
    }

    func checkIfCanTossWhenTossing(table: [Card: Card]) -> Bool {
        for (cardAttack, cardBeat) in table {
            if self.hand != nil {
                return self.hand!.contains(where: { $0.value == cardAttack.value || $0.value == cardBeat.value })
            }
        }
        return false
    }
}
