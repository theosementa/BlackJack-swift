//
//  StatisticsDestination.swift
//  BlackJack-swift
//
//  Created by Theo Sementa on 23/06/2025.
//

import Foundation
import NavigationKit
import  SwiftUI

enum StatisticsDestination: AppDestinationProtocol {
    case statistics
    
    var id: Self { self }
    
    func body(route: Route) -> some View {
        switch self {
        case .statistics:
            StatisticsScreen()
            
        }
    }
}
