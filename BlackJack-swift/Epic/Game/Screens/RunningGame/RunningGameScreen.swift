//
//  RunningGameScreen.swift
//  BlackJack-swift
//
//  Created by Theo Sementa on 22/06/2025.
//

import SwiftUI
import TheoKit

struct RunningGameScreen: View {
    
    // MARK: States
    @State private var viewModel: ViewModel = .init()
    
    // MARK: - View
    var body: some View {
        VStack {
            BankHandView(session: viewModel.session)
            
            Spacer()
            
            VStack(spacing: 8) {
                Text("Bet")
                    .font(.body)
                
                Text("\(viewModel.session.playerBet) €")
                    .font(.title)
                    .fontWeight(.semibold)
            }
            
            Spacer()
            
            VStack(spacing: 16) {
                PlayerHandView(session: viewModel.session)
                
                if viewModel.session.isGameStarted {
                    PlayerGameActionView(session: viewModel.session)
                } else {
                    VStack(spacing: 8) {
                        Text("Coins available")
                            .font(.body)
                        
                        Text("\(PlayerStorage.coins) €")
                            .font(.title)
                            .fontWeight(.semibold)
                    }
                    
                    PokerChipsView(bet: $viewModel.session.playerBet)
                    
                    ActionButtonView(title: "Bet!") {
                        if viewModel.session.validateBet() {
                            viewModel.session.startGame()
                        }
                    }
                }
            }
        }
        .padding(24)
        .background(TKDesignSystem.Colors.Background.Theme.bg50)
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
                ResultGameScreen(
                    sessionResult: $viewModel.session.sessionResult,
                    value: viewModel.session.playerBet
                )
            }
        }
    }
}

// MARK: - Preview
#Preview {
    RunningGameScreen()
}
