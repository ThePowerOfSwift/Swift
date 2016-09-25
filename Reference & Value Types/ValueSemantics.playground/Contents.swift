//: Playground - noun: a place where people can play

import UIKit

/***************************************************************/

// MARK: - #1

struct Point {
    var x: Double
    var y: Double
    
    mutating func moveLeft(steps: Double) { // to change the properties value
        x -= steps
    }
}


var p1 = Point(x: 1, y: 2)
var p2 = p1

p1.x = 4
p2.x

let px = Point(x: 5, y: 6)

struct AnotherPoint {
    let x: Double
    let y: Double
}

var p4  = AnotherPoint(x: 2, y: 3)
// p4.x = 4 cannot change value
