//
//  WorkoutsUseCase.swift
//  TestCase
//
//  Created by Douglas Hennrich on 17/04/23.
//

import Foundation

class WorkoutsUseCase: WorkoutsUseCaseDelegate {
  // MARK: Properties
  var repository: WorkoutsRepositoryDelegate?

  // MARK: Init
  init(repository: WorkoutsRepositoryDelegate?) {
    self.repository = repository
  }

  // MARK: Actions
  func execute(
    _ request: WorkoutsUseCaseDTO,
    onCompletion completion: @escaping (Result<Workouts, AppError>) -> Void
  ) {

  }
}
