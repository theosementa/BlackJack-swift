//
//  BankHandView.swift
//  BlackJack-swift
//
//  Created by Theo Sementa on 22/06/2025.
//

import SwiftUI

struct BankHandView: View {
    
    // MARK: Dependencies
    let session: GameSession
    
    // MARK: - View
    var body: some View {
        if session.isGameStarted {
            VStack(spacing: 16) {
                HandHeaderView(name: "Bank", value: session.bankHand.value)
                CardHandView(cards: session.bankHand.cards)
            }
        }
    }
}

// MARK: - Preview
#Preview {
    let session: GameSession = .preview
    BankHandView(session: session)
        .task {
            await session.bankDrawCard()
        }
}
