//
//  PlayerStorage.swift
//  BlackJack-swift
//
//  Created by Theo Sementa on 22/06/2025.
//

import Foundation
import SwiftUI

final class PlayerStorage {
    
    @AppStorage("coins")
    static private(set) var coins: Int = 1000
    
    @AppStorage("wins")
    static private(set) var wins: Int = 0
    
    @AppStorage("losses")
    static private(set) var losses: Int = 0
    
    @AppStorage("ties")
    static private(set) var ties: Int = 0
    
}

extension PlayerStorage {
    
    static var gamePlayed: Int {
        return wins + losses + ties
    }
    
}

extension PlayerStorage {
    
    static func addWin() {
        wins += 1
    }
    
    static func addLoss() {
        losses += 1
    }
    
    static func addTie() {
        ties += 1
    }
    
    static func addCoins(_ amount: Int) {
        coins += amount
        print("🔥 ADD")
    }
    
    static func removeCoins(_ amount: Int) {
        guard coins >= amount else { return }
        coins -= amount
        print("🔥 REMOVE")
    }
    
}
