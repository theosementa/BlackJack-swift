//
//  ContentView.swift
//  BlackJack-swift
//
//  Created by Theo Sementa on 21/06/2025.
//

import SwiftUI

struct ContentView: View {
    
    @State private var deck = Deck()
    
    @State private var playerHand: PlayerHand = .init()
    
    var body: some View {
        VStack {
            Button {
                if let card = deck.drawCard() {
                    self.playerHand.addCard(card)
                }
            } label: {
                Text("Draw card")
            }
            
            Button {
                self.playerHand.reset()
            } label: {
                Text("Reset Hand")
            }

            ZStack {
                ForEach(Array(playerHand.cards.enumerated()), id: \.offset) { index, card in
                    Image(card.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                        .offset(x: CGFloat(index * 40))
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
