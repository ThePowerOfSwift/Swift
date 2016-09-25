//
//  ViewController.swift
//  UITextFieldDemo
//
//  Created by Mihail Șalari on 9/18/16.
//  Copyright © 2016 Mihail Șalari. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - Properties
    
    @IBOutlet weak var submitbutton: UIButton!
    
    
    // MARK: - LyfeCicle

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - UITextFieldDelegate
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        guard let text = textField.text else { return false }
        if text.characters.count > 0 {
            submitbutton.isEnabled = true
        } else {
            submitbutton.isEnabled = false
        }
        
        return true
    }
}

