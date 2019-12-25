//
//  Weapon.swift
//  

import Foundation

final class Weapon {
    
    // MARK: - Properties
    
    let name: String
    let action: ActionType
    
    // MARK: - Init
    
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

    func isCompatible(with type: CharacterType) -> Bool {
        switch self.action {
        case .damage:
            return type != .therapist
        case .heal:
            return type == .therapist
        }
    }
}
