//
//  ViewController.swift
//  Properties observers
//
//  Created by Mihail Șalari on 9/11/16.
//  Copyright © 2016 Mihail Șalari. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Properties observers - allow us to observe and respond to changes in property values
    
    // willSet is called just before the value is stored
    // didSet is calle immediatly after the newValue is stored

    @IBOutlet weak var customView: UIView!
    
    var value: Double = 0.0 {
        willSet {
            print("Old value = \(newValue)")
        }
        didSet {
            customView.alpha = CGFloat(value)
            print("new value = \(oldValue)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func slider(_ sender: UISlider) {
        value = Double(sender.value)
    }
}

