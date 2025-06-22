//
//  CardSuit.swift
//  BlackJack-swift
//
//  Created by Theo Sementa on 22/06/2025.
//

import Foundation

enum CardSuit: String, CaseIterable {
    case spike
    case heart
    case diamond
    case clover
    
    var symbol: String {
        switch self {
        case .spike:
            return "♠️"
        case .heart:
            return "♥️"
        case .diamond:
            return "♦️"
        case .clover:
            return "♣️"
        }
    }
}
