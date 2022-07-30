//
//  MemoCell.swift
//  SwiftUI_LAB
//
//  Created by 임주민 on 2022/07/30.
//

import SwiftUI

struct MemoCell: View {
  @ObservedObject var memo: Memo
  //memo 업데이트 될 때마다 뷰가 새롭게 업데이트 -> 항상 최신화
  
  var body: some View {
    VStack(alignment: .leading){
      Text(memo.content)
        .font(.body)
        .lineLimit(1)
      
      Text(memo.insertDate, style: .date)
        .font(.caption)
        .foregroundColor(.secondary)
    }
  }
}


struct MemoCell_Previews: PreviewProvider {
    static var previews: some View {
      MemoCell(memo: Memo(content: "Test"))
    }
}
