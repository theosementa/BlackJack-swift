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
    
    var beforeValue: Int {
        if sessionResult == .playerWinWithBlackJack {
            return PlayerStorage.coins - value
        }
        if sessionResult.isPlayerWin {
            return PlayerStorage.coins - value
        } else if sessionResult == .equal {
            return PlayerStorage.coins
        } else {
            return PlayerStorage.coins + value
        }
    }
    
    var earnedValue: Int {
        if sessionResult == .playerWinWithBlackJack {
            return (value * 3 / 2)
        }
        if sessionResult == .equal {
            return 0
        }
        return value
    }
    
    // MARK: - View
    var body: some View {
        VStack(spacing: 32) {
            VStack(spacing: 4) {
                Text(sessionResult.title)
                    .font(.system(size: 48))
                    .fontWeight(.bold)
                    .foregroundColor(color)
                
                Text(description)
                    .font(.title)
                    .fontWeight(.medium)
                    .multilineTextAlignment(.center)
            }
            
            HStack {
                VStack(spacing: 8) {
                    Text("Before")
                        .font(.body)
                    
                    Text("\(beforeValue) €")
                        .font(.title)
                        .fontWeight(.semibold)
                }
                .fullWidth()
                
                VStack(spacing: 8) {
                    Text("After")
                        .font(.body)
                    
                    Text("\(PlayerStorage.coins) €")
                        .font(.title)
                        .fontWeight(.semibold)
                }
                .fullWidth()
            }
            
            ActionButtonView(title: "Continue") {
                sessionResult = .none
            }
        }
        .padding(24)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.opacity(0.6))
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
            return "You earned \(earnedValue) coins!"
        case .bankWin:
            return "You lost \(earnedValue) coins."
        case .equal:
            return "It's a tie! No coins earned or lost."
        case .playerWinWithBlackJack:
            return "Blackjack! You earned \(earnedValue) coins!"
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
