//
//  SideMenuOptionModel.swift
//  aa
//
//  Created by depo on 18.07.2024.
//

import Foundation

enum SideMenuOptionModel: Int, CaseIterable, Identifiable {
    case dashboard
    case performance
    case profile
    case search

    case cikisYap
    
    var title: String {
        switch self {
        case .dashboard:
            return "Dashboard"
        case .performance:
            return "Performance"
        case .profile:
            return "Profile"
        case .search:
            return "Search"

        case .cikisYap:
            return "Çıkış Yap"
        }
    }
    
    var systemImageName: String {
        switch self {
        case .dashboard:
            return "filemenu.and.cursorarrow"
        case .performance:
            return "chart.bar"
        case .profile:
            return "person"
        case .search:
            return "magnifyingglass"

        case .cikisYap:
            return "arrow.right.square.fill"
        }
    }
    
    var id: Int { return self.rawValue }
}

