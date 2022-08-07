//
//  NetworkViewModel.swift
//  Four-Bank
//
//  Created by user218997 on 14/06/22.
//

import Foundation
import Alamofire
import CryptoKit
import UIKit

class NetworkViewModel: UIViewController {
    
    func register(name: String, cpf: String, cellphoneNumber: String, street: String, neighborhood: String, cep: String, number: String, cityBank: String, state: String, password: String ) {
        let params: [String: Any] = [
            "account": "12682",
            "agency": "3962",
            "bank": "FourBank",
            "cityBank": cityBank,
            "accountBalance": 6000,
            "name": name,
            "cpf": cpf,
            "password": password,
            "street": street,
            "number": number,
            "cep": cep,
            "neighborhood": neighborhood,
            "state": state,
            "cellphoneNumber": cellphoneNumber,
            "cpfPix": cpf,
            "emailPix": "@gmail.com",
            "cellphonePix": cellphoneNumber,
            "randowKeyPix": "jhskdj895ASDlsnop",
            "cvv": 584,
            "value": 1228,
            "cardNumber": 1554239847651047

        ] 
       
        guard let url = URL(string: "https://62ad2075402135c7acbce26b.mockapi.io/api/v1/account1") else {
                   fatalError("typicode URL not working")
               }
               var request = URLRequest(url: url)
               request.httpMethod = "POST"
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
