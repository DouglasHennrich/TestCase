//
//  LoginAuthenticationUseCase.swift
//  TestCase
//
//  Created by Douglas Hennrich on 16/04/23.
//

import Foundation

class LoginAuthenticationUseCase: LoginAuthenticationUseCaseDelegate {
  // MARK: Properties
  var appleUseCase: AppleAuthenticationUseCaseDelegate?
  var emailUseCase: EmailAuthenticationUseCaseDelegate?

  // MARK: Init
  init(
    appleUseCase: AppleAuthenticationUseCaseDelegate?,
    emailUseCase: EmailAuthenticationUseCaseDelegate?
  ) {
    self.appleUseCase = appleUseCase
    self.emailUseCase = emailUseCase
  }

  // MARK: Actions
  func execute(
    _ request: LoginAuthenticationUseCaseDTO,
    onCompletion completion: @escaping (Result<LoginResult, AppError>) -> Void
  ) {
    switch request.loginType {
      case .email:
        emailAuthenticate(request, onCompletion: completion)

      case .apple:
        break
    }
  }

  private func emailAuthenticate(
    _ request: LoginAuthenticationUseCaseDTO,
    onCompletion completion: @escaping (Result<LoginResult, AppError>) -> Void
  ) {
    guard let email = request.email,
          let password = request.password
    else {
      completion(.failure(.missingParameters))
      return
    }

    let request = EmailAuthenticationUseCaseDTO(email: email, password: password)

    emailUseCase?.execute(request, onCompletion: completion)
  }

  private func appleAuthenticate(
    onCompletion completion: @escaping (Result<LoginResult, Error>) -> Void
  ) {
    // appleUseCase?.execute(request)
  }
}
