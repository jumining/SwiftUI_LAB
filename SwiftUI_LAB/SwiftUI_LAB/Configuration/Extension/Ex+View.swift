//
//  Ex+View.swift
//  SwiftUI_LAB
//
//  Created by 임주민 on 2022/07/07.
//

import Foundation
import SwiftUI

extension View {
  func highlightColor(lineWidth: CGFloat) -> some View {
    self.modifier(CircleHighlightedViewModifier(lineWidth: lineWidth))
  }
}

struct CircleHighlightedViewModifier: ViewModifier {
  var lineWidth: CGFloat
  
  func body(content: Content) -> some View {
    content
      .padding(4)
      .overlay(Circle().strokeBorder(Color(hex:"4CAF50").opacity(0.5), lineWidth: lineWidth))
  }
}
