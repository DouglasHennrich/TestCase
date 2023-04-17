//
//  RegisterUseCaseDelegate.swift
//  TestCase
//
//  Created by Douglas Hennrich on 16/04/23.
//

import Foundation

protocol RegisterUseCaseDelegate: AnyObject {
  func execute(
    _ request: RegisterUseCaseDTO,
    onCompletion completion: @escaping (Result<RegisterResult, AppError>) -> Void
  )
}
