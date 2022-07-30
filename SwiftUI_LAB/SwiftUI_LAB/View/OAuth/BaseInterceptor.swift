//
//  BaseInterceptor.swift
//  SwiftUI_LAB
//
//  Created by 임주민 on 2022/07/23.
//

import Foundation
import Alamofire

class BaseInterceptor: RequestInterceptor {
  
  func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
    
    var request = urlRequest
    
    // header
    request.addValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")
    request.addValue("application/json; charset=UTF-8", forHTTPHeaderField: "Accept")
                     
                                      
    completion(.success(request))
  }
}
