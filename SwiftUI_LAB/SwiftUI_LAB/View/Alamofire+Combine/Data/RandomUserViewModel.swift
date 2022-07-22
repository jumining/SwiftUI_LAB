//
//  RandomUserViewModel.swift
//  SwiftUI_LAB
//
//  Created by 임주민 on 2022/07/21.
//

import Foundation
import Combine
import Alamofire

class RandomUsreViewModel: ObservableObject { 
  
  var subscription = Set<AnyCancellable>()
  
  @Published var randomUsers = [RandomUser]()
  
  var baseUrl = "https://randomuser.me/api/?results=100"
  
  init() {
    print(#fileID, #function, #line, "")
    fetchRandomUsers()
  }
  
  func fetchRandomUsers() {
    print(#fileID, #function, #line, "")
    //기본 세션
    AF.request(baseUrl)
      .publishDecodable(type: RandomUserResponse.self) //파싱
      .compactMap{ $0.value } //옵셔널제거, 언랩핑
      .map{ $0.results } //result만 가지고 옴
      .sink(receiveCompletion: { completion in //구독을 통해 이벤트 받음
        print("데이터스트림 완료 ")
      }, receiveValue: { receivedValue in
        print("받은 값: \(receivedValue.count)")
        self.randomUsers = receivedValue //정제된 데이터를 넣음
      }).store(in: &subscription) //메모리에서 날려줌
  }
}
