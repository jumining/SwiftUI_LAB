//
//  APIClient.swift
//  SwiftUI_LAB
//
//  Created by 임주민 on 2022/07/23.
//

import Foundation
import Alamofire

final class APIClient {
  
  static let shared = APIClient()
  
  static let BASE_URL = "https://dev-jeongdaeri-oauth.tk/api"
  
  let interceptors = Interceptor(interceptors: [
    BaseInterceptor()
  ])
  
  let monitors = [ApiLogger()] as [EventMonitor]
  
  var session: Session
  
  init() {
    print("APIClient - init() called")
    session = Session(interceptor: interceptors)
  }
}

