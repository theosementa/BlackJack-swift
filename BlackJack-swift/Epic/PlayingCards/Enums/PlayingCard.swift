//
//  PlayingCard.swift
//  BlackJack-swift
//
//  Created by Theo Sementa on 21/06/2025.
//

import Foundation

enum CardRank: String, CaseIterable {
    case ace
    case two
    case three
    case four
    case five
    case six
    case seven
    case eight
    case nine
    case ten
    case jack
    case queen
    case king
    
    var title: String {
        return "\(self.rawValue)_card".localized
    }
        
}
