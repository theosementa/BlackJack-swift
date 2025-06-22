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
    var sessionResult: GameSessionResult = .none
    var isGameStarted: Bool = false
    
}

extension GameSession {
    
    func validateBet() -> Bool {
        guard playerBet > 0 else { return false }
        isGameStarted = true
        deck.shuffle()
        return true
    }
    
    func startGame() {
        guard isGameStarted else { return }
        
        playerHand.cards = [deck.drawCard(), deck.drawCard()].compactMap { $0 }
        bankHand.cards = [deck.drawCard()].compactMap { $0 }
    }
    
    func resetGame() {
        deck = Deck()
        bankHand = BankHand()
        playerHand = PlayerHand()
        playerBet = 0
        isGameStarted = false
    }
    
    func bankDrawCard() async {
        while bankHand.value < 17 {
            guard let card = deck.drawCard() else { return }
            bankHand.cards.append(card)
            
            try? await Task.sleep(for: .seconds(0.8))
        }
    }

    func playerDrawCard() {
        guard isGameStarted else { return }
        
        if let card = deck.drawCard() {
            playerHand.cards.append(card)
        }
        
        if playerHand.value > 21 {
            sessionResult = .bankWin
            PlayerStorage.removeCoins(playerBet)
        } else if playerHand.value == 21 {
            playerHold()
        }
    }
    
    func evaluateGameResult() {
        guard isGameStarted else { return }
        
        if playerHand.value > 21 {
            sessionResult = .bankWin
            PlayerStorage.removeCoins(playerBet)
            return
        }
        
        if playerHand.isBlackjack() {
            if bankHand.isBlackjack() {
                sessionResult = .equal
            } else {
                sessionResult = .playerWinWithBlackJack
                PlayerStorage.addCoins(playerBet)
            }
            return
        }
        
        if bankHand.value > 21 {
            sessionResult = .playerWin
            PlayerStorage.addCoins(playerBet)
            return
        }
        
        if playerHand.value > bankHand.value {
            sessionResult = .playerWin
            PlayerStorage.addCoins(playerBet)
        } else if playerHand.value < bankHand.value {
            sessionResult = .bankWin
            PlayerStorage.removeCoins(playerBet)
        } else {
            sessionResult = .equal
        }
    }
    
    func playerDoubleDown() {
        playerBet *= 2
        playerDrawCard()
        playerHold()
    }
    
    func playerHold() {
        Task {
            await bankDrawCard()
            evaluateGameResult()
        }
    }
    
}

// MARK: - Mocks
extension GameSession {
    
    static let preview = GameSession()
    
}

