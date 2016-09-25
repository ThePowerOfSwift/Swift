//: Playground - noun: a place where people can play

import UIKit

/***************************************************************/

// MARK: - #1

extension Int {
    var isOdd: Bool {
        return self % 2 != 0
    }
}

3.isOdd
8.isOdd


// RULE #1 for extensions

// can add computed properties
// cannot add stored properties or property observers
// can add new type an instance methods
// can define nested types
// can add convenience initializers



// MARK: - #2
import GameKit


protocol UniqueType {
    var id: Int { get }
}

extension UIView: UniqueType {
    var id: Int {
        return GKRandomSource.sharedRandom().nextInt(upperBound: 1000)
    }
}

let view = UIView()
view.id // generate a random number from 0...1000





// MARK: - #2
// exending an protocol

protocol SomeType {
    var someNumber: Int { get }
}

extension SomeType {
    var someNumber: Int {
        return GKRandomSource.sharedRandom().nextInt(upperBound: 1000)
    }
}


extension UILabel: SomeType {
    
}

let label = UILabel()
label.someNumber // 599


extension UIButton: SomeType {
    var someNumber: Int {
        return 1
    }
}


let button = UIButton()
button.someNumber // return 1





// MARK: - #3
// method dispatch in a protocol extension

protocol PersonType {
    var firstName: String { get }
    var middleName: String? { get }
    var lastName: String { get }
    
    func fullName() -> String
}

extension PersonType {
    func fullName() -> String {
        return "\(firstName) \(middleName ?? "") \(lastName)"
    }
    
    func greeting() -> String {
        return "Hi, " + fullName()
    }
}



struct User: PersonType {

    var firstName: String
    var middleName: String?
    var lastName: String
    
    func greeting() -> String {
        return "Hey there, " + fullName()
    }
    
    func fullName() -> String {
        return "\(lastName), \(firstName)"
    }
}

let someUser = User(firstName: "Patzan", middleName: nil, lastName: "Patzanovich")
let anotherUser: PersonType = User(firstName: "Ciuvak", middleName: nil, lastName: "Ciuvakocich")

someUser.greeting()
anotherUser.greeting()





struct Friend: PersonType {
    var firstName: String
    var middleName: String?
    var lastName: String
    
    func greeting() -> String {
        return "Hello, " + fullName()
    }
}

let someFriend = Friend(firstName: "Drugan", middleName: nil, lastName: "Druganovich")

let people = [someUser, anotherUser, someFriend]


for person in people {
    print(person.greeting()) // is called a protocol method because the type or array is PersonType: let people: [PersonType]
}


















