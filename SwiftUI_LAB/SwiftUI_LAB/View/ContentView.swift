//
//  ContentView.swift
//  SwiftUI_LAB
//
//  Created by 임주민 on 2022/07/07.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    NavigationView {
      List {
        NavigationLink(destination: ColorPickerContentView()) {
          Text("커스텀 Color Picker")
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
