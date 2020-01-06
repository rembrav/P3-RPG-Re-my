//  Game.swift
//  P3RPG
//  Created by REMY on 22/11/2019.
//  Copyright © 2019 RPELG. All rights reserved.

final class Game {
    
    // MARK: - Properties
    
    private let maxPlayers = 2
    private let maxCharacters = 3
    private var players: [Player] = []
    private var uniqueNames: [String] = []
    var round = 0
    
    // MARK: - Start
    
    /// Main progress function of the Game load main functions
    func start() {
        print("------------------------------------------------------------")
        print("\n\nWelcome into this New Fighting Game !!!!🥇💥☠️⚔️🏆🦠👊🎁💣\n\n")
        print("------------------------------------------------------------")
        print("\n\n——————————— Prepare to fight 🔫💣🔪👊 ———————————\n")
        settings()
        play()
        end()
    }
    
    // MARK: - Private
    
    /// Loop function create player while count players inferior maxplayers game by team
    private func settings() {
        repeat {
            print("\n\n👋 NICE TO WELCOME YOU NEW PLAYER! 👋\n\n")
            let name = createName()
            print("\n\nWelcome \(name.uppercased())")
            let team = createTeam()
            let player = Player(name: name,
                                team: team)
            players.append(player)
            
        } while players.count < maxPlayers
        printPlayersDescription()
    }
    /// Central function with loop as long as 2 conditions are not reached : no character alive and not therapist character
    private func play() {
        repeat {
            let player1 = players[0]
            let player2 = players[1]
            print("\n\n\n\n---------It's time to fight--------- 🤺🤺💥\n")
            print("\n🥇 Please \(player1.name.uppercased()) select a character in your team to Attack : 🥇\n\n")
            let fighterChosen = selectCharacter(from: player1.team)
            
            if let randomWeapon = Chest.generateRandomWeapon(), randomWeapon.isCompatible(with: fighterChosen.type) {
                print("🎁 You are Lucky a Chest with a Random Weapon will appear, maybe it's gonna Help You...🎁\n")
                print("The random Weapon that you have now is \(randomWeapon.name) with \(randomWeapon.action) \n")
                print("This \(randomWeapon.name) replace the \(fighterChosen.weapon.name) weapon with \(fighterChosen.weapon.action) that \(fighterChosen.name.uppercased()) the \(fighterChosen.type) had!\n\n\n")
                fighterChosen.updateWeapon(with: randomWeapon)
            }
            var targetedCharacter: Character!
            if fighterChosen.type == .therapist{
                print("💊You are going to heal a character in your team💉\n\n")
                targetedCharacter = selectCharacter(from: player1.team)
            } else {
                print("\n🥈 Please \(player1.name.uppercased()) select a character in \(player2.name.uppercased()) team to choose the Defender : 🥈\n\n")
                targetedCharacter = selectCharacter(from: player2.team)
                print("\n\n\n\(fighterChosen.description) is going to attack the \(targetedCharacter.name.uppercased()) target :\n")
            }
            print(targetedCharacter.description)
            fighterChosen.type == .therapist ? print("\n\nthe character is being treated...🧬🦠\n--------🚑🚑🚑💪💪💪--------\n\n"):
            print("\n\n-----Characters are Fighting------\n\n---------⚔️🤺🔪💣💥😱☠️-------------\n\n")
            targetedCharacter.updateLife(with: fighterChosen.weapon.action)
            print("The round ended the \(targetedCharacter.descriptionAfterFight)\n\n\n")
            round+=1
            players.swapAt(0, 1)
        } while !players.contains(where: { !$0.team.contains(where: { $0.isAlive && $0.type != .therapist }) })
    }
    /// Display winner, stats, and restart game
    private func end() {
        print ("💪🏆🥇 Congratulations \(declareWinner()) you are the WINNER !!! 👏🍾")
        displayRounds()
        choosePlayOrStats()
        start()
    }
    
    // MARK: - Helpers
    /// Write and check names for players and characters
    func createName() -> String {
        var name = ""
        repeat {
            print("Please write your name! Enjoy ✍️:")
            if let inputText = readLine() {
                name = inputText
            }
            if uniqueNames.contains(name) {
                print("\n⛔️ This name is already given, please choose another one 😉\n")
            }
        } while name.isEmpty || uniqueNames.contains(name)
        uniqueNames.append(name)
        return name
    }
    /// Creation team for the two palyers
    func createTeam() -> [Character] {
        var teamCharacters: [Character] = []
        var numbChar = 3
        repeat {
            numbChar != 1 ? print("\nNow! you have to choose and name one by one \(numbChar) different characters left to build your team: \n\n")
                : print("\nNow! you have to choose \(numbChar) last character left to build your team: \n\n")
            print("""
                            🚧----Welcome to your Team Builder----🚧\n
                     \nPlease read the following description carefully in order to choose your characters:
                     1.Giant - Life 100 - Bomb power 80 - no healing
                     2.Dwarf - Life 70 - Bazooka power 70 - no healing
                     3.Ninja - Life 50 - Knife power 50 - no healing
                     4.Therapist - Life 10 - Syringe power 0 CAN'T ATTACK JUST healing 20
                     """)
            print("\nPlease enter the number of your character choice, remember you can have only one Therapist:")
            
            if let stringChoice = readLine(), let rowValue = Int(stringChoice), let type = CharacterType(rawValue: rowValue) {
                let name = createName()
                let character = Character(name: name, type: type)
                if !teamCharacters.contains(where: { character in
                    character.type == type
                }) {
                    teamCharacters.append(character)
                    numbChar -= 1
                    print("\n\nWelcome \(name.uppercased())")
                    print("\nYou have now a \(type) in your Team!!!\n\n\n")
                } else {
                    print("\n⛔️Sorry but you have already chosen this character type! they must all be different⛔️\n\n")
                }
            }
        } while teamCharacters.count < maxCharacters
        return teamCharacters
    }
    /// Display the teams of the two players when their build is finished
    func printPlayersDescription() {
        print("\n---------------------------------------------------------------------------------------------\n")
        print("\n\nGood Job! we can show you now the players with their team :\n")
        players.forEach {(player) in
            print("\nPlayer",player.name.uppercased(),":\n")
            player.teamPresentation()
        }
    }
    /// Select character from team
    func selectCharacter(from team: [Character]) -> Character {
        var character: Character! = nil
        print("To choose, enter a number between 0 and \((team.count)-1):\n")
        team.enumerated().forEach {
            print ("\($0):\n \($1.description) \n")
        }
        repeat {
            print("Be carrefull you have to choose a character ALIVE:")
            if let stringChoice = readLine(), let index = Int(stringChoice), index <= team.count {
                let selectedCharacter = team[index]
                if selectedCharacter.isAlive {
                    print("\n✅ You've chosen \(selectedCharacter.type)\n\n")
                    character = selectedCharacter
                }
            }
        } while character == nil
        return character
    }
    /// Declare the winner
    func declareWinner()-> String {
        var winnerName = ""
        let player1 = players[0]
        let player2 = players[1]
        if player1.team.contains(where: { $0.isAlive && $0.type != .therapist }) {
            winnerName = player1.name.uppercased()
        }
        else { winnerName = player2.name.uppercased() }
        return winnerName
    }
    /// Display rounds
    func displayRounds() {
        print("          👊 You WIN the Game in \(round) rounds 👊")
    }
    /// Display stats of last party
    func endTeamsStats() {
        let player1 = players[0]
        let player2 = players[1]
        declareWinner() == player1.name.uppercased() ? print("\n\nPlayer: \(player1.name.uppercased()) the Winner 🏆 \n") : print ("\n\nPlayer: \(player1.name.uppercased()) the Looser 😭\n")
        player1.endTeamsDescription()
        declareWinner() == player2.name.uppercased() ? print("\n\nPlayer: \(player2.name.uppercased()) the Winner 🏆 \n") : print ("\n\nPlayer: \(player2.name.uppercased()) the Looser 😭\n")
        player2.endTeamsDescription()
        choosePlayOrStats()
    }
    /// function to permit choice between play again or show stats
    func choosePlayOrStats() {
        let player1 = players[0]
        let player2 = players[1]
        print("\nIf you want to:\nPlay Again: Press 1\nShow Stats about last party: Press 2")
        if let choice = readLine() {
            switch choice {
            case "1":
                players.removeAll()
                uniqueNames.removeAll()
                round = 0
                player1.team.removeAll()
                player2.team.removeAll()
                start()
            case "2":
                endTeamsStats()
            default: print("\n⛔️Sorry you have to choose one of two choices\n")
                choosePlayOrStats()
            }
        }
    }
}
