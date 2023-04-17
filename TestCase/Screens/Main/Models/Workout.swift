//
//  Workout.swift
//  TestCase
//
//  Created by Douglas Hennrich on 17/04/23.
//

import Foundation

typealias Workouts = [Workout]

class Workout: Codable {
  // MARK: Properties
  var uid: String
  var name: String
  var description: String
  var date: Date
  var exercises: Exercises = []

  // MARK: Init
  init(
    uid: String,
    name: String,
    description: String,
    date: TimeInterval = Date().timeIntervalSince1970
  ) {
    self.uid = uid
    self.name = name
    self.description = description
    self.date = Date(timeIntervalSince1970: date)
  }
}

// MARK: Computed Variables
extension Workout {
  var formatedDate: String? {
    let dateFormatter = DateFormatter()
    dateFormatter.timeZone = TimeZone.current
    dateFormatter.locale = NSLocale.current
    dateFormatter.dateFormat = "HH:mm dd/MM/yyyy"

    return dateFormatter.string(from: self.date)
  }
}
