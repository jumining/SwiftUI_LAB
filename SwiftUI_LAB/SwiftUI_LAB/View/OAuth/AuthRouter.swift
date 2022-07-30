//
//  AuthRouter.swift
//  SwiftUI_LAB
//
//  Created by 임주민 on 2022/07/23.
//

import Foundation
import Alamofire

// 인증 라우터
// 회원가입, 로그인, 토큰갱신
enum AuthRouter: URLRequestConvertible {
  
  case register(name: String, email: String, password: String)
  case login(email: String, password: String)
  case tokenRefresh
  
  var baseURL: URL {
    return URL(string: APIClient.BASE_URL)!
  }
  
  var endPoint: String {
    switch self {
    case .register:
      return "user/register"
    case .login:
      return "user/login"
    case .tokenRefresh:
      return "user/token-refresh"
    default:
      return ""
    }
  }
  
  var method: HTTPMethod {
    switch self {
    default: return .post
    }
  }
  
  var parameters: Parameters{
    switch self {
    case let .login(email, password):
      var params = Parameters()
      params["email"] = email
      params["password"] = password
      return params
      
    case .register(let name, let email, let password):
      var params = Parameters()
      params["name"] = name
      params["email"] = email
      params["password"] = password
      return params
      
    case .tokenRefresh:
      var params = Parameters()
      let tokenData = UserDefaultsManager.shared.getTokens()
      params["refresh_token"] = tokenData.refreshToken
      return params
    }
  }
  
  // 최종 API 호출
  func asURLRequest() throws -> URLRequest {
    let url = baseURL.appendingPathComponent(endPoint)
    
    var request = URLRequest(url: url)
    
    request.method = method
    
    request.httpBody = try JSONEncoding.default.encode(request, with: parameters).httpBody
    
    return request
  }
}

