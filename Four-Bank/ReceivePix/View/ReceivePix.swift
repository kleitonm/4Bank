//
//  ReceivePix.swift
//  Four-Bank
//
//  Created by user218260 on 6/13/22.
//

import UIKit

class ReceivePix: UIViewController {

    @IBOutlet weak var myImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }


   
    @IBAction func btBack(_ sender: UIButton) {
        let pixScreen = PixScreen(nibName: "PixScreen", bundle: nil)
               pixScreen.modalPresentationStyle = .fullScreen
               present(pixScreen, animated: true, completion: nil)
    }
    
}
