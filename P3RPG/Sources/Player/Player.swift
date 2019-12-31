//
//  Player.swift
//  P3RPG
//
//  Created by REMY on 22/11/2019.
//  Copyright © 2019 RPELG. All rights reserved.
//

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
    
    func teamPresentation() {
        team.forEach { (character) in
            print("You have a hero named",character.name.uppercased(),"who is a", character.type,"armed by a", character.weapon.name.uppercased())
        }
    }
    func endTeamsDescription() {
        print("Your characteristics team are:\n")
        team.forEach { (character) in
            if character.type != .therapist {
                print("A hero named",character.name.uppercased(),"who is a", character.type,"armed by a", character.weapon.name.uppercased(),"with",character.lifePoints,"lifepoints")
            }
            else {
                print("A hero named",character.name.uppercased(),"who is a", character.type,"armed by a", character.weapon.name.uppercased(),"with",character.lifePoints,"lifepoints but can't ATTACK")
            }
            
        }
    }
}

