//
//  RegisterNewKey.swift
//  Four-Bank
//
//  Created by user218260 on 6/13/22.
//

import UIKit

class RegisterNewKey: UIViewController {
    
    var viewModel = RegisterNewKeyViewModel()
    var viewLabel = MyKeys()

    @IBOutlet weak var greenView: UIView!
    @IBOutlet weak var registerNewKeyTextField: UITextField!    
    @IBOutlet weak var emailPixTextField: UITextField!
    @IBOutlet weak var cellphonePixTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func backButton(_ sender: UIButton) {
        
        let viewController = MyKeys(nibName: "MyKeys", bundle: nil)
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: true, completion: nil)
        
    }
    
    @IBAction func randomkeyButton(_ sender: UIButton) {
    
        
        let randomkey = MyKeys(nibName: "MyKeys", bundle: nil)
        randomkey.modalPresentationStyle = .fullScreen
        
        let alert: UIAlertController = UIAlertController(title: "Parabéns!", message: "Chave Aleatória Gerada! ", preferredStyle: .alert)
        let action: UIAlertAction = UIAlertAction(title: "OK", style: .default) {
        (action) in
            self.show(randomkey, sender: nil)
        }
        alert.addAction(action)
        self.present(alert, animated: true)
        
        let viewController = MyKeys(nibName: "MyKeys", bundle: nil)
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: true, completion: nil)
    }
    
    @IBAction func registerKeyButton(_ sender: UIButton) {
        
        let cpfPIX = registerNewKeyTextField.text ?? ""
        let emailPIX = emailPixTextField.text ?? ""
        let cellphonePIX = cellphonePixTextField.text ?? ""
        
        MyKeysModel.cpfPIX = registerNewKeyTextField.text ?? ""
        MyKeysModel.emailPIX = emailPixTextField.text ?? ""
        MyKeysModel.cellphonePIX = cellphonePixTextField.text ?? ""
        
        if registerNewKeyTextField.text != "" || emailPixTextField.text != "" || cellphonePixTextField.text != ""{
            viewModel.registerNewKey(cpfPix: cpfPIX , emailPix: emailPIX, cellphonePix: cellphonePIX)
            
            let mykeys = MyKeys(nibName: "MyKeys", bundle: nil)
            mykeys.modalPresentationStyle = .fullScreen
            
            let alert: UIAlertController = UIAlertController(title: "Parabéns!", message: "Chave Cadastrada com Sucesso! ", preferredStyle: .alert)
            let action: UIAlertAction = UIAlertAction(title: "OK", style: .default) {
            (action) in
                self.show(mykeys, sender: nil)
            }
            alert.addAction(action)
            self.present(alert, animated: true)
            
            let viewController = MyKeys(nibName: "MyKeys", bundle: nil)
            viewController.modalPresentationStyle = .fullScreen
            present(viewController, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Atenção", message: "Chave Inválida! Tente novamente.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        

    }
    
                        
    }
    


