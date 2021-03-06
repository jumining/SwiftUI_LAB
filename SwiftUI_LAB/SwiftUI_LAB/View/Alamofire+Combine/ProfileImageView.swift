//
//  ProfileImageView.swift
//  SwiftUI_LAB
//
//  Created by 임주민 on 2022/07/21.
//

import Foundation
import SwiftUI
import URLImage

struct ProfileImgView: View {
  
  var imageUrl: URL
  
  var body: some View {
    URLImage(imageUrl) { image in
        image
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
    .frame(width: 50, height: 60)
    .clipShape(Circle())
    .overlay(Circle().stroke(Color.yellow, lineWidth: 2))
  }
}

struct ProfileImgView_Previews: PreviewProvider {
    static var previews: some View {
     
      let url = URL(string: "https://randomuser.me/api/portraits/men/21.jpg")!
      
      ProfileImgView(imageUrl: url)
    }
}
