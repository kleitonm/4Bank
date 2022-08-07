//
//  VirtualCard.swift
//  Four-Bank
//
//  Created by user218260 on 6/13/22.
//

import UIKit

class VirtualCard: UIViewController {
    
    var virtualCard = VirtualCardViewModel()

    @IBOutlet weak var lbNumberCard: UILabel!
    @IBOutlet weak var lbNumber: UILabel!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbValidity: UILabel!
    @IBOutlet weak var lbCvv: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        virtualCard.virtualCard { result in
            switch result {
            case .success(let data):
                for user in data {
                    self.lbNumberCard.text = "\(user.cardNumber)"
                    self.lbNumber.text = "\(user.cardNumber)"
                    self.lbName.text = user.name
                    self.lbValidity.text = "\(user.value)"
                    self.lbCvv.text = "\(user.cvv)"
                }
            case .failure(let error):
                print("erro")
            }
        }

    }


    @IBAction func btBack(_ sender: UIButton) {
        let cardScreen = CardScreen(nibName: "CardScreen", bundle: nil)
               cardScreen.modalPresentationStyle = .fullScreen
               present(cardScreen, animated: true, completion: nil)
    }
    
}
