//
//  StatisticsScreen.swift
//  BlackJack-swift
//
//  Created by Theo Sementa on 23/06/2025.
//

import SwiftUI
import TheoKit

struct StatisticsScreen: View {
    
    private var formattedWinRate: String {
        return "\(StatisticsManager.winRatePercent)%"
    }
    
    // MARK: - View
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                header
                tiles
                breakdownSection
                Spacer(minLength: 0)
            }
            .padding(24)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(TKDesignSystem.Colors.Background.Theme.bg50)
    }
}

private extension StatisticsScreen {
    
    var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Statistics")
                .font(.title.bold())
            Text("Track your performance across games")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
        .fullWidth(.leading)
    }
    
    var tiles: some View {
        HStack(spacing: 12) {
            StatisticsTileView(
                title: "Games Played",
                value: "\(StatisticsManager.gamePlayed)"
            )
            StatisticsTileView(
                title: "Win Rate",
                value: formattedWinRate,
                subtitle: "Overall"
            )
        }
    }
    
    @ViewBuilder
    var breakdownSection: some View {
        if StatisticsManager.gamePlayed == 0 {
            emptyState
        } else {
            VStack(alignment: .leading, spacing: 12) {
                Text("Breakdown")
                    .font(.headline)
                StatisticRowView(
                    title: "Wins",
                    value: "\(StatisticsManager.wins)",
                    subtitle: "\(Int((StatisticsManager.winRate * 100).rounded()))%",
                    progress: StatisticsManager.winRate,
                    color: .green
                )
                StatisticRowView(
                    title: "Losses",
                    value: "\(StatisticsManager.losses)",
                    subtitle: "\(Int((StatisticsManager.lossRate * 100).rounded()))%",
                    progress: StatisticsManager.lossRate,
                    color: .red
                )
                StatisticRowView(
                    title: "Ties",
                    value: "\(StatisticsManager.ties)",
                    subtitle: "\(Int((StatisticsManager.tieRate * 100).rounded()))%",
                    progress: StatisticsManager.tieRate,
                    color: .orange
                )
            }
            .padding(16)
            .background(TKDesignSystem.Colors.Background.Theme.bg100)
            .clipShape(RoundedRectangle(cornerRadius: 16))
        }
    }
    
    var emptyState: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("No games played yet")
                .font(.headline)
            Text("Play a few rounds to unlock your stats breakdown.")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
        .padding(16)
        .background(TKDesignSystem.Colors.Background.Theme.bg100)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .fullWidth(.leading)
    }
}

// MARK: - Preview
#Preview {
    StatisticsScreen()
}
