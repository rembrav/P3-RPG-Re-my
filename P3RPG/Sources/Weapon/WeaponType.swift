//
//  Weapons.swift
//

import Foundation

// Enumeration of different Weapon Type:

enum WeaponType {
    case bomb
    case bazooka
    case knife
    case syringe
}

extension WeaponType {
    var stringValue: String {
        switch self {
        case .bomb:
            return "Bomb 💣"
        case .bazooka:
            return "Bazooka 💥"
        case .knife:
            return "Knife 🔪"
        case .syringe:
            return "Syringe 💉"
        }
    }
}

enum ActionType {
    case damage(value: Int)
    case heal(value: Int)
}
