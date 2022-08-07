//
//  PaymentReceiptPix.swift
//  Four-Bank
//
//  Created by Rayra Jovaneli on 15/06/22.
//

import UIKit

class PaymentReceiptPix: UIViewController {

    var confirmPaymentPix = ConfirmPaymentPix()
    
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var labelBalance: UILabel!
    @IBOutlet weak var labelName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let date = Date()
        let dateFormatter = DateFormatter()
         
        dateFormatter.dateFormat = "d MMM yyyy HH:mm:ss"
        let result = dateFormatter.string(from: date)
        labelDate.text = result
        
        labelName.text = "Para Júlia Silva"
        let balance = ModelPix.lbValue
        
        labelBalance.text = "\("R$ ") \(balance ?? "")" + ", 00"

        }

    @IBAction func closeButton(_ sender: UIButton) {
        let mainScreen = MainScreen(nibName: "MainScreen", bundle: nil)
            mainScreen.modalPresentationStyle = .fullScreen
            present(mainScreen, animated: true, completion: nil)
    }
    

}
