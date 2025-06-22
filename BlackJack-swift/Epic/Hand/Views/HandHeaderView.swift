//
//  HandHeaderView.swift
//  BlackJack-swift
//
//  Created by Theo Sementa on 22/06/2025.
//

import SwiftUI

struct HandHeaderView: View {
    
    // MARK: Dependencies
    let name: String
    let value: Int
    
    // MARK: - View
    var body: some View {
        HStack(alignment: .bottom, spacing: 8) {
            Text(name)
                .font(.title2)
                .fullWidth(.leading)
            
            Text("\(value) points")
                .contentTransition(.numericText())
                .font(.title)
                .animation(.smooth, value: value)
        }
    }
}

// MARK: - Preview
#Preview {
    HandHeaderView(name: "Player", value: 21)
}
