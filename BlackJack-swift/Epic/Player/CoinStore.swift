//
//  CoinStore.swift
//  BlackJack-swift
//
//  Created by openclaw-bot-theo on 26/02/2026.
//

import Foundation

protocol CoinStore {
    var currentCoins: Int { get }
    func addCoins(_ amount: Int)
    func removeCoins(_ amount: Int)
}

struct PlayerStorageCoinStore: CoinStore {
    var currentCoins: Int { PlayerStorage.coins }
    
    func addCoins(_ amount: Int) {
        PlayerStorage.addCoins(amount)
    }
    
    func removeCoins(_ amount: Int) {
        PlayerStorage.removeCoins(amount)
    }
}
