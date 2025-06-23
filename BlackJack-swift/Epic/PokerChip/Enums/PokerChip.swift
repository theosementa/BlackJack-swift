//
//  PokerChip.swift
//  BlackJack-swift
//
//  Created by Theo Sementa on 22/06/2025.
//

import Foundation
import SwiftUI

enum PokerChip {
    case one
    case five
    case twentyFive
    case fifty
    case oneHundred
    case fiveHundred
    
    var value: Int {
        switch self {
        case .one:
            return 1
        case .five:
            return 5
        case .twentyFive:
            return 25
        case .fifty:
            return 50
        case .oneHundred:
            return 100
        case .fiveHundred:
            return 500
        }
    }
    
    var image: ImageResource {
        switch self {
        case .one:
            return .pokerChipOne
        case .five:
            return .pokerChipFive
        case .twentyFive:
            return .pokerChipTwentyFive
        case .fifty:
            return .pokerChipFifty
        case .oneHundred:
            return .pokerChipOneHundred
        case .fiveHundred:
            return .pokerChipFiveHundred
        }
    }
}
