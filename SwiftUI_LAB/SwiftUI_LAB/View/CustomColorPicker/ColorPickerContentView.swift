//
//  ColorPickerContentView.swift
//  SwiftUI_LAB
//
//  Created by 임주민 on 2022/07/07.
//

import SwiftUI

struct ColorPickerContentView: View {
  @State var selection: String =  "#4CAF50"
  
  var body: some View {
    VStack {
      ColorCirclesView(selection: $selection)
      
      RoundedRectangle(cornerRadius: 25, style: .continuous)
        .fill(Color(hex: selection)) // (hex: ) : Ex+Color에 추가되어있음
        .padding()
    }
  }
}

struct ColorPickerContentView_Previews: PreviewProvider {
  static var previews: some View {
    ColorPickerContentView()
  }
}
