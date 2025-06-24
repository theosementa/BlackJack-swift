//
//  StatisticsScreen.swift
//  BlackJack-swift
//
//  Created by Theo Sementa on 23/06/2025.
//

import SwiftUI
import TheoKit

struct StatisticsScreen: View {
    
    // MARK: - View
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            StatisticRowView(
                title: "Games Played",
                value: "\(StatisticsManager.gamePlayed)"
            )
            
            StatisticRowView(
                title: "Wins",
                value: "\(StatisticsManager.wins)"
            )
            
            StatisticRowView(
                title: "Loses",
                value: "\(StatisticsManager.losses)"
            )
            
            StatisticRowView(
                title: "Ties",
                value: "\(StatisticsManager.ties)"
            )
            
            Button {
                PlayerStorage.addCoins(100)
            } label: {
                Text("Add coins")
            }

            Spacer()
        }
        .padding(24)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(TKDesignSystem.Colors.Background.Theme.bg50)
    }
}

// MARK: - Preview
#Preview {
    StatisticsScreen()
}
