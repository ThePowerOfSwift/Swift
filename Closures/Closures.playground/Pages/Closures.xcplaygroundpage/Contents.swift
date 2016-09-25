//: Playground - noun: a place where people can play

import UIKit

/*******************************************/

// MARK: - #1
// Function as Data

func printString(_ str: String) {
    print("Printing the string passed in: --- \(str) ---")
}

printString("Hi, my name is Patzam")


//
let someFunction: (String) -> () = printString
someFunction("Hi, hook here!")

//
func sum(a: Int, b: Int) -> Int {
    return a + b
}


let addTwoNumbers = sum // let addTwoNumbers: (Int, Int) -> Int
addTwoNumbers(1, 2)


/*******************************************/

// MARK: - #2
// Function as Parameters

func displayString(_ a: (String) -> ()) {
    a("I'm a function inside a function!")
}


displayString(printString)



/*******************************************/

// MARK: - #3
// Extending Int type

extension Int {
    func apply(operation: (Int) -> Int) -> Int {
        return operation(self)
    }
}


func double(value: Int) -> Int {
    return value * 2
}

10.apply(operation: double)


func closestMultipleOfSix(value: Int) -> Int {
    for x in 1...100 {
        let multiple = x * 6
        
        if multiple - value < 6 && multiple > value {
            return multiple
        } else if multiple == value {
            return value
        }
    }
    
    return 0
}

32.apply(operation: closestMultipleOfSix)
12.apply(operation: closestMultipleOfSix)
200.apply(operation: closestMultipleOfSix)





/*******************************************/

// MARK: - #4
// Returning functions

typealias IntegerFunction = (Int) -> ()

func gameCounter() -> IntegerFunction {
    func increment(i: Int) {
        print("Integer passed in: --- \(i) ---")
    }
    return increment
}

let aCounter = gameCounter // or gameCounter() === aCounter(2)
aCounter()(2)




/*******************************************/

// MARK: - #5
// Capturing variables


func gameCounter2() -> IntegerFunction {
    var counter = 0
    func increment(i: Int) {
        counter += i
        print("Integer passed in: --- \(counter) ---")
    }
    return increment
}


let bCounter = gameCounter2()
bCounter(1) // value are copied === 1
bCounter(2) // value are copied === 3; (1 + 2)
bCounter(4) // value are copied === 7; (3 + 4)

print("cCounter ------------")
let cCounter = gameCounter2()
cCounter(1)


print("bCounter ------------")
bCounter(10)

// loock screenshots













































