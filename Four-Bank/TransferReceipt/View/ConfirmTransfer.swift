//
//  ConfirmTransfer.swift
//  Four-Bank
//
//  Created by user218260 on 6/13/22.
//

import UIKit

class ConfirmTransfer: UIViewController {

    
    
    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var lbDate: UILabel!
    @IBOutlet weak var lbValue: UILabel!
    @IBOutlet weak var lbName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let date = Date()
        let dateFormatter = DateFormatter()
         
        dateFormatter.dateFormat = "d MMM yyyy HH:mm:ss"
         
        let result = dateFormatter.string(from: date)
        lbDate.text = result
        
        let value = TransferModel.valueTransfer
        
        lbValue.text = "\("R$")\(value ?? "")" + ", 00"
        lbName.text = "Para Gabriel Oliveira"

    }
    
  
    

    @IBAction func btClose(_ sender: UIButton) {
        let mainScreen = MainScreen(nibName: "MainScreen", bundle: nil)
               mainScreen.modalPresentationStyle = .fullScreen
               present(mainScreen, animated: true, completion: nil)
    }
    

}
