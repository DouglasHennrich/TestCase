//
//  LoginAuthenticationUseCaseDelegate.swift
//  TestCase
//
//  Created by Douglas Hennrich on 16/04/23.
//

import Foundation

protocol LoginAuthenticationUseCaseDelegate: AnyObject {
  func execute(
    _ request: LoginAuthenticationUseCaseDTO,
    onCompletion completion: @escaping (Result<LoginResult, Error>) -> Void
  )
}
