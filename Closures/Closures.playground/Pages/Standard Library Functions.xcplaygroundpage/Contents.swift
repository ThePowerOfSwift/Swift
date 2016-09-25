//: [Previous](@previous)

import UIKit

/*******************************************/

// MARK: - #1
// Map

// RULE #1 imperative style
let values = [1, 2, 3, 4, 5]

var newArray = [Int]()

for number in values {
    newArray.append(number)
}

// RULE #2 undeclarating programming

let tripledValues = values.map { $0 * 3 } // [3, 6, 9, 12, 15]


/*******************************************/

// MARK: - #2
// Our Map function

extension Array {
    func ourMap<T>(transform: (Element) -> T) -> [T] {
        var result = [T]()
        
        for x in self {
            result.append(transform(x))
        }
        
        return result
    }
}
let integerValues = ["1", "2", "3", "4", "5"].ourMap { Int($0) }
integerValues // [{some 1}, {some 2}, {some 3}, {some 4}, {some 5}] == optional Int


/*******************************************/

// MARK: - #3
// Formatter

import Foundation

struct Formatter {
    static let formatter = DateFormatter()
    
    static func dateFromString(dateString: String) -> Date? {
        formatter.dateFormat = "d MMM yyyy"
        return formatter.date(from: dateString) as Date?
    }
}

let dateStrings = ["10 Oct 1988", "11 Jan 1947", "28 Mar 2002"]


let dates = dateStrings.ourMap { Formatter.dateFromString(dateString: $0)}
// [{some "Oct 10, 1988, 12:00 AM"}, {some "Jan 11, 1947, 12:00 AM"}, {some "Mar 28, 2002, 12:00 AM"}]




/*******************************************/

// MARK: - #3
// Flat map


extension Array {
    
    func ourFlatMap<T>(transform: (Element) -> [T]) -> [T] {
        var result = [T]()
        
        for x in self {
            result.append(contentsOf: transform(x))
        }
        
        return result
    }
}


struct Post {
    var content: String
    var tags: [String]
}

let blog = [
    Post(content: "Hello, world!", tags: ["first", "programming"]),
    Post(content: "Just another short post", tags: ["general"])
]

let testBlog = blog.ourMap { $0.content }
testBlog // ["Hello, world!", "Just another short post"]

let tags = blog.ourMap { $0.tags }
tags // [["first", "programming"], ["general"]]

let flattenedTags = blog.ourFlatMap { $0.tags }
flattenedTags // ["first", "programming", "general"]




// Example 2

struct Account {
    let username: String
    let billingAddress: String?
}


let allUsers = [
    Account(username: "pasanpr", billingAddress: nil),
    Account(username: "benjakuben", billingAddress: "1234 Imaginary Street"),
    Account(username: "instantNadel", billingAddress: "5678 Doesn't Live Here Dr."),
    Account(username: "sketchings", billingAddress: nil),
    Account(username: "paradoxed", billingAddress: "1122 Nope Lane")
]


let validAddresses = allUsers.flatMap { $0.billingAddress }
validAddresses // ["1234 Imaginary Street", "5678 Doesn't Live Here Dr.", "1122 Nope Lane"] // eliminated nil, optional





/*******************************************/

// MARK: - #4
// Filter

let evenNumbers = (0...100).filter { $0 % 2 == 0 }

evenNumbers // [0, 2, 4, 6, 8, 10 ....

extension Array {
    func ourFilter(includeElement: (Element) -> Bool) -> [Element] {
        var results = [Element]()
        
        for x in self where includeElement(x) {
            results.append(x)
        }
        
        return results
    }
}
let pUsers = allUsers.ourFilter { $0.username.characters.first == "p" }

pUsers // [{username "pasanpr", nil}, {username "paradoxed", {some "1122 Nope Lane"}}]




/*******************************************/

// MARK: - #5
// Reduce


let scores = [11, 22, 32, 43, 54]
var totalScore = 0

for score in scores {
    totalScore += score
}

totalScore // 162

totalScore = 0

totalScore = scores.reduce(0, { (total, score) -> Int in
    return total + score
}) // 162

// 0 is  initial value of totalScore
// total = totalScore

extension Array {
    func ourReduce<T>(initial: T, combine: (T, Element) -> T) -> T {
        var result  = initial
        
        for x in self {
            result = combine(result, x)
        }
        
        return result
    }
}

totalScore = 0

totalScore = scores.ourReduce(initial: 0, combine: { (total, score) -> Int in
    return total + score
})


let dataSet = (1...100).filter { $0 % 3 == 0 && $0 % 7 == 0 }
let identifier = dataSet.ourReduce(initial: "") { (str, num) in
    return str + "\(num)"
}
identifier // "21426384"



























































