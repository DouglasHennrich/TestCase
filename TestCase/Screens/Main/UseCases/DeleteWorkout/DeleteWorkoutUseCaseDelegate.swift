//
//  DeleteWorkoutUseCaseDelegate.swift
//  TestCase
//
//  Created by Douglas Hennrich on 17/04/23.
//

import Foundation

protocol DeleteWorkoutUseCaseDelegate: AnyObject {
  func execute(
    _ request: DeleteWorkoutUseCaseDTO,
    onCompletion completion: @escaping (Result<(), AppError>) -> Void
  )
}
