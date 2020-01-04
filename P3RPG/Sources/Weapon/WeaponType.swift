//  Weapons.swift
//  P3RPG
//  Created by REMY on 22/11/2019.
//  Copyright © 2019 RPELG. All rights reserved.

import Foundation

// Enumeration of different Weapon Type:

enum WeaponType {
    case bomb
    case bazooka
    case knife
    case syringe
}
// creation extension for having String use of different weapons case
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
// enum to define action of weapon
enum ActionType {
    case damage(value: Int)
    case heal(value: Int)
}
