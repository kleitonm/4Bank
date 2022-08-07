//
//  LoginViewController.swift
//  Four-Bank
//
//  Created by user218260 on 6/20/22.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {
    
    
    func login(completion: @escaping (Result<[UserApi], Error>) -> Void) {
            
            let url = "https://62ad2075402135c7acbce26b.mockapi.io/api/v1/account1"
            
            AF.request(url).responseJSON {response in
                
                if let data = response.data {
                    
                    do {
                        
                        let users: [UserApi] = try JSONDecoder().decode([UserApi].self, from: data)
                        
                        completion(.success(users))
                    }
                    catch {
                        
                        completion(.failure(error))
                    }
                }
            }
        }

}

