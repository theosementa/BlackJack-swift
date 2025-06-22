//
//  Hand.swift
//  BlackJack-swift
//
//  Created by Theo Sementa on 22/06/2025.
//

import Foundation

protocol Hand {
    var cards: [PlayingCardModel] { get set }
    
    var value: Int { get }
        
    func isBlackjack() -> Bool
}

extension Hand {
    mutating func addCard(_ card: PlayingCardModel) {
        cards.append(card)
    }
    
    mutating func reset() {
        cards.removeAll()
    }
    
    func isBlackjack() -> Bool {
        return value == 21 && cards.count == 2
    }
 
    var value: Int {
        var totalValue = 0
        var acesCount = 0
        
        for card in cards {
            totalValue += card.value
            if card.rank == .ace {
                acesCount += 1
            }
        }
        
        while totalValue > 21 && acesCount > 0 {
            totalValue -= 10
            acesCount -= 1
        }
        
        return totalValue
    }
}
