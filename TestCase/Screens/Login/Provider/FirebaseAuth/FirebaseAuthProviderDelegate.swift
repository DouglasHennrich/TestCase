//
//  FirebaseAuthProviderDelegate.swift
//  TestCase
//
//  Created by Douglas Hennrich on 16/04/23.
//

import Foundation

protocol FirebaseAuthProviderDelegate: AnyObject {
  func login(
    email: String,
    password: String,
    onCompletion completion: @escaping (Result<LoginResult, Error>) -> Void
  )
  func register(email: String, password: String)
}
