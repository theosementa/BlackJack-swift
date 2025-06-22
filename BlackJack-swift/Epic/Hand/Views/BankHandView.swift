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
    
    // MARK: - View
    var body: some View {
        if gameManager.isGameStarted {
            VStack(spacing: 16) {
                HandHeaderView(name: "Bank", value: gameManager.bankHand.value)
                CardHandView(cards: gameManager.bankHand.cards)
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
