//  Character.swift
//  P3RPG
//  Created by REMY on 22/11/2019.
//  Copyright © 2019 RPELG. All rights reserved.

import Foundation

final class Character {
    
    // MARK: - Properties
    
    let name: String
    let type: CharacterType
    
    private(set) var weapon: Weapon
    private(set) var lifePoints: Int
    private(set) var maxLifePoints: Int
    
    /// computed property to check if character is Alive means lifepoints not nil
    var isAlive: Bool {
        return lifePoints > 0
    }
    /// computed property to describe character
    var description: String {
        return "The \(self.type) named \(self.name.uppercased()) armed with \(self.weapon.name.uppercased()) \(self.weapon.action) \(self._isAlive)"
    }
    /// computed property to describe character after fight
    var descriptionAfterFight: String {
        return "\(self.type) named \(self.name.uppercased()) \(self._isAlive)"
    }
    /// computed property with ternary operator to display if character is alive or dead
    private var _isAlive: String {
        return isAlive ? "has \(lifePoints) lifePoints" : "is ☠️ DEAD 💀"
    }
    
    // MARK: - Init
    
    init(name: String, type: CharacterType) {
        self.name = name
        self.type = type
        /// switch on CharacterType cases create personnal lifePoints and Weapons
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
    
    /// Applies damage or healing during a combat phase
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
    /// Permit to replace character weapon with the random weapon
    func updateWeapon(with weapon: Weapon) {
        self.weapon = weapon
    }
}
