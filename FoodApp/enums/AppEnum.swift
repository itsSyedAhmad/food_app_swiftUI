//
//  AppEnum.swift
//  FoodApp
//
//  Created by Saif Ahmad on 15/11/26.
//

import Foundation

enum Tab: CaseIterable {
    case home
    case menu
    case favorites
    case orders
    case help

    var title: String {
        switch self {
        case .home: return "Home"
        case .menu: return "Menu"
        case .favorites: return "Favorites"
        case .orders: return "My Orders"
        case .help: return "Help"
        }
    }

    var icon: String {
        switch self {
        case .home: return "house"
        case .menu: return "fork.knife"
        case .favorites: return "heart"
        case .orders: return "receipt"
        case .help: return "questionmark.circle"
        }
    }
}

enum Category: CaseIterable, Hashable {
    case snacks
    case meal
    case vegan
    case dessert
    case drinks
    case none

    var title: String {
        switch self {
        case .snacks:
            return "Snacks"
        case .meal:
            return "Meal"
        case .vegan:
            return "Vegan"
        case .dessert:
            return "Desert"
        case .drinks:
            return "Drinks"
        case .none:
            return "none"
        }
    }

    static var displayCases: [Category] {
        allCases.filter { $0 != .none }
    }
}
