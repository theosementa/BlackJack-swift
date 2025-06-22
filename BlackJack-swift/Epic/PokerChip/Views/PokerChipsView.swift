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
    
    // MARK: - View
    var body: some View {
        HStack {
            ChipButtonView(bet: $bet, chip: .one)
            ChipButtonView(bet: $bet, chip: .five)
            ChipButtonView(bet: $bet, chip: .twentyFive)
            ChipButtonView(bet: $bet, chip: .fifty)
        }
    }
}

// MARK: - Preview
#Preview {
    @Previewable @State var bet: Int = 0
    PokerChipsView(bet: $bet)
}
