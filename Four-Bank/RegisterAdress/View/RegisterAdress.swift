//
//  RegisterAdress.swift
//  Four-Bank
//
//  Created by user218260 on 6/17/22.
//

import UIKit

class RegisterAdress: UIViewController {

    @IBOutlet weak var andressTextField: UITextField!
    @IBOutlet weak var districtTextField: UITextField!
    @IBOutlet weak var zipCodeTextField: UITextField!
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var complementTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func nextButton(_ sender: UIButton) {
        if(andressTextField.text != "" && districtTextField.text != "" && zipCodeTextField.text != "" &&
           numberTextField.text != "" && complementTextField.text != "" && stateTextField.text != ""){
            let registerPassword = RegisterPassword(nibName: "RegisterPassword", bundle: nil)
            registerPassword.modalPresentationStyle = .fullScreen
            present(registerPassword, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Atenção", message: "Todos os campos devem ser preenchidos!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
       
    }
    
    
    @IBAction func returnButton(_ sender: UIButton) {
        let loginScreen = LoginScreen(nibName: "LoginScreen", bundle: nil)
        loginScreen.modalPresentationStyle = .fullScreen
        present(loginScreen, animated: true, completion: nil)
    }
    

}
