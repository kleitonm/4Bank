//
//  PixScreen.swift
//  Four-Bank
//
//  Created by Rayra Jovaneli on 6/13/22.
//

import UIKit

class PixScreen: UIViewController {

    @IBOutlet weak var labelBalance: UILabel!
    @IBOutlet weak var labelUser: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func goBackButton(_ sender: UIButton) {
        let goBack = MainScreen(nibName: "MainScreen", bundle: nil)
               goBack.modalPresentationStyle = .fullScreen
               present(goBack, animated: true, completion: nil)
    }

    @IBAction func seeBalance(_ sender: UIButton) {
        labelBalance.text = "****"
    }
    
    @IBAction func myKeysButton(_ sender: UIButton) {
        let myKeys = MyKeys(nibName: "MyKeys", bundle: nil)
               myKeys.modalPresentationStyle = .fullScreen
               present(myKeys, animated: true, completion: nil)
    }
    
    @IBAction func transferPixButton(_ sender: UIButton) {
        let transferPix = TransferPIX(nibName: "TransferPIX", bundle: nil)
               transferPix.modalPresentationStyle = .fullScreen
               present(transferPix, animated: true, completion: nil)
    }
    
    @IBAction func receivePIX(_ sender: UIButton) {
        let receivePix = ReceivePix(nibName: "ReceivePix", bundle: nil)
               receivePix.modalPresentationStyle = .fullScreen
               present(receivePix, animated: true, completion: nil)
    }
    

}
