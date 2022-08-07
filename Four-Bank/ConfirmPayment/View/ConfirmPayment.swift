//
//  ConfirmPayment.swift
//  Four-Bank
//
//  Created by user218260 on 6/13/22.
//

import UIKit

class ConfirmPayment: UIViewController {

    @IBOutlet weak var greenView: UIView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var valuelabel: UILabel!
    @IBOutlet weak var forPersonLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let date = Date()
        let dateFormatter = DateFormatter()
         
        dateFormatter.dateFormat = "d MMM yyyy HH:mm:ss"
        let result = dateFormatter.string(from: date)
        dateLabel.text = result
        
     
        valuelabel.text = "R$ 50,00"
        forPersonLabel.text = "Para João Pedro"
 
        
    }

    @IBAction func backButton(_ sender: UIButton) {
        let viewController = MainScreen(nibName: "MainScreen", bundle: nil)
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: true, completion: nil)
    }
    

}
