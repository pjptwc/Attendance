//: Playground - noun: a place where people can play

import UIKit


class GameManager {
    
    var homeTeam: Team?
    var visitingTeam: Team?
    
    var halfInnings: [HalfInning]?
    
    init(homeTeam: Team, visitingTeam: Team) {
        self.homeTeam = homeTeam
        self.visitingTeam = visitingTeam
    }

}


class Team {
    
    var name: String?
    var players: [Player]?
    
    init(name: String, players: [Player]) {
        self.name = name
        self.players = players
    }
    
}

class Player {
    var name: String?
    var number: Int?
    var handedness: Handedness?
    
    init(name: String, number: Int, handedness: Handedness) {
        self.name = name
        self.number = number
        self.handedness = handedness
    }
}

enum Handedness {
    case Left
    case Right
}

class PitchEvent {
    
    var currentPitcher: Player?
    var currentBatter: Player?
    var pitchType: PitchType?
    var pitchResult: PitchResult?
    
    init(currentPitcher: Player, currentBatter: Player) {
        self.currentPitcher = currentPitcher
        self.currentBatter = currentBatter
    }
}

enum PitchType {
    case fastball
    case curveball
    case slider
    case sinker
    case twoSeamer
    case splitfinger
    case cutter
}

enum PitchResult {
    case hit
    case strike
    case ball
    case foul
    case groundout
    case popout
    case homerun
}

class AtBat {
    
    var pitchEvents: [PitchEvent]
    
    init() {
        self.pitchEvents = [PitchEvent]()
    }
    
    func handlePitch(pitcher: Player, batter: Player, fieldRect: CGRect, strikeZone: CGRect, startPoint: CGPoint, endPoint: CGPoint) {
        let pitchEvent = PitchEvent(currentPitcher: pitcher, currentBatter: batter)
        
        
    }
    
    
}

class HalfInning {
    
    var atBats: [AtBat]?
}


// Create an array to hold home team playesr
var homeTeamPlayers = [Player]()

// Enumerate 9 times to create 9 players for home team
for i in 1...9 {
    let player = Player(name: "Home Player \(i)", number: i, handedness: (i % 4 == 0 ? .Left : .Right)) // Initialize a new player
    homeTeamPlayers.append(player)
}

for player in homeTeamPlayers {
    print(player.name)
    print(player.handedness)
}




var visitingTeamPlayers = [Player]()

for i in 1...9 {
    let player = Player(name: "Visiting Player \(i)", number: i, handedness: (i % 5 == 0 ? .Left : .Right))
    visitingTeamPlayers.append(player)
}

for player in visitingTeamPlayers {
    print(player.name)
    print(player.handedness)
}

let homeTeam = Team(name: "NY Mets", players: homeTeamPlayers)

let visitingTeam = Team(name: "WA Nationals", players: visitingTeamPlayers)

let gameManger = GameManager(homeTeam: homeTeam, visitingTeam: visitingTeam)