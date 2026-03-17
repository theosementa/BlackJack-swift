//
//  StatisticsTileView.swift
//  BlackJack-swift
//
//  Created by Theo Sementa on 17/03/2026.
//

import SwiftUI
import TheoKit

struct StatisticsTileView: View {
    
    let title: String
    let value: String
    var subtitle: String? = nil
    
    // MARK: - View
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(.caption)
                .foregroundStyle(.secondary)
            Text(value)
                .font(.title3.bold())
            if let subtitle {
                Text(subtitle)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(TKDesignSystem.Colors.Background.Theme.bg100)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

// MARK: - Preview
#Preview {
    StatisticsTileView(title: "Games Played", value: "24", subtitle: "Overall")
}
