//
//  BarCode.swift
//  Four-Bank
//
//  Created by user218260 on 6/13/22.
//

import UIKit

class BarCode: UIViewController {

    
    @IBOutlet weak var tfBarCode: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    func alertError() {
           let alert = UIAlertController(title: "Erro!", message: "O código digitado não é válido", preferredStyle: .alert)
           
           alert.addAction(UIAlertAction(title: "Ok", style: .default))
           self.present(alert, animated: true, completion: nil)
           
       }
  
    @IBAction func btBack(_ sender: UIButton) {
        let mainScreen = MainScreen(nibName: "MainScreen", bundle: nil)
               mainScreen.modalPresentationStyle = .fullScreen
               present(mainScreen, animated: true, completion: nil)
    }
    
    @IBAction func btNext(_ sender: UIButton) {
        
        Model.barCode = tfBarCode.text ?? ""

        
        if tfBarCode.text == "00190500954014481606906809350314337370000000100" {
        let confirmPaymentData = ConfirmPaymentData(nibName: "ConfirmPaymentData", bundle: nil)
               confirmPaymentData.modalPresentationStyle = .fullScreen
               present(confirmPaymentData, animated: true, completion: nil)
        } else {
            alertError()
        }
        
    }
}
