//
//  BankHandView.swift
//  BlackJack-swift
//
//  Created by Theo Sementa on 22/06/2025.
//

import SwiftUI

struct BankHandView: View {
    
    // MARK: Dependencies
    let gameManager: GameManager
    
    private var isHoleCardHidden: Bool {
        gameManager.sessionResult == .none && gameManager.bankHand.cards.count > 1
    }
    
    private var visibleBankCards: [PlayingCardModel] {
        if isHoleCardHidden {
            return Array(gameManager.bankHand.cards.prefix(1))
        }
        return gameManager.bankHand.cards
    }
    
    private var visibleBankValue: Int {
        if isHoleCardHidden {
            return visibleBankCards.first?.value ?? 0
        }
        return gameManager.bankHand.value
    }
    
    // MARK: - View
    var body: some View {
        if gameManager.isGameStarted {
            VStack(spacing: 16) {
                HandHeaderView(name: "Bank", value: visibleBankValue)
                CardHandView(cards: visibleBankCards)
            }
        }
    }
}

// MARK: - Preview
#Preview {
    let gameManager: GameManager = .preview
    BankHandView(gameManager: gameManager)
        .task {
            await gameManager.bankDrawCard()
        }
}
