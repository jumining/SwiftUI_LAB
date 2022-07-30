//
//  UserData.swift
//  SwiftUI_LAB
//
//  Created by 임주민 on 2022/07/23.
//

import Foundation

struct UserData : Codable, Identifiable {
    var uuid: UUID = UUID()
    var id : Int
    var name: String
    var email: String
    var avatar: String
    private enum CodingKeys: String, CodingKey{
        case id
        case name
        case email
        case avatar
    }
}
