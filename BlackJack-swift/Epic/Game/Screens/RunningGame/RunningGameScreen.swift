//
//  RunningGameScreen.swift
//  BlackJack-swift
//
//  Created by Theo Sementa on 22/06/2025.
//

import SwiftUI
import TheoKit
import NavigationKit

struct RunningGameScreen: View {
    
    // MARK: States
    @State private var viewModel: ViewModel = .init()
    
    // MARK: - View
    var body: some View {
        VStack {
            BankHandView(gameManager: viewModel.gameManager)
            
            Spacer()
            
            VStack(spacing: 8) {
                Text("Bet")
                    .font(.body)
                
                Text("\(viewModel.gameManager.playerBet) €")
                    .font(.title)
                    .fontWeight(.semibold)
            }
            
            Spacer()
            
            VStack(spacing: 16) {
                PlayerHandView(gameManager: viewModel.gameManager)
                
                if viewModel.gameManager.isGameStarted {
                    PlayerGameActionView(gameManager: viewModel.gameManager)
                } else {
                    VStack(spacing: 8) {
                        Text("Coins available")
                            .font(.body)
                        
                        Text("\(PlayerStorage.coins) €")
                            .contentTransition(.numericText())
                            .font(.title)
                            .fontWeight(.semibold)
                    }
                    
                    PokerChipsView(bet: $viewModel.gameManager.playerBet)
                    
                    ActionButtonView(title: "Bet!") {
                        if viewModel.gameManager.validateBet() {
                            viewModel.gameManager.startGame()
                        }
                    }
                    
                    if viewModel.gameManager.playerBet != 0 {
                        ActionButtonView(
                            title: "Reset bet",
                            backgroundColor: TKDesignSystem.Colors.Background.Theme.bg100
                        ) {
                            viewModel.gameManager.playerBet = 0
                        }
                    }
                }
            }
            .animation(.smooth, value: viewModel.gameManager.playerBet)
        }
        .padding(24)
        .background(TKDesignSystem.Colors.Background.Theme.bg50)
        .overlay {
            if viewModel.isEndGameScreenDisplayed {
                ResultGameScreen(
                    sessionResult: $viewModel.gameManager.sessionResult,
                    value: viewModel.gameManager.playerBet
                )
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                NavigationButton(
                    route: .push,
                    destination: AppDestination.statistics(.statistics)
                ) {
                    Image(systemName: "chart.bar.xaxis")
                }
            }
        }
        .onChange(of: viewModel.gameManager.sessionResult) {
            if viewModel.gameManager.sessionResult == .none {
                viewModel.isEndGameScreenDisplayed = false
                viewModel.gameManager.resetGame()
            } else {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    viewModel.isEndGameScreenDisplayed = true
                    viewModel.gameManager.sessionResult.addStatistics()
                }
            }
        }
    }
}

// MARK: - Preview
#Preview {
    RunningGameScreen()
}
