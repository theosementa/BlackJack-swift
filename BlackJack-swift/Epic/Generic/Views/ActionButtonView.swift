//
//  ActionButtonView.swift
//  BlackJack-swift
//
//  Created by Theo Sementa on 22/06/2025.
//

import SwiftUI

struct ActionButtonView: View {
    
    // MARK: Dependencies
    var title: String
    var action: () -> Void
    
    // MARK: - View
    var body: some View {
        Button {
            action()
        } label: {
            Text(title)
                .font(.system(size: 18, weight: .semibold))
                .fullWidth()
                .padding(12)
        }
        .buttonStyle(.borderedProminent)
    }
}

// MARK: - Preview
#Preview {
    ActionButtonView(title: "Preview") { }
}
