//
//  MainScreen.swift
//  Four-Bank
//
//  Created by user218260 on 6/13/22.
//

import UIKit

class MainScreen: UIViewController {
    
    var viewModel = MainScreenViewModel()
    var confirm = ConfirmPaymentData()

    @IBOutlet weak var labelBalance: UILabel!
    @IBOutlet weak var labelAgency: UILabel!
    @IBOutlet weak var labelAccount: UILabel!
    @IBOutlet weak var labelName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.mainScreenData(completion: {result in
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
                    self.labelAgency.text = user.agency
                    self.labelAccount.text = user.account
                    self.labelName.text = "Olá, " + user.name
                }
            case .failure(let error):
                print("erro")
            }
            
        }
        )
        
    }
    
    @IBAction func seeBalanceButton(_ sender: Any){
        (sender as! UIButton).isSelected = !(sender as! UIButton).isSelected
        if (sender as! UIButton).isSelected{
            labelBalance.text = "****"
        } else {
            viewModel.mainScreenData(completion: {result in
                switch result{
                case .success(let data):
                    for user in data{
                        if (Int(Pix.PixValue) ?? 0) < user.accountBalance || (Int(TransferModel.valueTransfer ?? "") ?? 0) < user.accountBalance{
                            self.labelBalance.text = "\((user.accountBalance) - (Int(Pix.PixValue) ?? 0) - (Int(TransferModel.valueTransfer ?? "") ?? 0))" + ", 00"
                            
                            if Model.barCode == "00190500954014481606906809350314337370000000100"{
                                self.labelBalance.text = "\((user.accountBalance) - (Int(Pix.PixValue) ?? 0) - (Int(TransferModel.valueTransfer ?? "") ?? 0) - 50)" + ", 00"
                            }
                        } else {
                            self.labelBalance.text = "\("R$ ")\(user.accountBalance) " + ", 00"
                                            }
                    }
                case .failure(let error):
                    print("erro")
                }
                
            }
            )
            
        }
    }
    
    @IBAction func pixButton(_ sender: UIButton) {
        let pixScreen = PixScreen(nibName: "PixScreen", bundle: nil)
        pixScreen.modalPresentationStyle = .fullScreen
        present(pixScreen, animated: true, completion: nil)
    }
    
    @IBAction func pixButton2(_ sender: UIButton) {
        let pixScreen = PixScreen(nibName: "PixScreen", bundle: nil)
        pixScreen.modalPresentationStyle = .fullScreen
        present(pixScreen, animated: true, completion: nil)
    }
    
    @IBAction func barcodeButton(_ sender: UIButton) {
        let barcode = BarCode(nibName: "BarCode", bundle: nil)
        barcode.modalPresentationStyle = .fullScreen
        present(barcode, animated: true, completion: nil)
    }
    
    @IBAction func payButton(_ sender: UIButton) {
        let pay = BarCode(nibName: "BarCode", bundle: nil)
        pay.modalPresentationStyle = .fullScreen
        present(pay, animated: true, completion: nil)
    }
    
    @IBAction func transferButton(_ sender: UIButton) {
        let transfer = TransferScreen(nibName: "TransferScreen", bundle: nil)
        transfer.modalPresentationStyle = .fullScreen
        present(transfer, animated: true, completion: nil)
    }
    @IBAction func cardScreenButton(_ sender: UIButton) {
        let cardScreen = CardScreen(nibName: "CardScreen", bundle: nil)
        cardScreen.modalPresentationStyle = .fullScreen
        present(cardScreen, animated: true, completion: nil)
        
    }
    
    @IBAction func btGoOut(_ sender: UIButton) {
        let loginScreen = LoginScreen(nibName: "LoginScreen", bundle: nil)
        loginScreen.modalPresentationStyle = .fullScreen
        present(loginScreen, animated: true, completion: nil)
    }
}
