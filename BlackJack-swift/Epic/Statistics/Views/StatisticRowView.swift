//
//  StatisticRowView.swift
//  BlackJack-swift
//
//  Created by Theo Sementa on 23/06/2025.
//

import SwiftUI

struct StatisticRowView: View {
    
    let title: String
    let value: String
    var subtitle: String? = nil
    var progress: Double? = nil
    var color: Color = .accentColor
    
    // MARK: - View
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                VStack(alignment: .leading, spacing: 2) {
                    Text(title)
                        .font(.subheadline)
                    if let subtitle {
                        Text(subtitle)
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                }
                Spacer()
                Text(value)
                    .font(.headline)
            }
            if let progress {
                ProgressView(value: progress)
                    .tint(color)
            }
        }
        .fullWidth(.leading)
    }
}

// MARK: - Preview
#Preview {
    StatisticRowView(title: "Wins", value: "12", subtitle: "50%", progress: 0.5, color: .green)
}
