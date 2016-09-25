//: Playground - noun: a place where people can play

import UIKit

/***************************************************************/

// MARK: - #1


class Calculator {
    class func squareRoot(value: Double) -> Double {
        return sqrt(value)
    }
    
    final class func square(value: Double) -> Double {
        return value * value
    }
}

Calculator.squareRoot(value: 100)

class NewtonCalculator: Calculator {
    
    override class func squareRoot(value: Double) -> Double {
        var guess = 1.0
        var newGuess: Double
        
        while true {
            newGuess = (value / guess + guess) / 2
            if guess == newGuess {
                return guess
            }
            
            guess = newGuess
        }
    }
}


NewtonCalculator.squareRoot(value: 100)