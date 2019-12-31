//  Chest.swift
//  P3RPG
//  Created by REMY on 19/12/2019.
//  Copyright © 2019 RPELG. All rights reserved.

import Foundation
/// class Chest : random weapon appears when player is gonna to choose his fighter
final class Chest {
    static func generateRandomWeapon() -> Weapon? {
        let weapons = [Weapon(type: .bomb),
                       Weapon(type: .bazooka),
                       Weapon(type: .knife),
                       Weapon(type: .syringe)]
        let randomIndex = Int.random(in: 0..<(weapons.count*2)) // To have a 50% chance
        guard randomIndex < weapons.count else { return nil }
        return weapons[randomIndex]
    }
}
