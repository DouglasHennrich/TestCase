//
//  DeleteWorkoutUseCase.swift
//  TestCase
//
//  Created by Douglas Hennrich on 17/04/23.
//

import Foundation

class DeleteWorkoutUseCase: DeleteWorkoutUseCaseDelegate {
  // MARK: Properties
  var repository: WorkoutsRepositoryDelegate?

  // MARK: Init
  init(repository: WorkoutsRepositoryDelegate?) {
    self.repository = repository
  }

  // MARK: Actions
  func execute(
    _ request: DeleteWorkoutUseCaseDTO,
    onCompletion completion: @escaping (Result<(), AppError>) -> Void
  ) {
    repository?.deleteWorkout(request.workout) { [weak self] result in
      guard self != nil else { return }

      switch result {
        case .success:
          completion(.success(()))

        case .failure(let error):
          completion(.failure(.init(error: error)))
      }
    }
  }
}
