//: Playground - noun: a place where people can play

import UIKit

/***************************************************************/

// MARK: - #1
// Deinit

class Food {
    let name: String
    
    init(name: String) {
        self.name = name
        print("memory allocated for - \(name)")
    }
    
    deinit {
        print("\(name) is being deinitialized. Memory dealocated")
    }
}

var ref1: Food? = Food(name: "Cheesburger")
var ref2 = ref1

ref1 = nil
ref2 = nil


/***************************************************************/

// MARK: - #2
// Weak reference

class Person {
    let name: String
    
    init(name: String) {
        self.name = name
        print("memory allocated for - \(name)")
    }
    
    var apartament: Apartament?
    deinit {
        print("\(name) is being deinitialized. Memory dealocated")
    }
}

class Apartament {
    let unit: String
    
    init(unit: String) {
        self.unit = unit
        print("memory allocated for - \(unit)")
    }
    
    weak var tenant: Person? // just with weak the reference will be destroyed
    
    deinit {
        print("Apartament \(unit) is being deinitialized. Memory dealocated")
    }
}

var pers: Person? = Person(name: "Patzan")
var apa: Apartament? = Apartament(unit: "123")

pers?.apartament = apa
apa?.tenant = pers

pers = nil
apa = nil






