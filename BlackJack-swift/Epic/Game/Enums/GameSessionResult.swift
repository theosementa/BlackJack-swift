//
//  GameSessionResult.swift
//  BlackJack-swift
//
//  Created by Theo Sementa on 22/06/2025.
//

import Foundation

enum GameSessionResult {
    case none
    case playerWin
    case playerWinWithBlackJack
    case bankWin
    case equal
    
    var isPlayerWin: Bool {
        switch self {
        case .playerWin, .playerWinWithBlackJack:
            return true
        default:
            return false
        }
    }
    
    var title: String {
        switch self {
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
    
    func addStatistics() {
        switch self {
        case .playerWin:
            StatisticsManager.addWin()
        case .playerWinWithBlackJack:
            StatisticsManager.addWin()
        case .bankWin:
            StatisticsManager.addLoss()
        case .equal:
            StatisticsManager.addTie()
        case .none:
            break // No action needed for none case
        }
    }
}
