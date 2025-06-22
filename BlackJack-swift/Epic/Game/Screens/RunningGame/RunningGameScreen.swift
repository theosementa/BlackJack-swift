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
                HStack(spacing: 8) {
                    Text("Bank Hand")
                        .font(.title2)
                        .fullWidth(.leading)
                }
                CardHandView(cards: viewModel.session.bankHand.cards)
                
                if viewModel.session.isGameStarted {
                    Text("Value: \(viewModel.session.bankHand.value)")
                        .font(.title3)
                }
            }
            
            Spacer()
            
            VStack(spacing: 16) {
                HStack(spacing: 8) {
                    Text("Player Hand")
                        .font(.title2)
                        .fullWidth(.leading)
                    
                    Text("\(viewModel.session.playerBet) €")
                }
                
                CardHandView(cards: viewModel.session.playerHand.cards)
                
                if viewModel.session.isGameStarted {
                    Text("Value: \(viewModel.session.playerHand.value)")
                        .font(.title3)
                    
                    Grid(horizontalSpacing: 16, verticalSpacing: 16) {
                        GridRow {
                            ActionButtonView(title: "Draw card") {
                                viewModel.session.playerDrawCard()
                            }
                        }
                        GridRow {
                            ActionButtonView(title: "Hold") {
                                viewModel.session.playerHold()
                            }
                            
                            ActionButtonView(title: "Reset") {
                                viewModel.session.resetGame()
                            }
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
        .padding(24)
        .onChange(of: viewModel.session.sessionResult) {
            if viewModel.session.sessionResult == .none {
                viewModel.isEndGameScreenDisplayed = false
                viewModel.session.resetGame()
            } else {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    viewModel.isEndGameScreenDisplayed = true
                }
            }
        }
        .overlay {
            if viewModel.isEndGameScreenDisplayed {
                ResultGameScreen(sessionResult: $viewModel.session.sessionResult, value: 0)
            }
        }
    }
}

// MARK: - Preview
#Preview {
    RunningGameScreen()
}
