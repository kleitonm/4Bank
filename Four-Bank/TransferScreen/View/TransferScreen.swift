//
//  TransferScreen.swift
//  Four-Bank
//
//  Created by user218260 on 6/13/22.
//

import UIKit

class TransferScreen: UIViewController {
    
    var user = LoginScreen()
    var viewModel = TransferScreenViewModel()
    
    @IBOutlet weak var labelBalance: UILabel!
    @IBOutlet weak var valueTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.transferScreenData(completion: {result in
            switch result{
            case .success(let data):
                for user in data{
                    if (Int(Pix.PixValue) ?? 0) < user.accountBalance || (Int(TransferModel.valueTransfer ?? "") ?? 0) < user.accountBalance{
                        self.labelBalance.text = "\((user.accountBalance) - (Int(Pix.PixValue) ?? 0) - (Int(TransferModel.valueTransfer ?? "") ?? 0))" + ", 00"
                        
                        if Model.barCode == "00190500954014481606906809350314337370000000100"{
                            self.labelBalance.text = "\((user.accountBalance) - (Int(Pix.PixValue) ?? 0) - (Int(TransferModel.valueTransfer ?? "") ?? 0) - 50)" + ", 00"
                        }
                    } else {
                        self.labelBalance.text = "\(user.accountBalance) "
                                        }
                }
            case .failure(let error):
                print("erro")
            }
            
        }
        )
        
    }
    
    @IBAction func seeBalanceButton(_ sender: UIButton) {
        (sender as! UIButton).isSelected = !(sender as! UIButton).isSelected
        if (sender as! UIButton).isSelected{
            labelBalance.text = "****"
        } else {
            viewModel.transferScreenData(completion: {result in
                switch result{
                case .success(let data):
                    for user in data{
                        if (Int(Pix.PixValue) ?? 0) < user.accountBalance || (Int(TransferModel.valueTransfer ?? "") ?? 0) < user.accountBalance{
                            self.labelBalance.text = "\((user.accountBalance) - (Int(Pix.PixValue) ?? 0) - (Int(TransferModel.valueTransfer ?? "") ?? 0))" + ", 00"
                            
                            if Model.barCode == "00190500954014481606906809350314337370000000100"{
                                self.labelBalance.text = "\((user.accountBalance) - (Int(Pix.PixValue) ?? 0) - (Int(TransferModel.valueTransfer ?? "") ?? 0) - 50)" + ", 00"
                            }
                        } else {
                            self.labelBalance.text = "\(user.accountBalance) "
                                            }
                    }
                case .failure(let error):
                    print("erro")
                }
                
            }
            )
            
        }
    }
    
    @IBAction func goBackButton(_ sender: UIButton) {
        let mainScreen = MainScreen(nibName: "MainScreen", bundle: nil)
        mainScreen.modalPresentationStyle = .fullScreen
        present(mainScreen, animated: true, completion: nil)
    }
    
    @IBAction func nextScreenButton(_ sender: UIButton) {
        
        TransferModel.valueTransfer = valueTextField.text ?? ""
        
        viewModel.transferScreenData(completion: {result in
            switch result{
            case .success(let data):
                for user in data{
                    if (Int(TransferModel.valueTransfer ?? "") ?? 0) > user.accountBalance{
                        let alert = UIAlertController(title: "Atenção", message: "Saldo Insuficiente!", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    } else {
                        
                        if self.valueTextField.text != ""{
                            let confirmTransfer = TransferReceipt(nibName: "TransferReceipt", bundle: nil)
                            confirmTransfer.modalPresentationStyle = .fullScreen
                            self.present(confirmTransfer, animated: true, completion: nil)
                        } else {
                            let alert = UIAlertController(title: "Atenção", message: "Valor de transferência inválido! Tente novamente.", preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                            self.present(alert, animated: true, completion: nil)
                        }
                    }
                }
            case .failure(let error):
                print("erro")
            }
            
        }
        )
        
        
    }
    
}
