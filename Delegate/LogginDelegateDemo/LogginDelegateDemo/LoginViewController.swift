//
//  LoginViewController.swift
//  LogginDelegateDemo
//
//  Created by Mihail Șalari on 9/18/16.
//  Copyright © 2016 Mihail Șalari. All rights reserved.
//

import UIKit

protocol LoginViewControllerDelegate {
    func didLoginSuccessfully()
}

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    
    var delegate: LoginViewControllerDelegate?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func loginButtonpressed() {
        if usernameField.text == "patzan" && passwordField.text == "123" {
            delegate?.didLoginSuccessfully()
        } else {
            let alertController = UIAlertController(title: "Error!", message: "The username and password combination failed!", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default) { /*[unowned self]*/ (action) in
                
            }
            
            alertController.addAction(ok)
            present(alertController, animated: true, completion: nil)
        }
    }
    
    
    // MARK: - UITextFieldDelegate
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        guard let text = textField.text else { return false }
        if text.characters.count > 0 {
            submitButton.isEnabled = true
        } else {
            submitButton.isEnabled = false
        }
        
        return true
    }
    
    
  

}
