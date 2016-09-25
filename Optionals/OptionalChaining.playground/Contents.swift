//: Playground - noun: a place where people can play

import UIKit

class Address {
    var streetName: String?
    var buildingNumber: String?
    var apartamentnumber: String?
}


class Residence {
    var address: Address?
}


class Person {
    var residence: Residence?
}


let susan = Person()
let address = Address()

address.streetName = "123 Stefan cel Mare"
address.buildingNumber = "112"
address.apartamentnumber = "10"

let residence = Residence()
residence.address = address

susan.residence = residence

// give app number

if let apartamentNumber = susan.residence?.address?.apartamentnumber {
    print(apartamentNumber)
}