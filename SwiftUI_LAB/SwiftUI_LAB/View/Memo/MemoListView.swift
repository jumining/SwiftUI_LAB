//
//  MemoListView.swift
//  SwiftUI_LAB
//
//  Created by 임주민 on 2022/07/30.
//

import SwiftUI

struct MemoListView: View {
  @EnvironmentObject var store: MemoStore
    
  var body: some View {
    NavigationView {
      List(store.list) { memo in
        VStack(alignment: .leading){
          Text(memo.content)
            .font(.body)
            .lineLimit(1)
          
          Text(memo.insertDate, style: .date)
            .font(.caption)
            .foregroundColor(.secondary)
        }
      }
      .listStyle(.plain)
      .navigationTitle("내 메모")
    }
  }
}

struct MemoListView_Previews: PreviewProvider {
    static var previews: some View {
        MemoListView()
        .environmentObject(MemoStore())
    }
}
