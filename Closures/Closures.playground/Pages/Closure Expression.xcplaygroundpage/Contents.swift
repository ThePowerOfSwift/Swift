//: [Previous](@previous)

import UIKit

/*******************************************/

// MARK: - #1
// Quick recap

func doubler(i: Int) -> Int {
    return i * 2
}

let doubleFunction = doubler

let numbers = [1, 2, 3, 4, 5]

let doubledNumbers = numbers.map(doubleFunction) // [2, 4, 6, 8, 10]


/*******************************************/

// MARK: - #2
// Closure Expression Syntax


// RULE #1 - Long syntax

let triplednumbers = numbers.map({ (number) -> Int in
   return number * 3
})

triplednumbers // [3, 6, 9, 12, 15]


// RULE #2 - Inferring type from context

numbers.map({ number in return number * 3 })



// RULE #3 - Inplicit returns from single-expression closures

numbers.map({ number in number * 3 })


// RULE #4 - Shorthand argument names

numbers.map({ $0 * 3 })


// RULE #5 - Trailing closures

numbers.map() { $0 * 3 }


// RULE #6 - Ignoring parantheses

numbers.map { $0 * 3 }