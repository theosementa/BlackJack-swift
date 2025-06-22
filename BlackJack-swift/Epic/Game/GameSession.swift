//
//  GameSession.swift
//  BlackJack-swift
//
//  Created by Theo Sementa on 22/06/2025.
//

import Foundation

@Observable
final class GameSession {
 
    var deck: Deck = .init()
    
    var bankHand: BankHand = .init()
    var playerHand: PlayerHand = .init()
    
    var playerBet: Int = 0
    var isGameStarted: Bool = false
    
    init() {
        deck.shuffle()
    }
    
}

extension GameSession {
 
    func validateBet() -> Bool {
        guard playerBet > 0 else { return false }
        isGameStarted = true
        return true
    }
    
    func startGame() {
        guard isGameStarted else { return }
        
        playerHand.cards = [deck.drawCard(), deck.drawCard()].compactMap { $0 }
        bankHand.cards = [deck.drawCard()].compactMap { $0 }
    }
    
    func bankDrawCard() {
        while bankHand.value < 17 {
            guard let card = deck.drawCard() else { return }
            bankHand.cards.append(card)
        }
    }
    
    func playerHold() {
        bankDrawCard()
    }

}
