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
                CardHandView(cards: viewModel.session.bankHand.cards)
            }
            
            Spacer()
            
            VStack(spacing: 32) {
                VStack(spacing: 16) {
                    Text("Player Hand \(viewModel.session.playerHand.value) \(viewModel.session.playerBet)")
                    
                    CardHandView(cards: viewModel.session.playerHand.cards)
                    
                    if viewModel.session.isGameStarted {
                        Grid(horizontalSpacing: 16, verticalSpacing: 16) {
                            GridRow {
                                Button {
                                    if let card = viewModel.session.deck.drawCard() {
                                        viewModel.session.playerHand.addCard(card)
                                    }
                                } label: {
                                    Text("Draw Card")
                                        .fullWidth()
                                        .padding()
                                }
                                .buttonStyle(.borderedProminent)
                                
                                Button {
                                    viewModel.session.playerHand.reset()
                                } label: {
                                    Text("Reset hand")
                                        .fullWidth()
                                        .padding()
                                }
                                .buttonStyle(.borderedProminent)
                            }
                            GridRow {
                                Button {
                                    viewModel.session.playerHold()
                                } label: {
                                    Text("Hold")
                                        .fullWidth()
                                        .padding()
                                }
                                .buttonStyle(.borderedProminent)
                            }
                        }
                    } else {
                        PokerChipsView(bet: $viewModel.session.playerBet)
                        
                        Button {
                            if viewModel.session.validateBet() {
                                viewModel.session.startGame()
                            }
                        } label: {
                            Text("Bet!")
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
