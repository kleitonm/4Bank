//
//  RegisterNewKeyViewModel.swift
//  Four-Bank
//
//  Created by user218997 on 22/06/22.
//

import Foundation
import UIKit
 

class RegisterNewKeyViewModel: UIViewController{
    
    func registerNewKey(cpfPix: String, emailPix: String, cellphonePix: String){
            let params: [String: Any] = [
                "cpfPix": cpfPix,
                "emailPix": emailPix,
                "cellphonePix": cellphonePix
                ]
        guard let url = URL(string: "https://62ad2075402135c7acbce26b.mockapi.io/api/v1/account1") else {
                   fatalError("typicode URL not working")
               }
               var request = URLRequest(url: url)
               request.httpMethod = "PUT"
               request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
               request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
               
               let session = URLSession.shared.dataTask(with: request) { data, response, error in
                               
              
                   if let error = error {
                       
                       print("The error was: \(error.localizedDescription)")
                       
                   } else {
                           
                           print(url)
                       let jsonRes = try? JSONSerialization.jsonObject(with: data!, options: [])
                           print("Response json is: \(jsonRes)")
                       
                   }
                   
               }.resume()
        }
    
    
}
