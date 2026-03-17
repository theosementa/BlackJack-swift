//
//  PlayerGameActionView.swift
//  BlackJack-swift
//
//  Created by Theo Sementa on 22/06/2025.
//

import SwiftUI

struct PlayerGameActionView: View {
    
    // MARK: Dependencies
    let gameManager: GameManager
    
    var body: some View {
        Grid(horizontalSpacing: 16, verticalSpacing: 16) {
            GridRow {
                ActionButtonView(title: "Draw card") {
                    gameManager.playerDrawCard()
                }
                .disabled(!gameManager.canPlayerAct)
                
                ActionButtonView(title: "Double") {
                    gameManager.playerDoubleDown()
                }
                .disabled(!gameManager.canPlayerAct || gameManager.playerHand.cards.count != 2)
            }
            GridRow {
                ActionButtonView(title: "Hold") {
                    gameManager.playerHold()
                }
                .disabled(!gameManager.canPlayerAct)
            }
        }
    }
}

// MARK: - Preview
#Preview {
    PlayerGameActionView(gameManager: .preview)
}
