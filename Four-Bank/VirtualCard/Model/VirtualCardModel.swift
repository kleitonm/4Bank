//
//  VirtualCardModel.swift
//  Four-Bank
//
//  Created by user218997 on 22/06/22.
//

import Foundation

struct MyCardVirtual: Codable{
    var cardNumber: Int
    var name: String
    var value: Int
    var cvv: Int
}
