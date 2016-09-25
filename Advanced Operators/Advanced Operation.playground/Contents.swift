//: Playground - noun: a place where people can play

import UIKit

/***************************************/

// MARK: - #1

extension UInt8 {
    var toBinary: String {
        var result = ""
        
        for i in 0..<8 {
            let mask = 1 << i
            let set = Int(self) & mask != 0
            result = (set ? "1" : "0") + result
        }
        
        return result
    }
}

0b11111111
0xff
255

//

var a: UInt8 = 57
a.toBinary

a = 0b00111001
a.toBinary

a += 5
(60 as UInt8).toBinary
a.toBinary

a -= 0b000000100
a.toBinary

// move >> <<
a = a << 1

a = a >> 2

a = a * 8
a = a &*  7

a = 0b11111111
a = a &+ 1 // overload

a = a &- 1




/***************************************/

// MARK: - #2

extension Int8 {
    var toBinary: String {
        var result = ""
        
        for i in 0..<8 {
            let mask = 1 << i
            let set = Int(self) & mask != 0
            result = (set ? "1" : "0") + result
        }
        
        return result
    }
}

var b: Int8 = 0
b = b - 1
b.toBinary

b = b - 1
b.toBinary


b = 0b00100001
b = b << 2
b.toBinary





/***************************************/

// MARK: - #3
// Operations between bits

var c: UInt8 = 0b00110011
var d: UInt8 = 0b11100001

c.toBinary
d.toBinary
(c | d).toBinary // or // 0 + 0 = 0; 1 + 1 = 1; 1 + 0 = 1               "/"


c.toBinary
d.toBinary
(c & d).toBinary // and 0 + 0 = 0; 1 + 1 = 1; 1 + 0 = 0                 "*"


c.toBinary
d.toBinary
(c ^ d).toBinary // module 0 + 0 = 0; 1 + 1 = 0; 1 + 0 = 1            ""



c.toBinary
d.toBinary
(~c).toBinary // inversion, if was 1, will be 0 and vice versa           ""


/***************************************/

// check if the bit is set

c = 0b00010001
c.toBinary
d.toBinary
(c & d).toBinary // last is set



/***************************************/

// MARK: - #4
// Operations between bits



enum CheckList: UInt8 {
    case bread =    0b00000001
    case chiken =   0b00000010
    case apples =   0b00000100
    case pears =    0b00001000
}


let checkList: UInt8 = 0b00001001
let bread = checkList & CheckList.bread.rawValue
bread.toBinary

let chicken = checkList & CheckList.chiken.rawValue
chicken.toBinary


let pears = checkList & CheckList.pears.rawValue
pears.toBinary































































































