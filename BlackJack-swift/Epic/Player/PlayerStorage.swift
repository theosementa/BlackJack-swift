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
    
}

extension PlayerStorage {
    
    static func addCoins(_ amount: Int) {
        coins += amount
    }
    
    static func removeCoins(_ amount: Int) {
        guard coins >= amount else { return }
        coins -= amount
    }
    
}
