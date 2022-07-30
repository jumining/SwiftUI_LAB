//
//  RegisterView.swift
//  SwiftUI_LAB
//
//  Created by 임주민 on 2022/07/23.
//

import SwiftUI

struct RegisterView: View {
  
  @EnvironmentObject var userVM: UserVM
  
  @State var nameInput: String = ""
  @State var emailInput: String = ""
  @State var pwdInput: String = ""
  
    var body: some View {
      VStack{
        Form{
          Section(header: Text("이름"), content: {
            TextField("이름", text: $nameInput).keyboardType(.default)
          })
          //
          Section(header: Text("이메일"), content: {
            TextField("이메일", text: $emailInput).keyboardType(.emailAddress).autocapitalization(.none)
          })
          //
          Section(header: Text("비밀번호"), content: {
            SecureField("비밀번호", text: $pwdInput).keyboardType(.default)
            SecureField("비밀번호확인", text: $pwdInput).keyboardType(.default)
          })
          Section {
            Button(action: {
              print("회원가입 버튼 클릭")
              userVM.register(name: nameInput, email: emailInput, password: pwdInput)
            }, label: {
              Text("회원가입 하기")
            })
          }
        }
      }.navigationTitle("회원가입 하기")
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
