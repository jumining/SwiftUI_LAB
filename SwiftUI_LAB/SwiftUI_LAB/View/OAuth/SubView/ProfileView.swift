//
//  ProfileView.swift
//  SwiftUI_LAB
//
//  Created by 임주민 on 2022/07/23.
//

import SwiftUI

struct ProfileView: View {
  @EnvironmentObject var userVM : UserVM
  
  @State var id: String = ""
  @State var name: String = ""
  @State var email: String = ""
  @State var avatarImg: String = ""
  
  var body: some View {
    VStack(alignment: .center){
      Form{
        Section{
          HStack{
            Spacer()
            if !avatarImg.isEmpty { //이미지 존재
              AsyncImage(url: URL(string: avatarImg)!) { phase in
                switch phase {
                case .empty:
                  ProgressView()
                    .frame(width: 250, height: 250, alignment: .center)
                case .success(let image):
                  image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250, height: 250, alignment: .center)
                case .failure:
                  Image(systemName: "person.fill.questionmark")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                    .frame(width: 250, height: 250, alignment: .center)
                @unknown default:
                  EmptyView()
                    .frame(width: 250, height: 250, alignment: .center)
                }
              }
            } else { //이미지 존재X
              Image(systemName: "person.fill.questionmark")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
                .frame(width: 250, height: 250, alignment: .center)
            }
            Spacer()
          }
        }
        Section{
          Text("아이디: \(id)")
          Text("이름: \(name)")
          Text("이메일: \(email)")
        }
        Section{
          Button {
            print("새로고침 버튼 클릭")
            //userVM.fetchCurrentUserInfo()
          } label: {
            Text("새로고침")
          }
          
        }
      }
      .onAppear(perform: {
        print("ProfileView onAppear() called")
        //∫userVM.fetchCurrentUserInfo()
      })
      .onReceive(userVM.$loggedInUser, perform: { loggedInUser in
        print("ProfileView onReceive() called / loggedInUser")
        guard let user = loggedInUser else { return }
        self.id = "\(user.id)"
        self.name = user.name
        self.email = user.email
        self.avatarImg = user.avatar
      })
    }.navigationTitle("로그인 하기")
  }
}

struct ProfileView_Previews: PreviewProvider {
  static var previews: some View {
    ProfileView()
  }
}
