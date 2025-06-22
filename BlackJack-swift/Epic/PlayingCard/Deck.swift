//
//  Deck.swift
//  BlackJack-swift
//
//  Created by Theo Sementa on 22/06/2025.
//

import Foundation

@Observable
final class Deck {
    var cards: [PlayingCardModel] = []

    init() {
        self.cards = PlayingCardModel.allCards()
    }

    func shuffle() {
        cards.shuffle()
    }

    func drawCard() -> PlayingCardModel? {
        return cards.isEmpty ? nil : cards.removeFirst()
    }
}
