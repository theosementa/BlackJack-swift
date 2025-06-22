//
//  RunningGameScreen.swift
//  BlackJack-swift
//
//  Created by Theo Sementa on 22/06/2025.
//

import SwiftUI

struct RunningGameScreen: View {
    
    // MARK: States
    @State private var viewModel: ViewModel = .init()
    
    // MARK: - View
    var body: some View {
        VStack {
            VStack(spacing: 16) {
                Text("Bank Hand")
                CardHandView(cards: viewModel.bankHand.cards)
            }
            
            Spacer()
            
            VStack(spacing: 32) {
                VStack(spacing: 16) {
                    Text("Player Hand \(viewModel.playerHand.value)")
                    CardHandView(cards: viewModel.playerHand.cards)
                }
                Grid(horizontalSpacing: 16, verticalSpacing: 16) {
                    GridRow {
                        Button {
                            if let card = viewModel.deck.drawCard() {
                                viewModel.playerHand.addCard(card)
                            }
                        } label: {
                            Text("Draw Card")
                                .fullWidth()
                                .padding()
                        }
                        .buttonStyle(.borderedProminent)
                        
                        Button {
                            viewModel.playerHand.reset()
                        } label: {
                            Text("Reset hand")
                                .fullWidth()
                                .padding()
                        }
                        .buttonStyle(.borderedProminent)
                    }
                }
            }
        }
        .padding(24)
    }
}

// MARK: - Preview
#Preview {
    RunningGameScreen()
}
