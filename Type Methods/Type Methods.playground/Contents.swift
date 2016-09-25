//: Playground - noun: a place where people can play

import UIKit

/***************************************************************/

// MARK: - #1

struct Point {
    var x: Double
    var y: Double
}


struct Map {
    static let origin = Point(x: 0, y: 0)
    
    static func distanceFromOrigin(point: Point) -> Double {
        let horisontalDistance = origin.x - point.x
        let verticalDistance = origin.y - point.y
        
        func square(_ value: Double) -> Double {
            return value * value
        }
        
        return sqrt(square(horisontalDistance) + square(verticalDistance))
    }
}