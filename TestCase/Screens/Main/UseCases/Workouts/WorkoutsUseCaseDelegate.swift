//
//  WorkoutsUseCaseDelegate.swift
//  TestCase
//
//  Created by Douglas Hennrich on 17/04/23.
//

import Foundation

protocol WorkoutsUseCaseDelegate: AnyObject {
  func execute(
    _ request: WorkoutsUseCaseDTO,
    onCompletion completion: @escaping (Result<Workouts, AppError>) -> Void
  )
}
