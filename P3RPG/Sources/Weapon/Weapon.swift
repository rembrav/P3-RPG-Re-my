//  Weapon.swift
//  P3RPG
//  Created by REMY on 22/11/2019.
//  Copyright © 2019 RPELG. All rights reserved.

import Foundation

final class Weapon {
    
    // MARK: - Properties
    
    let name: String
    let action: ActionType
    
    // MARK: - Init
    
    /// Constructor with switch case WeaponType depends actionType who depends value of damage or heal
    init(type: WeaponType) {
        self.name = type.stringValue
        switch type {
        case .bomb:
            self.action = .damage(value: 80)
        case .bazooka:
            self.action = .damage(value: 70)
        case .knife:
            self.action = .damage(value: 50)
        case .syringe:
            self.action = .heal(value: 20)
        }
    }
    /// Function who verify if random weapon is compatible with character selected
    func isCompatible(with type: CharacterType) -> Bool {
        switch self.action {
        case .damage:
            return type != .therapist
        case .heal:
            return type == .therapist
        }
    }
}
