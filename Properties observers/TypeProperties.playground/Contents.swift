//: Playground - noun: a place where people can play

import UIKit

/***************************************************************/

// MARK: - #1

struct Point {
    var x = 0
    var y = 0
}
/*
struct Map {
    static let origin = Point(x: 0, y: 0) // can be an a var(mutable)
}


Map.origin


/***************************************************************/

// MARK: - #2

struct Rectangle {
    var lenght: Int
    var width: Int
    
    var area: Int { // computed property need to be a var - variable (mutable)
        return lenght * width // computed property, it cannot store a value, but computed
    }
}

let rect = Rectangle(lenght: 5, width: 10)
rect.area
*/


/***************************************************************/

// MARK: - #3

struct Size {
    var width = 0
    var heigth = 0
}

struct Rectangle {
    var origin = Point()
    var size = Size()
    
    var center: Point {
        get {
            //reading - getting the value == getters
            
            let centerX = origin.x + size.width / 2
            let centerY = origin.y + size.heigth / 2
            
            return Point(x: centerX, y: centerY)
        }
        
        set(centerValue) { // centerValue == newValue
            //writing - setting the value == setters
            
            origin.x = centerValue.x - size.width / 2
            origin.y = centerValue.y - size.heigth / 2
        }
    }
}

var rect = Rectangle()
rect.center = Point(x: 10, y: 15)
print(rect.center)


/***************************************************************/

// MARK: - #4

enum ReadingMode {
    case Day
    case Evening
    case Night
    
    var statusBarStyle: UIStatusBarStyle {
        switch self {
        case .Day, .Evening:
            return .default
        default:
            return .lightContent
        }
    }
    
    var headlineColor: UIColor {
        switch self {
        case .Night:
            return UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        default:
            return UIColor(red: 16.0/255.0, green: 16.0/255.0, blue: 16.0/255.0, alpha: 1.0)
        }
    }
    
    var dateColor: UIColor {
        switch self {
        case .Night:
            return UIColor(red: 132.0/255.0, green: 132.0/255.0, blue: 16.0/255.0, alpha: 1.0)
        default:
            return UIColor(red: 151.0/255.0, green: 151.0/255.0, blue: 151.0/255.0, alpha: 1.0)
        }
    }
    
    var bodyTextColor: UIColor {
        switch self {
        case .Day, .Evening:
            return UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        default:
            return UIColor(red: 151.0/255.0, green: 151.0/255.0, blue: 151.0/255.0, alpha: 1.0)
        }
    }
    
    var linkColor: UIColor {
        switch self {
        case .Day, .Evening:
            return UIColor(red: 68.0/255.0, green: 133.0/255.0, blue: 164.0/255.0, alpha: 1.0)
        default:
            return UIColor(red: 129.0/255.0, green: 161.0/255.0, blue: 166.0/255.0, alpha: 1.0)
        }
    }
}


let titleLabel = UILabel()

func readingViewWithMode(_ readingmode: ReadingMode) {
    titleLabel.textColor = readingmode.headlineColor
}




/***************************************************************/

// MARK: - #5

// Lazy

class ReadItLaterClient {
    lazy var session = URLSession(configuration: URLSessionConfiguration()) // is not initialized when instance is created
    /* Do the rest of the work */
}


/***************************************************************/

// MARK: - #6

// Properties observers - allow us to observe and respond to changes in property values

// willSet is called just before the value is stored
// didSet is calle immediatly after the newValue is stored

//


/***************************************************************/

// MARK: - #7


struct Student {
    // stored property - store values
    var firstNam: String {
        willSet {
           print("will set " + newValue + " instead of " + firstNam)
        }
        
        didSet {
            print("did set " + firstNam + " instead if " + oldValue)
            firstNam = firstNam.capitalized
        }
    }
    
    var lastName: String {
        willSet {
            print("will set " + newValue + " instead of " + lastName)
        }
        
        didSet {
            print("did set " + lastName + " instead if " + oldValue)
            lastName = lastName.capitalized
        }
    }
    
    // computed property not stored value, just computed
    var fullName: String {
        get {
            return firstNam + " " + lastName
        }
        
        set {
            print("fullName wants to be set to " + newValue)
            
            let words = newValue.components(separatedBy: " ")
            
            if words.count > 0 {
                firstNam = words[0]
            }
            
            if words.count > 1 {
                lastName = words[1]
            }
        }
    }
}

var student = Student(firstNam: "Mihail", lastName: "Salari")
student.firstNam
student.lastName
student.fullName

student.fullName = "Alex Skutarenko"
student.firstNam
student.lastName
student.fullName



/***************************************************************/

// MARK: - #8


let MaxNameLenght = 50
// global constants write with camelCase first letter uppercase


class Human {
    
    lazy var storyOfMyLife = "This is a story of my entire..."
    
    var name: String {
        didSet {
            if name.characters.count > MaxNameLenght {
                name = oldValue
            }
        }
    }
    
    class var maxAge: Int {
        return 100
    }
    
    var age: Int {
        didSet {
            if age > Human.maxAge {
                age = oldValue
            }
        }
    }
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

enum Direction {
    case Left, Right, Top, Bottom
    
    static let enumDescription = "Directions in the game."
    
    var isVertical: Bool {
        return self == .Top || self == .Bottom
    }
    
    var isHorisontal: Bool {
        return !isVertical
    }
}

let d = Direction.Bottom
d.isVertical
d.isHorisontal

Direction.enumDescription

struct Cat {
    var name: String {
        didSet {
            if name.characters.count > MaxNameLenght {
                name = oldValue
            }
        }
    }
    
    static let maxAge = 20
    static var totalCats = 0
    
    
    var age: Int {
        didSet {
            if age > Cat.maxAge {
                age = oldValue
            }
        }
    }
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
        
        Cat.totalCats += 1
    }
}

let human = Human(name: "Peter", age: 40)
var cat = Cat(name: "Whiten", age: 10)

cat.age
cat.name

human.age
human.age

var cat2 = Cat(name: "Whiten", age: 10)
var cat3 = Cat(name: "Whiten", age: 10)
var cat4 = Cat(name: "Whiten", age: 10)

Cat.totalCats

human.age = 1000
cat.age = 400

cat.age
cat.name

human.age
human.age

human.storyOfMyLife






















































