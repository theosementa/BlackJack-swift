//
//  ActionButtonView.swift
//  BlackJack-swift
//
//  Created by Theo Sementa on 22/06/2025.
//

import SwiftUI
import TheoKit

struct ActionButtonView: View {
    
    // MARK: Dependencies
    var title: String
    var backgroundColor: Color = TKDesignSystem.Colors.Info.c500
    var action: () -> Void
    
    // MARK: - View
    var body: some View {
        Button {
            action()
        } label: {
            Text(title)
                .foregroundStyle(Color.white)
                .font(.system(size: 18, weight: .semibold))
                .fullWidth()
                .padding(TKDesignSystem.Padding.standard)
        }
        .roundedRectangleBorder(
            backgroundColor,
            radius: TKDesignSystem.Radius.standard
        )
    }
}

// MARK: - Preview
#Preview {
    ActionButtonView(title: "Preview") { }
}
