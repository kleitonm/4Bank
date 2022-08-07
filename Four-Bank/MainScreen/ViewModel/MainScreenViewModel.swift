//
//  MainScreenViewModel.swift
//  Four-Bank
//
//  Created by user218997 on 22/06/22.
//

import Foundation
import UIKit
import Alamofire

class MainScreenViewModel: UIViewController{
    
    func mainScreenData(completion: @escaping (Result<[GetApiLabel], Error>) -> Void) {
                
                let url = "https://62ad2075402135c7acbce26b.mockapi.io/api/v1/account1"
                
                AF.request(url).responseJSON {response in
                    
                    if let data = response.data {
                        
                        do {
                            
                            let users: [GetApiLabel] = try JSONDecoder().decode([GetApiLabel].self, from: data)
                            
                                    completion(.success(users))
                                               
                                } catch {
                            
                            completion(.failure(error))
                        }
                    }
                }
            }
}
