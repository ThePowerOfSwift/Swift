//: Playground - noun: a place where people can play

import UIKit

/***************************************************************/

// MARK: - #1
// Switch 2 value without generics

func switcheroo( a: inout Int, b: inout Int) {
    let tempA = a
    a = b
    b = tempA
}

var five = 5
var ten = 10

switcheroo(a: &five, b: &ten)
five
ten


/***************************************************************/

// MARK: - #2
// Switch 2 value with generics

func genericSwitcheroo<T>( a: inout T, b: inout T) {
    let tempA = a
    a = b
    b = tempA
}

var fivePT = 5.5
var tenPT = 10.5

genericSwitcheroo(a: &fivePT, b: &tenPT)

fivePT
tenPT

five = 5
ten = 10

genericSwitcheroo(a: &five, b: &ten)
five
ten


/***************************************************************/

// MARK: - #3
// Generics Methods

// Base Class


class GuestCheck {
    
    var roomNO: Int?
    var chargeType: ChargeType?
    var subtotal = 10.0
    var gratuity = 0.0
    var note: String?
    
    var tax: Double {
        return subtotal * 0.05
    }
    
    var total: Double {
        return subtotal + gratuity + tax
    }
    
    enum ChargeType {
        case restaurant
        case roomService
        case spaServices
        case entertaiment
        case fitness
    }
}


class RestaurantCheck: GuestCheck {
    var foodSubtl = 0.0
    var hevSubtl = 0.0
    var tableNO: Int
    
    init(tableNO: Int) {
        self.tableNO = tableNO
        super.init()
        self.chargeType = .roomService
    }
}

class SpaCheck: GuestCheck {
    var therapistID: Int?
    var productsPurchased: [SpaProducts] = []
    var servicesPurchased: [SpaServices] = []
    
    override init() {
        super.init()
        self.chargeType = .spaServices
    }
    
    enum SpaServices {
        case massage
        case mudBath
        case manicure
        case pedicure
    }
    
    enum SpaProducts {
        case massage
        case mudBath
        case manicure
        case pedicure
    }
}


// First method, without generics, use downcasting

func guestRetroDiscount1(_ discount: Double, guestCheck: GuestCheck) -> GuestCheck {
    guestCheck.subtotal *= (1 - discount)
    
    return guestCheck
}

var tmpSpa1 = SpaCheck()

tmpSpa1.subtotal = 25.0
tmpSpa1.gratuity = 8.0

tmpSpa1 = guestRetroDiscount1(0.25, guestCheck: tmpSpa1) as! SpaCheck
tmpSpa1.subtotal


// Second variant, with generics
func guestRetroDiscount2<T: GuestCheck>(_ discount: Double, guestCheck: T) -> T {
    guestCheck.subtotal *= (1 - discount)
    
    return guestCheck
}

var tmpSpa2 = SpaCheck()

tmpSpa2.subtotal = 25.0
tmpSpa2.gratuity = 8.0

tmpSpa2 = guestRetroDiscount2(0.25, guestCheck: tmpSpa2)

tmpSpa2.subtotal



// Third variant, with adding a new param to method, and the base class
func guestRetroDiscount3<T: GuestCheck>(_ discount: Double, guestCheck: T, note: String) -> T {
    guestCheck.note = note
    guestCheck.subtotal *= (1 - discount)
    
    return guestCheck
}

var tmpSpa3 = SpaCheck()

tmpSpa3.subtotal = 25.0
tmpSpa3.gratuity = 8.0

tmpSpa3 = guestRetroDiscount3(0.25, guestCheck: tmpSpa3, note: "Simple note")

tmpSpa3.subtotal


/***************************************************************/

// MARK: - #3
// Generics Types

struct Team {
    
    var name: String
    var city: String
    var winPCT: Double = 0.0
    
    init(name: String, city: String) {
        self.name = name
        self.city = city
    }
}


class StatGroup<Element> {
    var members: [Element]
    var title: String
    
    init(members: [Element], title: String) {
        self.members = members
        self.title = title
    }
}


struct Player {
    var name: String
    var height: Double
    
    init(name: String, height: Double) {
        self.name = name
        self.height = height
    }
}



let blazers = Team(name: "Blazers", city: "Orhei")
let nuggets = Team(name: "Nuggets", city: "Cahul")

let hoopMD = StatGroup(members: [blazers, nuggets], title: "NBA, MD")

//
let starPlayer = Player(name: "Ciuvak", height: 44)
var benchPlayer = Player(name: "Patzan", height: 66)

let iceFencingMD = StatGroup(members: [starPlayer, benchPlayer], title: "Olympic Ice Fencing, (MD)")


/***************************************************************/

// MARK: - #4
// Generics under the hood


var intArray: Array<Int> = [4, 5, 6, 7, 8]
// jump array definition
// jump sets definition, set is a struct



/***************************************************************/

// MARK: - #5
// Generics Type Constraints

protocol PersonType {
    var name: String { get }
    var homeTown: String { get }
    var height: Double { get }
}

struct AnotherTeam {
    var name: String
    var city: String
    var winPCT: Double = 0.0
    
    init(name: String, city: String) {
        self.name = name
        self.city = city
    }
}

struct AnotherCoach: PersonType {
    var name: String
    var homeTown: String
    var height: Double
}


struct AnotherPlayer: PersonType {
    var name: String
    var height: Double
    var homeTown: String
    
    init(name: String, height: Double, homeTown: String) {
        self.name = name
        self.height = height
        self.homeTown = homeTown
    }
}


let testCoach = AnotherCoach(name: "Billy Martin", homeTown: "Berkley, CA", height: 78)
let testPlayer = AnotherPlayer(name: "Ricky Henderson", height: 67, homeTown: "Chicago, IL")


// combine name and hmetosn

func getPersonalInfo<T: PersonType>(person: T) -> String {
    return "You have selected \(person.name) from \(person.homeTown)"
}


getPersonalInfo(person: testCoach)
getPersonalInfo(person: testPlayer)



// Use inheritance

class AnotherClassTeam {
    var name: String
    var city: String
    var winPCT: Double = 0.0
    
    init(name: String, city: String) {
        self.name = name
        self.city = city
    }
}

class CurlingTeam: AnotherClassTeam { }
class BobsledTeam: AnotherClassTeam { }


func teamBlirb<T: AnotherClassTeam>(team: T) -> String {
    return "You have selected \(team.city) from \(team.winPCT)"
}



func getLarger<T: Comparable>(valueA: T, valueB: T) -> T? {
    if valueA > valueB  && valueA != valueB { //if the value are the same
        return valueA
    } else if valueA < valueB && valueA == valueB { // if the value are the same
        return nil
    } else {
        return valueB
    }
}


let result = getLarger(valueA: 61, valueB: 62)




/***************************************************************/

// MARK: - #6
// Associated type

protocol AnotherPersonType {
    var name: String { get }
    var homeTown: String { get }
    var height: Double { get }
    
    associatedtype PositionType
    var positions: PositionType { get }
}

struct AnotherPlayerClass: AnotherPersonType {
    var name: String
    var height: Double
    var homeTown: String
    
    typealias PositionType = [String]
    var positions: PositionType
    
    init(name: String, height: Double, homeTown: String, positions: PositionType) {
        self.name = name
        self.height = height
        self.homeTown = homeTown
        self.positions = positions
    }
}



struct AnotherCoachStruct: AnotherPersonType {
    var name: String
    var homeTown: String
    var height: Double
    
    typealias PositionType = String
    var positions: String
}



var newPlayer = AnotherPlayerClass(name: "Jim", height: 77, homeTown: "Chisinau", positions: ["15", "16", "17"])
var newCoach = AnotherCoachStruct(name: "Billy", homeTown: "Cahul", height: 88, positions: "Head Coach")

struct Executive {
    
    var name: String
    var height: Double
    var homeTown: String
    
    var positions: String
}

extension Executive: AnotherPersonType {
    
}


func allItemsMatch<P1: AnotherPersonType, P2: AnotherPersonType>(p1: P1, p2: P2) -> Bool where P1.PositionType == P2.PositionType {
    // sample response
    
    return true
}

















































