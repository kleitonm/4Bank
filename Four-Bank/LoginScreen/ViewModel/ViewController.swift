//
//  ViewController.swift
//  Four-Bank
//
//  Created by Rayra Jovaneli on 6/13/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    @IBAction func seePassword(_ sender: UIButton) {
        passwordTextField.isSecureTextEntry = false
    }
    
    
    @IBAction func registerButton(_ sender: UIButton) {
        self.performSegue(withIdentifier: "RegisterName", sender: self)
    }


}

