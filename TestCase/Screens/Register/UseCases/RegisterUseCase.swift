//
//  RegisterUseCase.swift
//  TestCase
//
//  Created by Douglas Hennrich on 16/04/23.
//

import Foundation

class RegisterUseCase: RegisterUseCaseDelegate {
  // MARK: Properties
  var provider: RegisterProviderDelegate?

  // MARK: Init
  init(provider: RegisterProviderDelegate?) {
    self.provider = provider
  }
  
  // MARK: Actions
  func execute(
    _ request: RegisterUseCaseDTO,
    onCompletion completion: @escaping (Result<RegisterResult, AppError>) -> Void
  ) {
    provider?.register(email: request.email, password: request.password, onCompletion: completion)
  }
}
