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
    repository?.getWorkouts(from: request.userId) { [weak self] result in
      guard self != nil else { return }

      switch result {
        case .success(let data):
          guard let workouts: Workouts = data.toModel() else {
            completion(.success([]))
            return
          }

          completion(.success(workouts))

        case .failure(let error):
          completion(.failure(.init(error: error)))
      }
    }
  }
}
