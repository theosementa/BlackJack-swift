//
//  GameManager.swift
//  BlackJack-swift
//
//  Created by Theo Sementa on 22/06/2025.
//

import Foundation

@Observable
final class GameManager {
    
    private(set) var deck: Deck = .init()
    private(set) var bankHand: BankHand = .init()
    private(set) var playerHand: PlayerHand = .init()
    
    private let coinStore: CoinStore
    
    var playerBet: Int = 0
    var sessionResult: GameSessionResult = .none
    var isGameStarted: Bool = false
    
    init(coinStore: CoinStore = PlayerStorageCoinStore()) {
        self.coinStore = coinStore
    }
    
}

extension GameManager {
    
    func validateBet() -> Bool {
        guard playerBet > 0, playerBet <= coinStore.currentCoins else { return false }
        
        isGameStarted = true
        deck.shuffle()
        return true
    }
    
    func startGame() {
        guard isGameStarted else { return }
        
        playerHand.cards = [deck.drawCard(), deck.drawCard()].compactMap { $0 }
        bankHand.cards = [deck.drawCard()].compactMap { $0 }
        
        if playerHand.isBlackjack() {
            playerHold()
        }
    }
    
    func resetGame() {
        deck = Deck()
        bankHand = BankHand()
        playerHand = PlayerHand()
        playerBet = 0
        sessionResult = .none
        isGameStarted = false
    }
    
    func playerDrawCard() {
        guard isGameStarted else { return }
        
        if let card = deck.drawCard() {
            playerHand.cards.append(card)
            
            if playerHand.value > 21 {
                sessionResult = .bankWin
                coinStore.removeCoins(playerBet)
            } else if playerHand.value == 21 {
                playerHold()
            }
        }
    }
    
    func playerDoubleDown() {
        guard isGameStarted, playerHand.cards.count == 2 else { return }
        
        let doubledBet = playerBet * 2
        guard doubledBet <= coinStore.currentCoins else { return }
        
        playerBet = doubledBet
        playerDrawCard()
        playerHold()
    }
    
    func playerHold() {
        Task {
            await bankDrawCard()
            evaluateGameResult()
        }
    }
    
    func bankDrawCard() async {
        while bankHand.value < 17 {
            guard let card = deck.drawCard() else { return }
            bankHand.cards.append(card)
            
            try? await Task.sleep(for: .seconds(0.8))
        }
    }
    
    func evaluateGameResult() {
        guard isGameStarted, sessionResult == .none else { return }
        
        if playerHand.value > 21 {
            sessionResult = .bankWin
            coinStore.removeCoins(playerBet)
            return
        }
        
        if playerHand.isBlackjack() {
            if bankHand.isBlackjack() {
                sessionResult = .equal
            } else {
                sessionResult = .playerWinWithBlackJack
                coinStore.addCoins(playerBet * 3 / 2)
            }
            return
        }
        
        if bankHand.value > 21 {
            sessionResult = .playerWin
            coinStore.addCoins(playerBet)
            return
        }
        
        if playerHand.value > bankHand.value {
            sessionResult = .playerWin
            coinStore.addCoins(playerBet)
        } else if playerHand.value < bankHand.value {
            sessionResult = .bankWin
            coinStore.removeCoins(playerBet)
        } else {
            sessionResult = .equal
        }
    }
    
}

// MARK: - Mocks
extension GameManager {
    
    static let preview = GameManager()
    
}
