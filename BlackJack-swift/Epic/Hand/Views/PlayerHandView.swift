//
//  PlayerHandView.swift
//  BlackJack-swift
//
//  Created by Theo Sementa on 22/06/2025.
//

import SwiftUI

struct PlayerHandView: View {
    
    // MARK: Dependencies
    let session: GameSession
    
    // MARK: - View
    var body: some View {
        if session.isGameStarted {
            VStack(spacing: 16) {
                HandHeaderView(name: "Player", value: session.playerHand.value)
                CardHandView(cards: session.playerHand.cards)
            }
        }
    }
}

// MARK: - Preview
#Preview {
    let session: GameSession = .preview
    PlayerHandView(session: session)
        .task {
            await session.bankDrawCard()
        }
}
