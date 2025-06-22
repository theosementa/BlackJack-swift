//
//  ResultGameScreen.swift
//  BlackJack-swift
//
//  Created by Theo Sementa on 22/06/2025.
//

import SwiftUI

struct ResultGameScreen: View {
    
    // MARK: Dependencies
    @Binding var sessionResult: GameSessionResult
    var value: Int
    
    // MARK: - View
    var body: some View {
        VStack(spacing: 32) {
            VStack(spacing: 4) {
                Text(title)
                    .font(.system(size: 48))
                    .fontWeight(.bold)
                    .foregroundColor(color)
                
                Text(description)
                    .font(.title)
                    .fontWeight(.medium)
                    .multilineTextAlignment(.center)
            }
            
            ActionButtonView(title: "Continue") {
                sessionResult = .none
            }
        }
        .padding(24)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.opacity(0.6))
    }
    
    var title: String {
        switch sessionResult {
        case .playerWin:
            return "You Win!"
        case .bankWin:
            return "You Lose!"
        case .equal:
            return "It's a Tie!"
        case .playerWinWithBlackJack:
            return "Blackjack! You Win!"
        case .none:
            return "Game Over"
        }
    }
    
    var color: Color {
        switch sessionResult {
        case .playerWin, .playerWinWithBlackJack:
            return .green
        case .bankWin:
            return .red
        case .none, .equal:
            return .gray
        }
    }
    
    var description: String {
        switch sessionResult {
        case .playerWin:
            return "You earned \(value) coins!"
        case .bankWin:
            return "You lost \(value) coins."
        case .equal:
            return "It's a tie! No coins earned or lost."
        case .playerWinWithBlackJack:
            return "Blackjack! You earned \(value) coins!"
        case .none:
            return "Game Over"
        }
    }
    
}

// MARK: - Preview
#Preview {
    ResultGameScreen(sessionResult: .constant(.playerWin), value: 100)
}

#Preview {
    ResultGameScreen(sessionResult: .constant(.bankWin), value: 200)
}
