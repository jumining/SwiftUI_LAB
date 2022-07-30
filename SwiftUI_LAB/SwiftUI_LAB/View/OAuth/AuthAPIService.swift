//
//  AuthAPIService.swift
//  SwiftUI_LAB
//
//  Created by 임주민 on 2022/07/23.
//

import Foundation
import Alamofire
import Combine

enum AuthAPIService {
  static func register(name: String, email: String, password: String) -> AnyPublisher<UserData, AFError>{
  print("AuthAPIService = register() called")
  
  return APIClient.shared.session
    .request(AuthRouter.register(name: name, email: email, password: password))
    .publishDecodable(type: AuthResponse.self)
    .value()
    .map{ receivedValue in
      return receivedValue.user
    }.eraseToAnyPublisher()
  }
}
