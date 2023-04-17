//
//  EmailAuthenticationUseCase.swift
//  TestCase
//
//  Created by Douglas Hennrich on 16/04/23.
//

import Foundation
import FirebaseAuth

class EmailAuthenticationUseCase: EmailAuthenticationUseCaseDelegate {
  // MARK: Properties
  var emailRepository: EmailRepositoryDelegate?

  // MARK: Init
  init(emailRepository: EmailRepositoryDelegate?) {
    self.emailRepository = emailRepository
  }

  // MARK: Actions
  func execute(
    _ request: EmailAuthenticationUseCaseDTO,
    onCompletion completion: @escaping (Result<LoginResult, AppError>) -> Void
  ) {
    emailRepository?.login(
      email: request.email,
      password: request.password
    ) { [weak self] result in
      guard self != nil else { return }

      switch result {
        case .success(let data):
          guard let loginResponse: LoginResult = data.toModel() else {
            completion(.failure(.noUserFound))
            return
          }

          completion(.success(loginResponse))

        case .failure(let error):
          completion(.failure(.init(error: error)))
      }
    }
  }
}
