//
//  PokerChipsView.swift
//  BlackJack-swift
//
//  Created by Theo Sementa on 22/06/2025.
//

import SwiftUI

struct PokerChipsView: View {
    
    // MARK: Dependencies
    @Binding var bet: Int
    
    @State private var heightChip: CGFloat = 0
    
    // MARK: - View
    var body: some View {
        VStack {
            HStack {
                ChipButtonView(bet: $bet, chip: .one)
                    .getSize { self.heightChip = $0.height }
                ChipButtonView(bet: $bet, chip: .five)
                ChipButtonView(bet: $bet, chip: .twentyFive)
                ChipButtonView(bet: $bet, chip: .fifty)
            }
            
            HStack {
                ChipButtonView(bet: $bet, chip: .oneHundred)
                    .frame(width: heightChip, height: heightChip)
                
                ChipButtonView(bet: $bet, chip: .fiveHundred)
                    .frame(width: heightChip, height: heightChip)
            }
        }
    }
}

// MARK: - Preview
#Preview {
    @Previewable @State var bet: Int = 0
    PokerChipsView(bet: $bet)
}
