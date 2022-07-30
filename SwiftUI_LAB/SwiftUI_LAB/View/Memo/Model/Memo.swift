//
//  Memo.swift
//  SwiftUI_LAB
//
//  Created by 임주민 on 2022/07/30.
//

import Foundation
import SwiftUI

class Memo: Identifiable, ObservableObject {
  let id: UUID
  @Published var content: String
  let insertDate: Date
  
  init(content: String, insertDate: Date = Date.now) {
    id = UUID()
    self.content = content
    self.insertDate = insertDate
  }
}
