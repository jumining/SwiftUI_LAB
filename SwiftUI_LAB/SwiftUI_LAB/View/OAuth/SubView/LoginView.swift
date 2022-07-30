//
//  LoginView.swift
//  SwiftUI_LAB
//
//  Created by 임주민 on 2022/07/23.
//

import SwiftUI

struct LoginView: View {
  
  @State var emailInput: String = ""
  @State var pwdInput: String = ""
  
    var body: some View {
      VStack{
        Form{
          Section(header: Text("로그인 정보"), content: {
            TextField("이메일", text: $emailInput).keyboardType(.emailAddress).autocapitalization(.none)
            SecureField("비밀번호", text: $pwdInput).keyboardType(.default)
          })
          Section(header: Text("로그인 정보"), content: {
            Button(action: {
              print("로그인 버튼 클릭")
            }, label: {
              Text("로그인 하기")
            })
          })
        }
      }.navigationTitle("로그인 하기")
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
