//: Playground - noun: a place where people can play

import UIKit

/***************************************************************/

// MARK: - #1

// init?() {} // if failed will return nil, else - the result
// init?() throws {} - like throws functions

enum PersonError: Error {
    case InvalidData(String)
}

class Person {
    let name: String
    let age: String
    
    init?(dict: [String: Any]) throws {
        guard let name = dict["name"] as? String, let age = dict["age"] as? String else {
            throw PersonError.InvalidData("Invalid data in dictionary")
        }
        
        self.name = name
        self.age = age
    }
}

let dict = ["name": "Mike", "age": "27"]

do {
    let pers = try Person(dict: dict)
} catch PersonError.InvalidData(let error) {
    print(error)
}

/***************************************************************/

// MARK: - #2
// initializer delegation

struct Point {
    var x: Int = 0
    var y: Int = 0
}

struct Size {
    var width: Int = 0
    var height: Int = 0
}

struct Rectangle {
    var origin = Point()
    var size = Size()
    
    
    // Designated initializer
    init(origin: Point, size: Size) {
        self.origin = origin
        self.size = size
    }
    
    init(x: Int, y: Int, height: Int, width: Int) {
        let origin = Point(x: x, y: y)
        let size = Size(width: width, height: height)
        
        /*
        self.origin = origin
        self.size = size
        Don't repeat yourself
        */
        
        // this will rewrite the code above
        self.init(origin: origin, size: size)
    }
    
    init(center: Point, size: Size) {
        let originX = center.x - size.width / 2
        let originY = center.y - size.height / 2
        let origin = Point(x: originX, y: originY)
        
        self.init(origin: origin, size: size)
    }
}


/***************************************************************/

// MARK: - #3
// Designated and convenience initializers


class Vehicle {
    
    var name: String
    
    // Designated initializers
    
    init(name: String) {
        self.name = name
    }
    
    // convenience
    convenience init() {
        self.init(name: "Unnamed")
    }
}



/***************************************************************/

// MARK: - #4
// Initializing superclasses

class Car: Vehicle {
    
    let numberOfDoors: Int
    
    init(name: String, numberOfDoors: Int) {
        self.numberOfDoors = numberOfDoors
        super.init(name: name)
    }
    
    convenience override init(name: String) { // need override
        self.init(name: name, numberOfDoors: 4) // like self.init(name: "Unnamed")
    }
    
    convenience init() {
        self.init(name: "Unnamed")
    }
}

// RULE #1
// Every class must have a designated initializer
// Responsable for calling superclass' designated initializer

// RULE #2
// Classes can have any number of convenience initializers
// Can call other initializers in the same class


// RULE #3
// convenience initializers must call a designated initializer eventually




/***************************************************************/

// MARK: - #5
// Required initializers


class SomeClass {
    required init() {
        // do the real work
    }
}


class AnotherClass: SomeClass {
    
    init(test: String) {
        //
    }
    
    required init() {
        fatalError("init() has not been implemented")
    }
}



class SomeViewController: UIViewController {
    let someString: String
    
    init(someString: String) {
        self.someString = someString
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.someString = ""
        super.init(coder: aDecoder)
    }
}

















































































































