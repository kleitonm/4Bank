//
//  PixScreen.swift
//  Four-Bank
//
//  Created by Rayra Jovaneli on 6/15/22.
//

import UIKit

class PixScreen: UIViewController {

    var viewModel = PixScreenViewModel()
    
    @IBOutlet weak var labelBalance: UILabel!
    @IBOutlet weak var labelUser: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.PixScreen(completion: {result in
                    switch result{
                    case .success(let data):
                        for user in data{
                            if (Int(Pix.PixValue) ?? 0) < user.accountBalance || (Int(TransferModel.valueTransfer ?? "") ?? 0) < user.accountBalance{
                                self.labelBalance.text = "\("R$ ")\((user.accountBalance) - (Int(Pix.PixValue) ?? 0) - (Int(TransferModel.valueTransfer ?? "") ?? 0))" + ", 00"
                                
                                if Model.barCode == "00190500954014481606906809350314337370000000100"{
                                    self.labelBalance.text = "\("R$ ")\((user.accountBalance) - (Int(Pix.PixValue) ?? 0) - (Int(TransferModel.valueTransfer ?? "") ?? 0) - 50)" + ", 00"
                                }
                            } else {
                                self.labelBalance.text = "\("R$ ")\(user.accountBalance) " + ", 00"
                                                }
                            self.labelUser.text = user.name
                        }
                    case .failure(let error):
                        print("erro")
                    }
                    
                }
                )
        
    }
    
    @IBAction func goBackButton(_ sender: UIButton) {
        let goBack = MainScreen(nibName: "MainScreen", bundle: nil)
            goBack.modalPresentationStyle = .fullScreen
            present(goBack, animated: true, completion: nil)
       }
    
    @IBAction func seeBalance(_ sender: UIButton) {
        (sender as! UIButton).isSelected = !(sender as! UIButton).isSelected
        if (sender as! UIButton).isSelected{
            labelBalance.text = "R$ ****"
           } else {
               viewModel.PixScreen(completion: {result in
                   switch result{
                   case .success(let data):
                       for user in data{
                           if (Int(Pix.PixValue) ?? 0) < user.accountBalance || (Int(TransferModel.valueTransfer ?? "") ?? 0) < user.accountBalance{
                               self.labelBalance.text = "\("R$ ")\((user.accountBalance) - (Int(Pix.PixValue) ?? 0) - (Int(TransferModel.valueTransfer ?? "") ?? 0))" + ", 00"
                               
                               if Model.barCode == "00190500954014481606906809350314337370000000100"{
                                   self.labelBalance.text = "\("R$ ")\((user.accountBalance) - (Int(Pix.PixValue) ?? 0) - (Int(TransferModel.valueTransfer ?? "") ?? 0) - 50)" + ", 00"
                               }
                           } else {
                               self.labelBalance.text = "\("R$ ")\(user.accountBalance) " + ", 00"
                                               }
                           self.labelUser.text = user.name
                       }

                   case .failure(let error):
                       print("erro")
                   }
                   
               }
               )

    }
        }
    
    @IBAction func myKeysButton(_ sender: UIButton) {
        let myKeys = MyKeys(nibName: "MyKeys", bundle: nil)
            myKeys.modalPresentationStyle = .fullScreen
            present(myKeys, animated: true, completion: nil)
       }
    @IBAction func transferPixButton(_ sender: UIButton) {
        let transferPix = TransferPIX(nibName: "TransferPIX", bundle: nil)
            transferPix.modalPresentationStyle = .fullScreen
            present(transferPix, animated: true, completion: nil)
        }
    @IBAction func receivePIX(_ sender: UIButton) {
        let receivePix = ReceivePix(nibName: "ReceivePix", bundle: nil)
            receivePix.modalPresentationStyle = .fullScreen
            present(receivePix, animated: true, completion: nil)
        }

}
