//
//  ColorPickerContentView.swift
//  SwiftUI_LAB
//
//  Created by 임주민 on 2022/07/07.
//

import SwiftUI

struct ColorPickerContentView: View {
  
  @State var selectedColor: String =  "#4CAF50"
  @State var isButtonClicked = false
  @State var showColorPicker = false
  
  var body: some View {
    VStack {
      HStack {
        // 현재 선택된 색상을 보여주는 상단 왼쪽 작은 동그라미
        Circle()
          .foregroundColor(Color(hex: selectedColor))
          .overlay(
            Circle()
              .stroke(.black.opacity(0.05), lineWidth: 1)
          )
          .padding(3)
          .overlay(
            Circle()
              .stroke(.black.opacity(0.05), lineWidth: 1)
          )
          .frame(width: 24, height: 24)
        
        Text("색상 고르기")
          .font(.system(size: 16))
          .foregroundColor(Color(hex: "121619"))
          .padding(.leading, 10)
        
        Spacer()
        
        // 화살표 버튼
        Button(action: {
          withAnimation {
            self.showColorPicker.toggle()
            self.isButtonClicked.toggle()
          }
        }) {
          Image(systemName: self.isButtonClicked ? "chevron.down" : "chevron.right" )
            .font(.system(size: 20))
            .frame(width: 24, height: 24)
            .foregroundColor(Color(hex: "#121619"))
        }
      }.padding()
      
      // 화살표 버튼 클릭 시 색상 팔레트 보여줌
      if showColorPicker {
        ColorCirclesView(selectedColor: $selectedColor)
          .padding()
      }
      
      // 현재 선택된 색상을 보여주는 하단의 큰 네모
      RoundedRectangle(cornerRadius: 25, style: .continuous)
        .fill(Color(hex: selectedColor)) /// (hex: ) : Ex+Color에 추가되어있음
      
    }.padding()
  }
}

struct ColorPickerContentView_Previews: PreviewProvider {
  static var previews: some View {
    ColorPickerContentView()
  }
}
