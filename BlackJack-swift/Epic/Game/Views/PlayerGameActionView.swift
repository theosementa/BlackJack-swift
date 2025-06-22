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
                
                ActionButtonView(title: "Double") {
                    gameManager.playerDoubleDown()
                }
            }
            GridRow {
                ActionButtonView(title: "Hold") {
                    gameManager.playerHold()
                }
                
                ActionButtonView(title: "Reset") {
                    gameManager.resetGame()
                }
            }
        }
    }
}

// MARK: - Preview
#Preview {
    PlayerGameActionView(gameManager: .preview)
}
