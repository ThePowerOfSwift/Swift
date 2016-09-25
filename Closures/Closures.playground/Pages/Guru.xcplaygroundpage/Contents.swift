//: [Previous](@previous)

import UIKit


// MARK: - #1
//


func test(value: () -> ()) {
    print(value)
    print("stuff ends")
}


test {
    print("stuff start")
}

// MARK: - #2
// Filter

func filter(array: [Int], callback: (Int?, Int) -> Bool) -> Int {
    var number: Int?
    
    for value in array {
        if callback(number, value) {
            number = value
        }
    }
    return number ?? 0
}

let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9]

let any =
filter(array: numbers) {
    return $0 == nil || $0 == $1
}


// MARK: - #1
//

func priority(str: String) -> Int {
    switch str.lowercased() {
    case "a", "e", "i", "o", "u", "y": return 0
    case "a"..."z": return 1
    case "0"..."9": return 2
    default: return 3
    }
}

let a = "1"
let b = "a"

switch (priority(str: a), priority(str: b)) {
case let (x, y) where x < y: print(a)
case let (x, y) where x > y: print(b)
default: print(a <= b ? a : b)
}

let str = "https://www.youtube.com/watch?v=hg620whO5Kc"
var array = [String]()

for c in str.characters {
    array.append("\(c)")
}

let sorted = array.sorted {
    switch (priority(str: $0), priority(str: $1)) {
    case let (x, y) where x < y: return true
    case let (x, y) where x > y: return false
    default: return $0.lowercased() <= $1.lowercased()
    }
}
print(sorted)