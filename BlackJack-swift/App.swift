//
//  BlackJack_swiftApp.swift
//  BlackJack-swift
//
//  Created by Theo Sementa on 21/06/2025.
//

import SwiftUI
import TheoKit
import NavigationKit

@main
struct BlackJack_swiftApp: App {
    
    @StateObject private var router: Router<AppDestination> = .init()
    
    var body: some Scene {
        WindowGroup {
            RoutedNavigationStack(router: router) {
                RunningGameScreen()
            }
        }
    }
}
