//
//  CardHandView.swift
//  BlackJack-swift
//
//  Created by Theo Sementa on 22/06/2025.
//

import SwiftUI

struct CardHandView: View {
    
    // MARK: Dependencies
    var cards: [PlayingCardModel]
    
    // MARK: - View
    var body: some View {
        if cards.isEmpty {
            EmptyView()
        } else {
            ZStack {
                ForEach(Array(cards.enumerated()), id: \.offset) { index, card in
                    Image(card.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                        .offset(x: getHorizontalOffset(for: index))
                        .transition(.move(edge: .trailing))
                }
            }
            .frame(maxWidth: .infinity)
            .animation(.smooth, value: cards.count)
        }
    }
    
    private func getHorizontalOffset(for index: Int) -> CGFloat {
        let totalCards = CGFloat(cards.count)
        let cardWidth: CGFloat = 40
        let totalWidth = cardWidth * (totalCards - 1)
        
        return CGFloat(index) * cardWidth - totalWidth / 2
    }
}

// MARK: - Preview
#Preview {
    CardHandView(cards: PlayingCardModel.allCards())
}
