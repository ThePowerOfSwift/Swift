//: [Previous](@previous)

import Foundation

// MARK: - #1
// Throwing from inside a closure ex 1

extension Int {
    func apply(_ value: Int, operation: (Int, Int) throws -> Int) -> Int? {
        do {
            return try operation(self, value)
        } catch let error {
            print(error)
        }
        
        return nil
    }
}

10.apply(12) { $0 + $1 }

// 10.apply(0) { $0 / $1 } //cannot divide



// MARK: - #2
// Throwing from inside a closure, ex 2

extension Int {
    func apply2(_ value: Int, operation: (Int, Int) throws -> Int) throws -> Int {
        return try operation(self, value)
    }
}

enum ErrorType: Error {
    case divideByZero
}

try 10.apply2(0) { firstValue, secondValue in

    if secondValue == 0 {
        throw ErrorType.divideByZero
    } else {
        return firstValue / secondValue
    }
}


// MARK: - #2
// Throwing from inside a closure, ex3

extension Int {
    func apply3(_ value: Int, operation: (Int, Int) throws -> Int) rethrows -> Int {
        return try operation(self, value)
    }
}

10.apply3(12) { $0  + $1 } // trying to add 12 to 10, use rethrows

[1, 2].map { $0 }


// MARK: - #3
// Objective-C Errors vs. Swift


// Manual Propagation, NSErrors and Closures

import Foundation

let session = URLSession(configuration: .default)

let someURL = URL(string: "")!

let dataTask = session.dataTask(with: someURL) { data, response, error in
    
    if data != nil {
        // Check response and use data
        
        //        do {
        //            let responseData = try NSJSONSerialization.JSONObjectWithData(data!, options: [])
        //        } catch let error {
        //
        //        }
        
        let responseData = try! JSONSerialization.jsonObject(with: data!, options: [])
        
    } else {
        if let error = error {
            // Yikes! Error occured
        }
    }
    
}







