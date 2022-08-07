//
//  MyKeys.swift
//  Four-Bank
//
//  Created by Rayra Jovaneli on 6/13/22.
//

import UIKit

class MyKeys: UIViewController {
    
    var viewModel = MyKeysViewModel()
    var registerKey = RegisterNewKeyViewModel()

    
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var userEmailLabel: UILabel!
    
    @IBOutlet weak var cpfLabel: UILabel!
    @IBOutlet weak var userCpfLabel: UILabel!
    
    
    @IBOutlet weak var telephoneLabel: UILabel!
    @IBOutlet weak var userTelephoneLabel: UILabel!
    
    @IBOutlet weak var randomKeyLabel: UILabel!
    @IBOutlet weak var userRandomKeyLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.myKeys(completion: {result in
                    switch result{
                    case .success(let data):
                        for user in data{
                            
                            //  MyKeysModel.cpfPIX = user.cpfPix
                            self.userCpfLabel.text = MyKeysModel.cpfPIX
                            self.userEmailLabel.text = MyKeysModel.emailPIX
                            self.userTelephoneLabel.text = MyKeysModel.cellphonePIX
                            self.userRandomKeyLabel.text = user.randowKeyPix
                         }
                    case .failure(let error):
                        print("erro")
                    }
                    
                }
                )
        
    }

    @IBAction func registerNewKey(_ sender: UIButton) {
        let newKey = RegisterNewKey(nibName: "RegisterNewKey", bundle: nil)
            newKey.modalPresentationStyle = .fullScreen
            present(newKey, animated: true, completion: nil)

    }
    
    @IBAction func goBackButton(_ sender: UIButton) {
        let pixScreen = PixScreen(nibName: "PixScreen", bundle: nil)
            pixScreen.modalPresentationStyle = .fullScreen
            present(pixScreen, animated: true, completion: nil)
    }
    
}
