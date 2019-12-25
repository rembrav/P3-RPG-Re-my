//
//  Character.swift
//  

import Foundation

// Character specifications
final class Character {
    
    // MARK: - Properties
    
    let name: String
    let type: CharacterType
    
    private(set) var weapon: Weapon
    private(set) var lifePoints: Int
    private(set) var maxLifePoints: Int
    
    var isAlive: Bool {
        return lifePoints > 0
    }
    
    var description: String {
        return "\(self.type) named \(self.name.uppercased()) armed with \(self.weapon.name.uppercased()) \(self.weapon.action) \(self._isAlive)"
    }
    var descriptionAfterFight: String {
        return "\(self.type) named \(self.name.uppercased()) \(self._isAlive)"
    }
    
    private var _isAlive: String {
        return isAlive ? "has \(lifePoints) lifePoints" : "is ☠️ DEAD 💀"
    }
    
    // MARK: - Init
    
    init(name: String, type: CharacterType) {
        self.name = name
        self.type = type
        
        switch type {
        case .giant:
            self.maxLifePoints = 100
            self.weapon = Weapon(type: .bomb)
        case .dwarf:
            self.maxLifePoints = 70
            self.weapon = Weapon(type: .bazooka)
        case .ninja:
            self.maxLifePoints = 50
            self.weapon = Weapon(type: .knife)
        case .therapist:
            self.maxLifePoints = 10
            self.weapon = Weapon(type: .syringe)
        }
        self.lifePoints = self.maxLifePoints
    }
    
    // MARK: - Actions
    
    func updateLife(with action: ActionType) {
        switch action {
        case .damage(value: let value):
            if value > self.lifePoints {
                self.lifePoints = 0
            } else {
                self.lifePoints -= value
            }
        case .heal(value: let value):
            if value > self.maxLifePoints {
                self.lifePoints = self.maxLifePoints
            } else {
                self.lifePoints += value
            }
        }
    }

    func updateWeapon(with weapon: Weapon) {
        self.weapon = weapon
    }
}
