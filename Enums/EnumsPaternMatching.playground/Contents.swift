//: Playground - noun: a place where people can play

import UIKit

enum Coin: Double {
    case Penny = 0.01
    case Nickel = 0.05
    case Dime = 0.1
    case Quarter = 0.25
}

let wallet: [Coin] = [
    .Penny, .Nickel, .Dime, .Quarter, .Nickel, .Dime, .Penny, .Quarter, .Nickel,
    .Penny, .Nickel, .Dime, .Quarter, .Nickel, .Dime, .Penny, .Quarter, .Nickel]


var count = 0

for case .Quarter in wallet {
    count += 1
}

let someOptional: Int? = 42

if case .some(let x) = someOptional {
    print(x)
}


let firstName: String? = "Mike"
let username = "MSalari"

var displayName = firstName ?? username
