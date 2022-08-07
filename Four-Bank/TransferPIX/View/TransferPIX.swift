//
//  TransferPIX.swift
//  Four-Bank
//
//  Created by user218260 on 6/13/22.
//

import UIKit

class TransferPIX: UIViewController {
    
    var viewModel = TransferPixViewModel()
    var confirm = ConfirmPaymentData()
    
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var insertPhoneTextField: UITextField!
    @IBOutlet weak var insertValueTextField: UITextField!
    @IBOutlet weak var personOneImage: UIImageView!
    @IBOutlet weak var nameOneLabel: UILabel!
    @IBOutlet weak var personTwoImage: UIImageView!
    @IBOutlet weak var nameTwoLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.TransferPix(completion: {result in
            switch result{
            case .success(let data):
                for user in data{
                    if (Int(Pix.PixValue) ?? 0) < user.accountBalance || (Int(TransferModel.valueTransfer ?? "") ?? 0) < user.accountBalance{
                        self.balanceLabel.text = "\("R$ ")\((user.accountBalance) - (Int(Pix.PixValue) ?? 0) - (Int(TransferModel.valueTransfer ?? "") ?? 0))" + ", 00"
                        
                        if Model.barCode == "00190500954014481606906809350314337370000000100"{
                            self.balanceLabel.text = "\("R$ ")\((user.accountBalance) - (Int(Pix.PixValue) ?? 0) - (Int(TransferModel.valueTransfer ?? "") ?? 0) - 50)" + ", 00"
                        }
                    } else {
                        self.balanceLabel.text = "\("R$ ")\(user.accountBalance) "
                                        }
                    
                }
            case .failure(let error):
                print("erro")
            }
            
        }
        )
        // Do any additional setup after loading the view.
    }
    
    @IBAction func seeBalance(_ sender: UIButton) {
        (sender as! UIButton).isSelected = !(sender as! UIButton).isSelected
        if (sender as! UIButton).isSelected{
            balanceLabel.text = "R$ ****"
        } else {
            viewModel.TransferPix(completion: {result in
                switch result{
                case .success(let data):
                    for user in data{
                        if (Int(Pix.PixValue) ?? 0) < user.accountBalance || (Int(TransferModel.valueTransfer ?? "") ?? 0) < user.accountBalance{
                            self.balanceLabel.text = "\("R$ ")\((user.accountBalance) - (Int(Pix.PixValue) ?? 0) - (Int(TransferModel.valueTransfer ?? "") ?? 0))" + ", 00"
                            
                            if Model.barCode == "00190500954014481606906809350314337370000000100"{
                                self.balanceLabel.text = "\("R$ ")\((user.accountBalance) - (Int(Pix.PixValue) ?? 0) - (Int(TransferModel.valueTransfer ?? "") ?? 0) - 50)" + ", 00"
                            }
                        } else {
                            self.balanceLabel.text = "\("R$ ")\(user.accountBalance) "
                                            }

                    }
                case .failure(let error):
                    print("erro")
                }
                
            }
            )
            
        }
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        let viewController = PixScreen(nibName: "PixScreen", bundle: nil)
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: true, completion: nil)
    }
    
    @IBAction func transferButton(_ sender: UIButton) {
        
        ModelPix.lbValue = insertValueTextField.text ?? ""
        ModelPix.lbKey = insertPhoneTextField.text ?? ""
        Pix.PixValue = insertValueTextField.text ?? ""
        
        viewModel.TransferPix(completion: {result in
            switch result{
            case .success(let data):
                for user in data{
                    if (Int(Pix.PixValue) ?? 0) > user.accountBalance{
                        let alert = UIAlertController(title: "Atenção", message: "Saldo Insuficiente!", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    } else {
                        if(self.insertValueTextField.text != "" && self.insertPhoneTextField.text != ""){
                            let viewController = ConfirmPaymentPix(nibName: "ConfirmPaymentPix", bundle: nil)
                            viewController.modalPresentationStyle = .fullScreen
                            self.present(viewController, animated: true, completion: nil)
                        } else {
                            let alert = UIAlertController(title: "Atenção", message: "Todos os campos devem ser preenchidos!", preferredStyle: .alert)
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
