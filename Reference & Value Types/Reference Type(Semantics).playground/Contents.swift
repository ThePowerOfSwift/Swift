//: Playground - noun: a place where people can play

import UIKit

/***************************************************************/

// MARK: - #1

class Robot {
    var model: String
    init(model: String) {
        self.model = model
    }
}


var r1 = Robot(model: "T1999")
var r2 = r1

r1.model = "T2000"
r2.model // = T2000 - reference type

let t3 = Robot(model: "T3000")
t3.model = "TXXX"


// MARK: - #2

class AnotherRobot {
    let model: String // here is a let
    init(model: String) {
        self.model = model
    }
}


let a1 = AnotherRobot(model: "A1232")
let a2 = a1
//a1.model = "Axxxx" //  Cannot cange because stored properties of class is a let constant