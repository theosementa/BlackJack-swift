//
//  ChipButtonView.swift
//  BlackJack-swift
//
//  Created by Theo Sementa on 22/06/2025.
//

import SwiftUI

struct ChipButtonView: View {
    
    // MARK: Dependencies
    @Binding var bet: Int
    var chip: PokerChip
    
    // MARK: - View
    var body: some View {
        Button {
            let newBet = bet + chip.value
            if newBet <= PlayerStorage.coins {
                bet += chip.value
            }
        } label: {
            Image(chip.image)
                .resizable()
                .scaledToFit()
        }
    }
}

// MARK: - Preview
#Preview {
    @Previewable @State var bet: Int = 0
    ChipButtonView(bet: $bet, chip: .one)
}
