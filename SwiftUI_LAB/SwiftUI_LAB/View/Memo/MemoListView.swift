//
//  MemoListView.swift
//  SwiftUI_LAB
//
//  Created by 임주민 on 2022/07/30.
//

import SwiftUI

struct MemoListView: View {
  @EnvironmentObject var store: MemoStore
    
  @State private var showComposer: Bool = false
  
  var body: some View {
    NavigationView {
      List(store.list) { memo in
        MemoCell(memo: memo)
      }
      .listStyle(.plain)
      .navigationTitle("내 메모")
      .toolbar {
        Button {
          showComposer = true
        } label: {
          Image(systemName: "plus")
        }
      }
      .sheet(isPresented: $showComposer) {
        ComposeView()
      }
    }
  }
}

struct MemoListView_Previews: PreviewProvider {
    static var previews: some View {
        MemoListView()
        .environmentObject(MemoStore())
    }
}
