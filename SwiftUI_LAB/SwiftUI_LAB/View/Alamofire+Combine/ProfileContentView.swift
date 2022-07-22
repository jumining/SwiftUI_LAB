//
//  ProfileContentView.swift
//  SwiftUI_LAB
//
//  Created by 임주민 on 2022/07/21.
//

import SwiftUI

struct ProfileContentView: View {
  
  @ObservedObject var randomUserViewModel = RandomUsreViewModel()
  
    var body: some View {
      List(randomUserViewModel.randomUsers){ aRandomUser in RandomUserRowView(aRandomUser)
      }
//      List(0...100, id: \.self){ index in
//        RandomUserRowView()
//      }
    }
}

struct ProfileContentView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileContentView()
    }
}
