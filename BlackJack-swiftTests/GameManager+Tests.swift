//
//  GameManager+Tests.swift
//  BlackJack-swiftUITests
//
//  Created by Theo Sementa on 22/06/2025.
//

import Testing
@testable import BlackJack_swift

struct GameManagerTests {
    
    let gameManager = GameManager()
    
}

extension GameManagerTests {
    
    @Test
    func validateBet() {
        gameManager.playerBet = 100
        
        #expect(gameManager.validateBet())
        #expect(gameManager.isGameStarted)
    }
    
    @Test
    func startGame() {
        gameManager.isGameStarted = true
        
        gameManager.startGame()
        
        #expect(gameManager.playerHand.cards.count == 2)
        #expect(gameManager.bankHand.cards.count == 1)
    }
    
    @Test
    func startGameWithBlackjack() {
        gameManager.playerHand.cards = [
            PlayingCardModel(suit: .heart, rank: .ace),
            PlayingCardModel(suit: .spike, rank: .king)
        ]
        
        #expect(gameManager.playerHand.isBlackjack())
    }
    
    @Test
    func resetGame() {
        gameManager.resetGame()
        
        #expect(gameManager.playerHand.cards.isEmpty)
        #expect(gameManager.bankHand.cards.isEmpty)
    }
    
    @Test
    func playerDrawCard() {
        gameManager.isGameStarted = true
        
        gameManager.startGame()
        gameManager.playerDrawCard()
        
        #expect(gameManager.sessionResult == (gameManager.playerHand.value > 21 ? .bankWin : .none))
        #expect(gameManager.playerHand.cards.count == 3)
    }
    
    @Test
    func bankWinWithBetterHand() {
        gameManager.isGameStarted = true
        
        gameManager.playerHand.cards = [
            PlayingCardModel(suit: .heart, rank: .two),
            PlayingCardModel(suit: .spike, rank: .two)
        ]
        
        gameManager.bankHand.cards = [
            PlayingCardModel(suit: .heart, rank: .ace),
            PlayingCardModel(suit: .spike, rank: .four)
        ]
        
        gameManager.evaluateGameResult()
        
        #expect(gameManager.sessionResult == .bankWin)
    }
    
    @Test
    func bankWinWithBlackJack() {
        gameManager.isGameStarted = true
        
        gameManager.playerHand.cards = [
            PlayingCardModel(suit: .heart, rank: .two),
            PlayingCardModel(suit: .spike, rank: .two)
        ]
        
        gameManager.bankHand.cards = [
            PlayingCardModel(suit: .heart, rank: .ace),
            PlayingCardModel(suit: .spike, rank: .king)
        ]
        
        gameManager.evaluateGameResult()
        
        #expect(gameManager.sessionResult == .bankWin)
    }
    
    @Test
    func bankOut() {
        gameManager.isGameStarted = true
        
        gameManager.bankHand.cards = [
            PlayingCardModel(suit: .heart, rank: .king),
            PlayingCardModel(suit: .spike, rank: .king),
            PlayingCardModel(suit: .spike, rank: .king)
        ]
        
        gameManager.evaluateGameResult()
        
        #expect(gameManager.sessionResult == .playerWin)

    }
    
    @Test
    func playWinWithBetterHand() {
        gameManager.isGameStarted = true
        
        gameManager.playerHand.cards = [
            PlayingCardModel(suit: .heart, rank: .king),
            PlayingCardModel(suit: .spike, rank: .king)
        ]
        
        gameManager.bankHand.cards = [
            PlayingCardModel(suit: .heart, rank: .two),
            PlayingCardModel(suit: .spike, rank: .two)
        ]
        
        gameManager.evaluateGameResult()
        
        #expect(gameManager.sessionResult == .playerWin)
    }
    
    @Test
    func playerWinWithBlackJack() {
        gameManager.isGameStarted = true
        
        gameManager.playerHand.cards = [
            PlayingCardModel(suit: .heart, rank: .ace),
            PlayingCardModel(suit: .spike, rank: .king)
        ]
        
        gameManager.bankHand.cards = [
            PlayingCardModel(suit: .heart, rank: .two),
            PlayingCardModel(suit: .spike, rank: .two)
        ]
        
        gameManager.evaluateGameResult()
        
        #expect(gameManager.sessionResult == .playerWinWithBlackJack)
    }
    
    @Test
    func playerOut() {
        gameManager.isGameStarted = true
        
        gameManager.playerHand.cards = [
            PlayingCardModel(suit: .heart, rank: .king),
            PlayingCardModel(suit: .spike, rank: .king),
            PlayingCardModel(suit: .spike, rank: .king)
        ]
        
        gameManager.evaluateGameResult()
        
        #expect(gameManager.sessionResult == .bankWin)
    }
    
    @Test
    func valueAreEqual() {
        gameManager.isGameStarted = true
        
        gameManager.playerHand.cards = [
            PlayingCardModel(suit: .heart, rank: .king),
            PlayingCardModel(suit: .spike, rank: .king)
        ]
        
        gameManager.bankHand.cards = [
            PlayingCardModel(suit: .heart, rank: .queen),
            PlayingCardModel(suit: .spike, rank: .queen)
        ]
        
        gameManager.evaluateGameResult()
        
        #expect(gameManager.sessionResult == .equal)
    }
    
    @Test
    func twoHaveBlackjack() {
        gameManager.isGameStarted = true
        
        gameManager.playerHand.cards = [
            PlayingCardModel(suit: .heart, rank: .ace),
            PlayingCardModel(suit: .spike, rank: .king)
        ]
        
        gameManager.bankHand.cards = [
            PlayingCardModel(suit: .heart, rank: .ace),
            PlayingCardModel(suit: .spike, rank: .king)
        ]
        
        gameManager.evaluateGameResult()
        
        #expect(gameManager.sessionResult == .equal)
    }
    
    
    
}

