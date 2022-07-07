//
//  ColorCirclesView.swift
//  SwiftUI_LAB
//
//  Created by 임주민 on 2022/07/07.
//

import SwiftUI

struct ColorCirclesView: View {
  
  @Binding var selection: String
  
  var body: some View {
    
    let colors = [
      "#4CAF50",
      "#8BC34A",
      "#FFA000",
      "#4589FF",
      "#0072C3",
      "#A56EFF"
    ]
    
    LazyVGrid(columns: Array(repeating: GridItem(.flexible(minimum: 28)), count: 6)) {
      ForEach(colors, id: \.self) { color in
        Circle()
        // Color(hex: ) : Ex+Color에 추가되어있음
          .foregroundColor(Color(hex: color))
          .overlay(
            Circle()
              .stroke(.black.opacity(0.05), lineWidth: 1)
          )
          .padding(5)
          .overlay(
            Circle()
              .stroke(.black.opacity(0.05), lineWidth: 1)
          )
          .frame(width: 28, height: 28)
        // highlightColor : Ex+View에 추가되어있음
          .highlightColor(lineWidth: selection == color ? 4 : 0)
          .onTapGesture {
            selection = color
          }
      }
    }
  }
}

struct ColorCirclesView_Previews: PreviewProvider {
  static var previews: some View {
    ColorPickerContentView()
  }
}
