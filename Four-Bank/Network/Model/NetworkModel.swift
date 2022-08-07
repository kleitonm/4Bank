//
//  NetworkModel.swift
//  Four-Bank
//
//  Created by user218997 on 14/06/22.
//

import Foundation


struct UserApi: Codable {
var account: String
var agency: String
var bank: String
var cityBank: String
var state: String
var accountBalance: Int
var name: String
var birthDate: String
var cpf: String
var rg: String
var email: String
var password: String
var street: String
var number: String
var cep: String
var neighborhood: String
var cellphoneNumber: String
var cpfPix: String
var emailPix: String
var cellphonePix: String
var randowKeyPix: String
var cvv: Int
var value: Int
var cardNumber: Int
var id: String
}

struct PostApi: Codable {
    var account: String
    var agency: String
    var bank: String
    var cityBank: String
    var state: String
    var accountBalance: Int
    var name: String
    var cpf: String
    var password: String
    var street: String
    var number: String
    var cep: String
    var neighborhood: String
    var cellphoneNumber: String
    var cpfPix: String
    var emailPix: String
    var cellphonePix: String
    var randowKeyPix: String
    var cvv: Int
    var value: Int
    var cardNumber: Int
}





