//: Playground - noun: a place where people can play

import UIKit

Int.init("aaa")


struct Friend {
    let name: String
    let age: String
    let address: String?
}

enum FriendError: Error {
    case InvalidData(String)
    case NetworkError(String)
}

func createFriendFromJSON(dict: [String: String]) throws -> Friend {
    guard let name = dict["name"] else {
        throw FriendError.InvalidData("Name key fails")
    }
    
    guard let age = dict["age"] else {
        throw FriendError.InvalidData("Age key fails")
    }
    
    let address = dict["address"]
    
    return Friend(name: name, age: age, address: address)
}

func sendMessageTo(friend: Friend, message: String) {}

let response = ["names": "Mike", "age": "27", "address": "someAddress"]

do {
    let friend = try createFriendFromJSON(dict: response)
    sendMessageTo(friend: friend, message: "Hello!")
} catch FriendError.InvalidData(let error) {
    print(error)
} catch FriendError.NetworkError(let error) {
    print(error)
}

// defer { close(file2) } is executed in reverse order