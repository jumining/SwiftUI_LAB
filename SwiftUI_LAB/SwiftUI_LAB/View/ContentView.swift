//
//  ContentView.swift
//  SwiftUI_LAB
//
//  Created by 임주민 on 2022/07/07.
//

import SwiftUI

struct ContentView: View {
  @StateObject var store = MemoStore()
  
  var body: some View {
    NavigationView {
      List {
        NavigationLink(destination: ColorPickerContentView()) {
          Text("커스텀 Color Picker")
        }
        NavigationLink(destination: ProfileContentView()) {
          Text("API 통신으로 랜덤 유저 프로필")
        }
        NavigationLink(destination: OAuthContentView().environmentObject(UserVM())) {
          Text("OAuth 로그인, 회원가입")
        }
        NavigationLink(destination: MemoListView().environmentObject(store)) {
          Text("메모앱 만들기")
        }
      }
      .navigationBarTitle("SwiftUI 실험실")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
