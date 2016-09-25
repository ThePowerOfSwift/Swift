//: Playground - noun: a place where people can play

import UIKit

/*************************/
// MARK: 1

struct Point {
    var x: Int
    var y: Int
}

var p1 = Point(x: 2, y: 3)
var p2 = Point(x: 3, y: 5)

func +(a: Point, b: Point) -> Point {
    return Point(x: a.x + b.x, y: a.y + b.y)
}

let p3 = p1 + p2 // "Point(x: 5, y: 8)\n"

// +=

func +=(a: inout Point, b: Point) {
    a = a + b
    
}

func ==(a: Point, b: Point) -> Bool {
    return a.x == b.x && a.y == b.y
}

p1 == p2 // false


prefix func ++(a: inout Point) -> Point {
    a.x += 1
    a.y += 1
    return a
}

++p1
p1.x
p1.y


postfix func ++(a: inout Point) -> Point {
    let b = a
    ++a
    return b
}


p1++
p1.x
p1.y
print(p1)

// %%%
infix operator %%%

func %%%(a: inout Point, b: Point) -> Point {
    a.x += b.y
    a.y -= b.x
    return a
}


print(p1 %%% p2)



infix operator ** { associativity left precedence 120}

func **(a: Point, b: Point) -> Point {
    return Point(x: 2 * (a.x + b.x), y: 2 * (a.y + b.y))
}

print(p1 ** p2)













