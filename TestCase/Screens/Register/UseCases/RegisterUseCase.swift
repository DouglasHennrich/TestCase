//
//  RegisterUseCase.swift
//  TestCase
//
//  Created by Douglas Hennrich on 16/04/23.
//

import Foundation

class RegisterUseCase: RegisterUseCaseDelegate {
  // MARK: Properties
  var repository: RegisterRepositoryDelegate?

  // MARK: Init
  init(repository: RegisterRepositoryDelegate?) {
    self.repository = repository
  }
  
  // MARK: Actions
  func execute(
    _ request: RegisterUseCaseDTO,
    onCompletion completion: @escaping (Result<RegisterResult, AppError>) -> Void
  ) {
    repository?.register(email: request.email, password: request.password) { [weak self] result in
      guard self != nil else { return }

      switch result {
        case .success(let data):
          guard let register: RegisterResult = data.toModel() else {
            completion(.failure(.noUserFound))
            return
          }

          completion(.success(register))

        case .failure(let error):
          completion(.failure(.init(error: error)))
      }
    }
  }
}
