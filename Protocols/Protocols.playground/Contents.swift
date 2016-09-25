/**********************************************************************************************/

// MARK: #1

import UIKit

protocol FullyNameable {
    var fullName: String { get }
}

struct User: FullyNameable {
    var fullName: String
}

let user = User(fullName: "Jonathan Swift")

struct Friend: FullyNameable {
    let firstName: String
    let middleName: String
    let lastName: String
    
    var fullName: String {
        return "\(firstName) \(middleName) \(lastName)"
    }
}

let friend = Friend(firstName: "Taylor", middleName: "Alison", lastName: "Swift")

/**********************************************************************************************/

// MARK: #2

protocol Payable {
    func pay() -> (basepay: Double, benefits: Double, deuctions: Double, vacationTyme: Int)
}

enum EmployeeType {
    case Manager
    case NotManager
}

class Employee {
    let name: String
    let address: String
    let startDate: Date
    let type: EmployeeType
    
    var department: String?
    var reportsTo: String?
    
    init(name: String, address: String, startDate: Date, type: EmployeeType) {
        self.name = name
        self.address = address
        self.startDate = startDate
        self.type = type
    }
}


func payEmployee(employee: Payable) {
    employee.pay()
}


class HourlyEmployee: Employee, Payable {
    var hourlyWage = 15.00
    var hoursWorked = 10.0
    let aviableVacation = 0
    
    func pay() -> (basepay: Double, benefits: Double, deuctions: Double, vacationTyme: Int) {
        return (hourlyWage * hoursWorked, 0, 0, aviableVacation)
    }
}

let hourlyEmployee = HourlyEmployee(name: "User", address: "City", startDate: Date(), type: .Manager)

payEmployee(employee: hourlyEmployee)



/**********************************************************************************************/

// MARK: #3

protocol Blendable {
    func blend()
}

class Fruit: Blendable {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func blend() {
        print("I'm mush!")
    }
}


class Dairy {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

class Cheese: Dairy {
    
}

class Milk: Dairy, Blendable {
    func blend() {
        print("I haven't changed. I'm still milk!")
    }
}


func makeSmoothie(ingredients: [Blendable]) {
    for ingredient in ingredients {
        ingredient.blend()
    }
}


let strawberry = Fruit(name: "Strawberry")
let cheddar = Cheese(name: "Cheddar")
let chocolateMilk = Milk(name: "Chocolate")


let ingredients: [Blendable] = [strawberry, chocolateMilk]

makeSmoothie(ingredients: ingredients)



/**********************************************************************************************/

// MARK: #4


protocol RandomNumberGenerator {
    func random() -> Double
}

class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m  = 129968.0
    let a = 3877.0
    let c = 29573.0
    
    func random() -> Double {
        lastRandom = ((lastRandom * a + c) .truncatingRemainder(dividingBy: m))
        return lastRandom / m
    }
}


class Dice {
    let sides: Int
    let generator: RandomNumberGenerator
    
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    
    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}

var d6 = Dice(sides: 6, generator: LinearCongruentialGenerator())




/**********************************************************************************************/

// MARK: #5

//        IS-A                            HAS-A (some properties, or methods, ex fly/fly())
// Airplane, JetPlane               Airplane, Bird





/**********************************************************************************************/

// MARK: #5


protocol Printable {
    func description() -> String
}

protocol PrettyPrintable: Printable {
    func prettyDescription() -> String
}


struct SomeUser: PrettyPrintable {
    let name: String
    let age: Int
    let address: String
    
    func description() -> String {
        return "\(name), \(age), \(address)"
    }
    
    func prettyDescription() -> String {
        return "\nname: \(name), \nage: \(age), \naddress: \(address)"
    }
}

let someUser = SomeUser(name: "AAA", age: 20, address: "aasasas")
someUser.description()
print(someUser.prettyDescription())




/**********************************************************************************************/

// MARK: #6

// Printable - CustomStringConvertible

// Standard Library protocols

// Can Do - can do something, compare, move, fight; == Equatable, Comparable -- sufix: -able
// Is A   - protocol model a concrete type, CollectionType, AnyCollectionType;  -Type
// Can Be - one type can be conerted to another type; FloatliteralConvertible, ArrayLiteralConvertible, CustomStringConvertible, NilLiteralConvertible; - Convertible


/**********************************************************************************************/

// MARK: #7


enum Direction {
    case Up, Down, Right, Left
}

protocol Movable {
    func move(direction: Direction, distance: Int)
}

protocol Destructable {
    func decreaseLife(factor: Int)
}

protocol Attackable {
    var strength: Int { get }
    var range: Int { get }
    
    func attack(player: PlayerType)
}

protocol PlayerType {
    var position: Point { get set } // write/rewrite
    var life: Int { get set }
    
    init(point: Point)
}


struct Point {
    
    var x: Int
    var y: Int
    
    func surroundingPoints(withRange range: Int = 1) -> [Point] {
        var results = [Point]()
        for coordX in (x - range)...(x + range) {
            for coordY in (y - range)...(y + range) {
                let coordinatePoint = Point(x: coordX, y: coordY)
                results.append(coordinatePoint)
            }
        }
        return results
    }
}


class Enemy: PlayerType, Destructable, Attackable, Movable {
    
    var position: Point
    var life = 2
    var strength = 5
    var range = 2
    
    
    required init(point: Point) {
        position = point
    }
    
    func decreaseHealth(factor: Int) {
        life -= factor
    }
    
    func attack(player: PlayerType) {
        var player = player
        player.life = player.life - strength
    }
    
    func move(direction: Direction, distance: Int) {
        switch direction {
        case .Up: position.y += 1
        case .Down: position.y -= 1
        case .Left: position.x -= 1
        case .Right: position.x += 1
        }
    }
    
    func decreaseLife(factor: Int) {
        life -= factor
    }
}














































































































