//
//  TransferReceipt.swift
//  Four-Bank
//
//  Created by Rayra Jovaneli on 6/13/22.
//

import UIKit

class TransferReceipt: UIViewController {

    @IBOutlet weak var labelBalance: UILabel!
    @IBOutlet weak var agencyTextField: UITextField!
    @IBOutlet weak var accountTextField: UITextField!
    @IBOutlet weak var cpfTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let balance = TransferModel.valueTransfer
        labelBalance.text = "\("R$ ")\(balance ?? "")" + ", 00"
    }

    @IBAction func goBackButton(_ sender: UIButton) {
        let goBack = TransferScreen(nibName: "TransferScreen", bundle: nil)
            goBack.modalPresentationStyle = .fullScreen
            present(goBack, animated: true, completion: nil)
    }
    
    @IBAction func confirmButton(_ sender: UIButton) {
        
        TransferModel.agency = agencyTextField.text ?? ""
        TransferModel.account = accountTextField.text ?? ""
        TransferModel.cpf = cpfTextField.text ?? ""
        
        if (agencyTextField.text != "" && accountTextField.text != "" && cpfTextField.text != ""){
            let confirmData = ConfirmTransferData(nibName: "ConfirmTransferData", bundle: nil)
                confirmData.modalPresentationStyle = .fullScreen
                present(confirmData, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Atenção", message: "Todos os campos devem ser preenchidos!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    

}
