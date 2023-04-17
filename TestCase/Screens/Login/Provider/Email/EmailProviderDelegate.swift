//
//  FirebaseAuthProviderDelegate.swift
//  TestCase
//
//  Created by Douglas Hennrich on 16/04/23.
//

import Foundation

protocol EmailProviderDelegate: AnyObject {
  func login(
    email: String,
    password: String,
    onCompletion completion: @escaping (Result<LoginResult, AppError>) -> Void
  )
}
