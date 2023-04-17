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
  var firebaseAuthProvider: FirebaseAuthProviderDelegate?

  // MARK: Init
  init(firebaseAuthProvider: FirebaseAuthProviderDelegate?) {
    self.firebaseAuthProvider = firebaseAuthProvider
  }

  // MARK: Actions
  func execute(
    _ request: EmailAuthenticationUseCaseDTO,
    onCompletion completion: @escaping (Result<LoginResult, Error>) -> Void
  ) {
    firebaseAuthProvider?.login(
      email: request.email,
      password: request.password
    ) { result in
      switch result {
        case .success(let success):
          break
        case .failure(let failure):
          break
      }
    }
  }
}
