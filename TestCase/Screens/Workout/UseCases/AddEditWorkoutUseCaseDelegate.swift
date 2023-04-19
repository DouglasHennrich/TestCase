//
//  AddEditWorkoutUseCaseDelegate.swift
//  TestCase
//
//  Created by Douglas Hennrich on 18/04/23.
//

import Foundation

protocol AddEditWorkoutUseCaseDelegate: AnyObject {
  func execute(
    _ request: AddEditWorkoutUseCaseDTO,
    onCompletion completion: @escaping (Result<Workout, AppError>) -> Void
  )
}
