//
//  PlayerHandView.swift
//  BlackJack-swift
//
//  Created by Theo Sementa on 22/06/2025.
//

import SwiftUI

struct PlayerHandView: View {
    
    // MARK: Dependencies
    let gameManager: GameManager
    
    // MARK: - View
    var body: some View {
        if gameManager.isGameStarted {
            VStack(spacing: 16) {
                HandHeaderView(name: "Player", value: gameManager.playerHand.value)
                CardHandView(cards: gameManager.playerHand.cards)
            }
        }
    }
}

// MARK: - Preview
#Preview {
    let gameManager: GameManager = .preview
    PlayerHandView(gameManager: gameManager)
        .task {
            await gameManager.bankDrawCard()
        }
}
