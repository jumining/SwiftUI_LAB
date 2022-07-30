//
//  TokenData.swift
//  SwiftUI_LAB
//
//  Created by 임주민 on 2022/07/23.
//

import Foundation

struct TokenData: Codable {
    let tokenType: String = ""
    let expiresIn: Int = 0
    let accessToken, refreshToken: String

    enum CodingKeys: String, CodingKey {
        case tokenType = "token_type"
        case expiresIn = "expires_in"
        case accessToken = "access_token"
        case refreshToken = "refresh_token"
    }
}
