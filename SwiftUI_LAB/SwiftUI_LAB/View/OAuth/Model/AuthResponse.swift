//
//  AuthResponse.swift
//  SwiftUI_LAB
//
//  Created by 임주민 on 2022/07/23.
//

import Foundation

struct AuthResponse: Codable {
  var user: UserData
  var token: TokenData
  enum CodingKeys: String, CodingKey {
    case user
    case token
  }
}
