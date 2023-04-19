//
//  AddEditWorkoutUseCase.swift
//  TestCase
//
//  Created by Douglas Hennrich on 18/04/23.
//

import Foundation

class AddEditWorkoutUseCase: AddEditWorkoutUseCaseDelegate {
  // MARK: Properties
  var repository: WorkoutsRepositoryDelegate?

  // MARK: Init
  init(repository: WorkoutsRepositoryDelegate?) {
    self.repository = repository
  }

  // MARK: Actions
  func execute(
    _ request: AddEditWorkoutUseCaseDTO,
    onCompletion completion: @escaping (Result<Workout, AppError>) -> Void
  ) {
    if request.workout.uid.isNotEmpty {
      editWorkout(request, onCompletion: completion)
    } else {
      createWorkout(request, onCompletion: completion)
    }
  }

  private func editWorkout(
    _ request: AddEditWorkoutUseCaseDTO,
    onCompletion completion: @escaping (Result<Workout, AppError>) -> Void
  ) {
    repository?.editWorkout(
      request.workout,
      userId: request.userId
    ) { [weak self] result in
      guard self != nil else { return }

      switch result {
        case .success:
          completion(.success(request.workout))

        case .failure(let error):
          completion(.failure(.init(error: error)))
      }
    }
  }

  private func createWorkout(
    _ request: AddEditWorkoutUseCaseDTO,
    onCompletion completion: @escaping (Result<Workout, AppError>) -> Void
  ) {
    repository?.createWorkout(
      request.workout,
      userId: request.userId
    ) { [weak self] result in
      guard self != nil else { return }

      switch result {
        case .success(let data):
          guard let workout: Workout = data.toModel() else {
            completion(.failure(.cantCreateWorkout))
            return
          }

          completion(.success(workout))

        case .failure(let error):
          completion(.failure(.init(error: error)))
      }
    }
  }
}
