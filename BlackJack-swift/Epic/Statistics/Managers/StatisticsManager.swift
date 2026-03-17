//
//  StatisticsManager.swift
//  BlackJack-swift
//
//  Created by Theo Sementa on 23/06/2025.
//

import Foundation
import SwiftUI

final class StatisticsManager {
    
    @AppStorage("wins")
    static var wins: Int = 0
    
    @AppStorage("losses")
    static var losses: Int = 0
    
    @AppStorage("ties")
    static var ties: Int = 0
    
}

extension StatisticsManager {
    
    static var gamePlayed: Int {
        return wins + losses + ties
    }
    
    static var winRate: Double {
        guard gamePlayed > 0 else { return 0 }
        return Double(wins) / Double(gamePlayed)
    }
    
    static var lossRate: Double {
        guard gamePlayed > 0 else { return 0 }
        return Double(losses) / Double(gamePlayed)
    }
    
    static var tieRate: Double {
        guard gamePlayed > 0 else { return 0 }
        return Double(ties) / Double(gamePlayed)
    }
    
    static var winRatePercent: Int {
        return Int((winRate * 100).rounded())
    }
    
}

extension StatisticsManager {
    
    static func addWin() {
        wins += 1
    }
    
    static func addLoss() {
        losses += 1
    }
    
    static func addTie() {
        ties += 1
    }
    
}
