//
//  UserViewModel.swift
//  SwiftUI_LAB
//
//  Created by 임주민 on 2022/07/24.
//

import Foundation
import Alamofire
import Combine

class UserVM: ObservableObject {
  var subscription = Set<AnyCancellable>()
  
  @Published var loggedInUser: UserData? = nil
  
  // 회원가입 메소드
  func register(name: String, email: String, password: String) {
    print("UserVM: register() called")
    AuthAPIService.register(name: name, email: email, password: password)
      .sink{ (completion: Subscribers.Completion<AFError>) in
        print("UserVM completion: \(completion)")
      } receiveValue: { (receivedUser: UserData) in
        self.loggedInUser = receivedUser
      }.store(in: &subscription)
  }
  
  //  // 로그인 메소드
  //  func login(email: String, password: String){
  //    print("UserVM: login() called")
  //    AuthAPIService.login(email: email, password: password)
  //      .sink { (completion: Subscribers.Completion<AFError>) in
  //        print("UserVM completion: \(completion)")
  //      } receiveValue: { (receivedUser: UserData) in
  //        self.loggedInUser = receivedUser
  //        self.loginSuccess.send()
  //      }.store(in: &subscription)
  //  }
  
  //  // 현재 사용자 정보 가져오기
  //  func fetchCurrentUserInfo(){
  //    print("UserVM - fetchCurrentUserInfo() called")
  //    UserAPIService.fetchCurrentUserInfo()
  //      .sink { (completion: Subscribers.Completion<AFError>) in
  //        print("UserVM fetchCurrentUserInfo completion: \(completion)")
  //      } receiveValue: { (receivedUser: UserData) in
  //        print("UserVM fetchCurrentUserInfo receivedUser: \(receivedUser)")
  //        self.loggedInUser = receivedUser
  //      }.store(in: &subscription)
  //  }
  //
  //  // 모든 사용자 가져오기
  //  func fetchUsers(){
  //    print("UserVM - fetchUsers() called")
  //    UserAPIService.fetchUsers()
  //      .sink { (completion: Subscribers.Completion<AFError>) in
  //        print("UserVM fetchUsers completion: \(completion)")
  //      } receiveValue: { (fetchedUsers: [UserData]) in
  //        print("UserVM fetchUsers fetchedUsers.count: \(fetchedUsers.count)")
  //        self.users = fetchedUsers
  //      }.store(in: &subscription)
  //  }
}
