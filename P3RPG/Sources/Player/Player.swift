//  Player.swift
//  P3RPG
//  Created by REMY on 22/11/2019.
//  Copyright © 2019 RPELG. All rights reserved.

import Foundation

final class Player {
    
    // MARK: - Properties
    
    var name: String
    var team: [Character]
    
    // MARK: - Init
    
    init(name: String, team: [Character]) {
        self.name = name
        self.team = team
    }
    
    // MARK: - Actions
    /// Describe each team after characters selection when building teams is over
    func teamPresentation() {
        team.forEach {
            print("You have a hero named \($0.name.uppercased()) who is a \($0.type) armed by a \($0.weapon.name.uppercased())")
        }
    }
    /// Describe each team after party
    func endTeamsDescription() {
        print("Your team statistics are:\n")
        team.forEach {
            $0.type != .therapist ? print("Your hero named \($0.name.uppercased()) the \($0.type) armed by a  \($0.weapon.name.uppercased()) with \($0.lifePoints) lifepoints") :
                print("Your hero named \($0.name.uppercased()) who is \($0.type) armed by a \($0.weapon.name.uppercased()) with  \($0.lifePoints) lifepoints \($0.isAlive ? "but can't ATTACK":"")")
        }
    }
}
/// extension to permit to compare two objects : need to make their properties comparable
extension Player: Equatable {
    static func == (lhs: Player, rhs: Player) -> Bool {
        return String(describing: lhs) == String(describing: rhs) //compare with String the impression of the object : tricks
    }
}

