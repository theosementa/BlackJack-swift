//
//  PlayerGameActionView.swift
//  BlackJack-swift
//
//  Created by Theo Sementa on 22/06/2025.
//

import SwiftUI

struct PlayerGameActionView: View {
    
    // MARK: Dependencies
    let session: GameSession
    
    var body: some View {
        Grid(horizontalSpacing: 16, verticalSpacing: 16) {
            GridRow {
                ActionButtonView(title: "Draw card") {
                    session.playerDrawCard()
                }
                
                ActionButtonView(title: "Double") {
                    session.playerDoubleDown()
                }
            }
            GridRow {
                ActionButtonView(title: "Hold") {
                    session.playerHold()
                }
                
                ActionButtonView(title: "Reset") {
                    session.resetGame()
                }
            }
        }
    }
}

// MARK: - Preview
#Preview {
    PlayerGameActionView(session: .preview)
}
