//
//  RandomUser+ResponseData.swift
//  SwiftUI_LAB
//
//  Created by 임주민 on 2022/07/21.
//

import Foundation

struct RandomUser: Codable, Identifiable, CustomStringConvertible {
  var id = UUID()
  var name: Name
  var photo: Photo
  private enum CodingKeys: String, CodingKey {
    case name = "name"
    case photo = "picture"
  }
  static func getDummy() -> Self {
    print(#fileID, #function, #line, "")
    return RandomUser(name: Name.getDummy(), photo: Photo.getDummy())
  }
  
  var profileImgUrl: URL {
    get {
      URL(string: photo.medium)!
    }
  }
  
  var description: String {
    return name.description
  }
}

struct Name: Codable, CustomStringConvertible {
  var title: String
  var first: String
  var last: String

  static func getDummy() -> Self {
    print(#fileID, #function, #line, "")
    return Name(title: "유튜버", first: "정대리", last: "개발하는")
  }
  var description: String {
    return "[\(title)] \(last), \(first)"
  }
}

struct Photo: Codable {
  var large: String
  var medium: String
  var thumbnail: String
  static func getDummy() -> Self {
    print(#fileID, #function, #line, "")
    return Photo(large: "https://randomuser.me/api/portraits/men/71.jpg", medium: "https://randomuser.me/api/portraits/men/71.jpg", thumbnail: "https://randomuser.me/api/portraits/men/71.jpg")
  }
}

struct Info: Codable {
  var seed: String
  var resultsCount: Int
  var page: Int
  var version: String
  private enum CodingKeys: String, CodingKey {
    case seed = "seed"
    case resultsCount = "results"
    case page = "page"
    case version = "version"
  }
}

struct RandomUserResponse: Codable {
  var results: [RandomUser]
  var info: Info
  private enum CodingKeys: String, CodingKey {
    case results, info
  }
}
