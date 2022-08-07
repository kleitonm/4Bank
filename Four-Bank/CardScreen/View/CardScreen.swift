//
//  CardScreen.swift
//  Four-Bank
//
//  Created by user218260 on 6/13/22.
//

import UIKit

class CardScreen: UIViewController {
    
    var cardScreenViewModel = CardScreenViewModel()

    @IBOutlet weak var lbName1: UILabel!
    @IBOutlet weak var lbCardNumber1: UILabel!
    @IBOutlet weak var lbName2: UILabel!
    @IBOutlet weak var lbCardNumber2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cardScreenViewModel.cardScreen { result in
            switch result{
            case .success(let data):
                for user in data {
                    self.lbName1.text = user.name
                    self.lbName2.text = user.name
                }
            case .failure(let error):
                print("erro")
            }
        }
        

    }


    @IBAction func btShowCard1(_ sender: UIButton) {
        let physicalCard = PhysicalCard(nibName: "PhysicalCard", bundle: nil)
               physicalCard.modalPresentationStyle = .fullScreen
               present(physicalCard, animated: true, completion: nil)
    }
    
    @IBAction func btShowCard2(_ sender: UIButton) {
        let virtualCard = VirtualCard(nibName: "VirtualCard", bundle: nil)
               virtualCard.modalPresentationStyle = .fullScreen
               present(virtualCard, animated: true, completion: nil)
    }
    
    @IBAction func btBack(_ sender: UIButton) {
        let mainScreen = MainScreen(nibName: "MainScreen", bundle: nil)
               mainScreen.modalPresentationStyle = .fullScreen
               present(mainScreen, animated: true, completion: nil)
    }
    
}
