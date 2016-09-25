//: Playground - noun: a place where people can play

import UIKit

/***************************************************************/

// MARK: - #1

struct Shape {
    let shapeView: UIView
    
    init(width: CGFloat, height: CGFloat, color: UIColor) {
        let frame = CGRect(x: 0, y: 0, width: width, height: height)
        shapeView = UIView(frame: frame)
        shapeView.backgroundColor = color
    }
}


let square = Shape(width: 100, height: 100, color: .red)

square.shapeView.backgroundColor = .black
