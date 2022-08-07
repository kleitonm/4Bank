//
//  ConfirmPaymentData.swift
//  Four-Bank
//
//  Created by user218260 on 6/13/22.
//

import UIKit

class ConfirmPaymentData: UIViewController {

   var barCode = BarCode()
    
    @IBOutlet weak var lbValue: UILabel!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbAgency: UILabel!
    @IBOutlet weak var lbCpf: UILabel!
    @IBOutlet weak var lbAccount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lbValue.text = "R$ 50,00"
        lbName.text = "João Pedro"
        lbAgency.text = "5642"
        lbCpf.text = "45286579968"
        lbAccount.text = "36951"
        
    }


    @IBAction func btBack(_ sender: UIButton) {
        let barCode = BarCode(nibName: "BarCode", bundle: nil)
               barCode.modalPresentationStyle = .fullScreen
               present(barCode, animated: true, completion: nil)
    }
    
    @IBAction func btConfirm(_ sender: UIButton) {
        
        let confirmPayment = ConfirmPayment(nibName: "ConfirmPayment", bundle: nil)
               confirmPayment.modalPresentationStyle = .fullScreen
               present(confirmPayment, animated: true, completion: nil)
    }
}
