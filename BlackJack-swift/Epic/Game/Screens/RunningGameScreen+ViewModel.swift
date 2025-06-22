//
//  RunningGameScreen+ViewModel.swift
//  BlackJack-swift
//
//  Created by Theo Sementa on 22/06/2025.
//

import Foundation

extension RunningGameScreen {
    
    @Observable
    final class ViewModel {
        var deck: Deck = .init()
        
        var bankHand: BankHand = .init()
        var playerHand: PlayerHand = .init()
    }
    
}
