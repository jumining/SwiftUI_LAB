//
//  DetailView.swift
//  SwiftUI_LAB
//
//  Created by 임주민 on 2022/07/30.
//

import SwiftUI

struct DetailView: View {
  @ObservedObject var memo: Memo
  //published로 선언한 속성이 바뀔 때 마다 뷰가 자동으로 업데이트
  
  @State private var showComposer = false
  @EnvironmentObject var store: MemoStore
  
  var body: some View {
    VStack{
      ScrollView{
        VStack{
          HStack {
            Text(memo.content)
              .padding()
            Spacer(minLength: 8)
          }
          
          Text(memo.insertDate, style: .date)
            .padding()
            .font(.footnote)
            .foregroundColor(.secondary)
        }
      }
    }
    .navigationTitle("메모 보기")
    .navigationBarTitleDisplayMode(.inline)
    .toolbar {
      ToolbarItemGroup(placement: .bottomBar) {
        Button {
          showComposer = true
        } label: {
          Image(systemName: "square.and.pencil")
        }
      }
    }
    .sheet(isPresented: $showComposer) {
      ComposeView(memo: memo)
    }
  }
}

struct DetailView_Previews: PreviewProvider {
  static var previews: some View {
    DetailView(memo: Memo(content: "Hello")).environmentObject(MemoStore())
  }
}
