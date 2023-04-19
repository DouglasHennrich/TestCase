//
//  Excercise.swift
//  TestCase
//
//  Created by Douglas Hennrich on 17/04/23.
//

import Foundation

typealias Exercises = [Exercise]

class Exercise: Codable {
  // MARK: Properties
  var uid: String
  var name: Int
  var image: String?
  var notes: String?

  // MARK: Init
  init(
    name: Int,
    image: String?,
    notes: String?
  ) {
    uid = UUID().uuidString
    self.name = name
    self.image = image
    self.notes = notes
  }

  convenience init(fromDictionary dictionary: [String: Any]) {
    let name = dictionary["name"] as? Int ?? 0
    let image = dictionary["image"] as? String ?? ""
    let notes = dictionary["notes"] as? String ?? ""

    self.init(name: name, image: image, notes: notes)
  }
}

// MARK: Empty
extension Exercise {
  static func empty() -> Exercise {
    .init(name: 0, image: "", notes: "")
  }
}

// MARK: Equatable
extension Exercise: Equatable {
  static func == (lhs: Exercise, rhs: Exercise) -> Bool {
    lhs.uid == rhs.uid
  }
}
