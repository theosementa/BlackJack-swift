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
    
    // MARK: - View
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.caption)
            Text(value)
                .font(.body)
        }
        .fullWidth(.leading)
    }
}

// MARK: - Preview
#Preview {
    StatisticRowView(title: "Preview", value: "200 €")
}
