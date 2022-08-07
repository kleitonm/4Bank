//
//  ConfirmTransferData.swift
//  Four-Bank
//
//  Created by user218260 on 6/13/22.
//

import UIKit

class ConfirmTransferData: UIViewController {

    @IBOutlet weak var lbValue: UILabel!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbAgency: UILabel!
    @IBOutlet weak var lbCpf: UILabel!
    @IBOutlet weak var lbAccount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let value = TransferModel.valueTransfer
        let account = TransferModel.account
        let agency = TransferModel.agency
        let cpf = TransferModel.cpf
        
        lbValue.text = "\("R$ ") \(value ?? "")" + ", 00"
        lbAccount.text = account
        lbCpf.text = cpf
        lbAgency.text = agency
        lbName.text = "Gabriel Oliveira"

        
    }

    @IBAction func btConfirm(_ sender: UIButton) {
        let confirmTransfer = ConfirmTransfer(nibName: "ConfirmTransfer", bundle: nil)
               confirmTransfer.modalPresentationStyle = .fullScreen
               present(confirmTransfer, animated: true, completion: nil)
    }
    
    @IBAction func btBack(_ sender: UIButton) {
        let transferReceipt = TransferReceipt(nibName: "TransferReceipt", bundle: nil)
               transferReceipt.modalPresentationStyle = .fullScreen
               present(transferReceipt, animated: true, completion: nil)
    }
}
