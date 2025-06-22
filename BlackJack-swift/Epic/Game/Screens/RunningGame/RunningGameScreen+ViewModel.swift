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
        var session: GameSession = .init()
        var isEndGameScreenDisplayed: Bool = false
    }
    
}
