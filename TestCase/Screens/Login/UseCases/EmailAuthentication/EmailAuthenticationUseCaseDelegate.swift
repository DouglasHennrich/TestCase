//
//  EmailAuthenticationUseCaseDelegate.swift
//  TestCase
//
//  Created by Douglas Hennrich on 16/04/23.
//

import Foundation

protocol EmailAuthenticationUseCaseDelegate: AnyObject {
  func execute(
    _ request: EmailAuthenticationUseCaseDTO,
    onCompletion completion: @escaping (Result<LoginResult, Error>) -> Void
  )
}
