//
//  WorkoutsRepositoryDelegate.swift
//  TestCase
//
//  Created by Douglas Hennrich on 17/04/23.
//

import Foundation

protocol WorkoutsRepositoryDelegate: AnyObject {
  func getWorkouts(
    from userId: String,
    onCompletion completion: @escaping (Result<Data, Error>) -> Void
  )

  func deleteWorkout(
    _ workout: Workout,
    onCompletion completion: @escaping (Result<(), Error>) -> Void
  )

  func editWorkout(
    _ workout: Workout,
    userId: String,
    onCompletion completion: @escaping (Result<(), Error>) -> Void
  )

  func createWorkout(
    _ workout: Workout,
    userId: String,
    onCompletion completion: @escaping (Result<Data, Error>) -> Void
  )
}
