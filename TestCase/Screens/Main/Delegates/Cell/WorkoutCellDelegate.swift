//
//  WorkoutCellDelegate.swift
//  TestCase
//
//  Created by Douglas Hennrich on 17/04/23.
//

import Foundation

protocol WorkoutCellDelegate: AnyObject {
  func onWorkoutDetailsCellAction(_ workout: Workout?)
  func onShowDeleteAlert(_ workout: Workout?)
}
