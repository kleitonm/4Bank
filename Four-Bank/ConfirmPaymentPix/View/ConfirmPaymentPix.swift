//
//  ConfirmPaymentPix.swift
//  Four-Bank
//
//  Created by user218997 on 15/06/22.
//

import UIKit

class ConfirmPaymentPix: UIViewController {

    @IBOutlet weak var lbValue: UILabel!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbKey: UILabel!
    @IBOutlet weak var lbInstitution: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let value = ModelPix.lbValue
        let key = ModelPix.lbKey
        
        lbValue.text = "\("R$ ")\(value ?? "")" + ", 00"
        lbKey.text = key
        lbName.text = "Júlia Silva"

    }


    
    @IBAction func btBack(_ sender: UIButton) {
        let transferPix = TransferPIX(nibName: "TransferPIX", bundle: nil)
               transferPix.modalPresentationStyle = .fullScreen
               present(transferPix, animated: true, completion: nil)
    }
    
    @IBAction func btConfirm(_ sender: Any) {
        let paymentReceiptPix = PaymentReceiptPix(nibName: "PaymentReceiptPix", bundle: nil)
               paymentReceiptPix.modalPresentationStyle = .fullScreen
               present(paymentReceiptPix, animated: true, completion: nil)
        
    
        
    }
    
}
