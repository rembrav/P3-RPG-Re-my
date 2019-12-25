//
//  Chest.swift
//  P3RPG
//
//  Created by REMY on 19/12/2019.
//  Copyright © 2019 RPEG. All rights reserved.
//

import Foundation

final class Chest {
    static func generateRandomWeapon() -> Weapon? {
        let weapons = [Weapon(type: .bomb),
                       Weapon(type: .bazooka),
                       Weapon(type: .knife),
                       Weapon(type: .syringe)]
        let randomIndex = Int.random(in: 0..<(weapons.count*2)) // Pour avoir une chance sur deux
        guard randomIndex < weapons.count else { return nil }
        return weapons[randomIndex]
    }
}
