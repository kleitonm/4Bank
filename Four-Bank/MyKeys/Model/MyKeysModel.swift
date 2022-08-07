//
//  MyKeysModel.swift
//  Four-Bank
//
//  Created by user218997 on 22/06/22.
//

import Foundation

struct MyKeysPix: Codable{
    var cpfPix: String
    var emailPix: String
    var cellphonePix: String
    var randowKeyPix: String
}

class MyKeysModel: Codable{
    static var cpfPIX: String?
    static var emailPIX: String?
    static var cellphonePIX: String?
}
