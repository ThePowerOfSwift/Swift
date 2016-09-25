//: Playground - noun: a place where people can play

import UIKit

/**********************************************************************************************/

// MARK: #1


let array = ["a", "b", "c"]
array[0]
array[1]
array[2]


struct Family {
    var father = "Father"
    var mother = "Mother"
    var kids = ["Kid1", "kid2", "Kid3"]
    
    var count: Int {
        return 2 + kids.count
    }
    
    // subscript
    
    subscript(index: Int) -> String? {
        get {
            switch index {
            case 0: return "Father"
            case 1: return "Mother"
            case 2..<(kids.count): return kids[index - 2]
            default: return nil
            }
        }
        set {
            let value = newValue ?? ""
            
            switch index {
            case 0: return father = value
            case 1: return mother = value
            case 2..<(2 + kids.count): return kids[index - 2] = value
            default: break
            }
        }
    }
    
    //
    subscript(index: Int, suffix: String) -> String {
        var name = self[index] ?? "" // old subscript
        name += " " + suffix
        return name
    }
}

var family = Family()
family.father
family.mother
family.count

family[0]
family[1]
family[2]


family[0] = "Daddy"
family.father

family[3] = "Buddy"
family.kids[1]


family[3, "The great"]
family[3] = "Buddy"
family[3, "The great"]




/**********************************************************************************************/

// MARK: #2

struct Field {
    var dict = [String: String]()
    
    func keyFor(comumn: String, andRow row: Int) -> String {
        return comumn + "\(row)" + "a"
    }
    
    subscript(column: String, row: Int) -> String? {
        get {
            return dict[keyFor(comumn: column, andRow: row)]
        }
        set {
            dict[keyFor(comumn: column, andRow: row)] = newValue
        }
    }
}

var field = Field()

field["a", 5]
field["a", 5] = "X"
field["a", 6]










