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
  var id: String
  var name: Int
  var image: String?
  var notes: String?

  // MARK: Init
  init(
    name: Int,
    image: String?,
    notes: String?
  ) {
    id = UUID().uuidString
    self.name = name
    self.image = image
    self.notes = notes
  }
}
