//: Playground - noun: a place where people can play

import UIKit

/***************************************************************/

// MARK: - #1
// Delegate pattern

// Protocol

protocol RaceDelegate {
    func raceDidStart()
    func raceStatus(lapNumber: Int, first: Any)
    func raceDidEnd(winner: Any)
}

// Participants

class Horse {
    func giddyUp() {
        
    }
}

class Car {
    func vroomVroom() {
        
    }
}

class RaceCar {
    func readySetToGo() {
        
    }
}

// Races

class Race {
    
    var laps = 0
    var delegate: RaceDelegate? // optional delegate
    
    
    func start() {
        // some set up
    }
    
    func updateProgress() {
        
    }
    
    func end() {
        // some tear down
    }
}


class HorceRace: Race {
    
    let participants: [Horse]
    
    init(laps: Int, horses: [Horse]) {
        self.participants = horses
        super.init()
        self.laps = laps
    }
    
    override func start() {
        delegate?.raceDidStart()
    }
    
    override func updateProgress() {
        laps += 1
        delegate?.raceStatus(lapNumber: laps, first: Horse())
    }
    
    override func end() {
        delegate?.raceDidEnd(winner: Horse())
    }
}


// Tracker

class Tracker: RaceDelegate {
    func raceDidStart() {
        print("Tracker notified that the race has started!")
    }
    
    func raceStatus(lapNumber: Int, first: Any) {
        print("Tracker notified that race status has been updated! Current lap: \(lapNumber) with first place: \(first)")
    }
    
    func raceDidEnd(winner: Any) {
        print("Tracker notified that the race ended! The winner is: \(winner)")
    }
}


// Usage

let participants: [Horse] = [Horse(), Horse(), Horse()]
let race = HorceRace(laps: 4, horses: participants)



let tracker = Tracker()

race.delegate = tracker

race.start()
race.updateProgress()
race.end()




// Broadcast class

class Broadcast: RaceDelegate {
    func raceDidStart() {
        print("Hi everyoane! The race started!")
    }
    
    func raceStatus(lapNumber: Int, first: Any) {
        print("Why not, another lap finished!")
    }
    
    func raceDidEnd(winner: Any) {
        print("Yayyy, the race ended! The winner is: \(winner)")
    }
}

let broadcast = Broadcast()
race.delegate = broadcast

race.start()
race.updateProgress()
race.end()













































