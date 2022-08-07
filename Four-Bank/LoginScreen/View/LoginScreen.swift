//
//  LoginScreen.swift
//  Four-Bank
//
//  Created by user218260 on 6/14/22.
//

import UIKit

class LoginScreen: UIViewController {
    

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func seePassword(_ sender: UIButton) {
        (sender as! UIButton).isSelected = !(sender as! UIButton).isSelected
        if (sender as! UIButton).isSelected{
             passwordTextField.isSecureTextEntry = false
           } else {
               passwordTextField.isSecureTextEntry = true
    }
    }
        
    
    @IBAction func registerButton(_ sender: UIButton) {
        let loginScreen = RegisterAdress(nibName: "RegisterAdress", bundle: nil)
               loginScreen.modalPresentationStyle = .fullScreen
               present(loginScreen, animated: true, completion: nil)
    }
    
    
    @IBAction func loginButton(_ sender: UIButton) {
        
        let loginViewController = LoginViewController()

        
        loginViewController.login(completion: { result in
               switch result {
               case .success(let data):
                   for user in data {
                       if self.emailTextField.text ?? "" == user.cpf &&
                           self.passwordTextField.text ?? "" == user.password {
                           let mainScreen = MainScreen(nibName: "MainScreen", bundle: nil)
                               mainScreen.modalPresentationStyle = .fullScreen
                           self.present(mainScreen, animated: true, completion: nil)
                       }
                   }
                   let alert = UIAlertController(title: "Erro", message: "Usuário não cadastrado", preferredStyle: .alert)
                   alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                   self.present(alert, animated: true, completion: nil)
               
               case .failure(let error):
               
               let alert = UIAlertController(title: "Erro", message: "Falha ao logar!", preferredStyle: .alert)
               alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
               self.present(alert, animated: true, completion: nil)
       
           }
       })
   }
           }
     


