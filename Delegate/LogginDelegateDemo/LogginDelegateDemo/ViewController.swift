//
//  ViewController.swift
//  LogginDelegateDemo
//
//  Created by Mihail Șalari on 9/18/16.
//  Copyright © 2016 Mihail Șalari. All rights reserved.
//

import UIKit

class ViewController: UIViewController, LoginViewControllerDelegate {
    
    
    @IBOutlet weak var textLabel: UILabel!
    
    var loggedIn: Bool = false {
        didSet {
            if loggedIn == true {
                configureView()
            }
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

    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if loggedIn == false {
            performSegue(withIdentifier: "Show login", sender: nil)
        }
    }

    func configureView() {
        textLabel.text = "Welkome, you're now logged in!"
    }
    
    
    // MARK: - LoginViewControllerDelegate
    
    func didLoginSuccessfully() {
        loggedIn = true
        dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Show login" {
            let loginVC = segue.destination as! LoginViewController
            loginVC.delegate = self
        }
    }
}

