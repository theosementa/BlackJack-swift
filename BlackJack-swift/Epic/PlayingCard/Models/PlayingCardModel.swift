//
//  PlayingCardModel.swift
//  BlackJack-swift
//
//  Created by Theo Sementa on 22/06/2025.
//

import Foundation
import SwiftUI

struct PlayingCardModel: Identifiable {
    let id = UUID()
    let suit: CardSuit
    let rank: CardRank
    
    var image: ImageResource {
        return ImageResource(name: "\(suit.rawValue.capitalized)\(rank.rawValue.capitalized)", bundle: .main)
    }
    
    var value: Int {
        switch rank {
        case .ace:
            return 11
        case .two:
            return 2
        case .three:
            return 3
        case .four:
            return 4
        case .five:
            return 5
        case .six:
            return 6
        case .seven:
            return 7
        case .eight:
            return 8
        case .nine:
            return 9
        case .ten, .jack, .queen, .king:
            return 10
        }
    }
}

extension PlayingCardModel {
    
    static func allCards() -> [PlayingCardModel] {
        let suits: [CardSuit] = CardSuit.allCases
        let ranks: [CardRank] = CardRank.allCases
        
        var cards: [PlayingCardModel] = []
        
        for suit in suits {
            for rank in ranks {
                let card = PlayingCardModel(suit: suit, rank: rank)
                cards.append(card)
            }
        }
        
        return cards
    }
    
}
