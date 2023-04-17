//
//  FirebaseAuthProvider.swift
//  TestCase
//
//  Created by Douglas Hennrich on 16/04/23.
//

import Foundation
import FirebaseAuth

class FirebaseAuthProvider {
  // MARK: Properties
  let auth = Auth.auth()
}

// MARK: Conforms to Email Provider
extension FirebaseAuthProvider: EmailProviderDelegate {
  func login(
    email: String,
    password: String,
    onCompletion completion: @escaping (Result<LoginResult, AppError>) -> Void
  ) {
    auth.signIn(withEmail: email, password: password) { [weak self] result, error in
      guard self != nil else { return }

      if let error {
        completion(.failure(.init(error: error)))
        return
      }

      guard let user = result?.user else {
        completion(.failure(.noUserFound))
        return
      }

      let uid = user.uid
      let email = user.email
      let photoURL = user.photoURL
      let provider = user.providerID
      let providerData = user.providerData

      completion(
        .success(
          .init(
            email: email,
            token: user.refreshToken,
            loginType: provider == "password" ? .email : .apple
          )
        )
      )
    }
  }
}

// MARK: Conforms to Register Provider
extension FirebaseAuthProvider: RegisterProviderDelegate {
  func register(
    email: String,
    password: String,
    onCompletion completion: @escaping (Result<RegisterResult, AppError>) -> Void
  ) {
    auth.createUser(withEmail: email, password: password) { [weak self] result, error in
      guard self != nil else { return }

      if let error {
        completion(.failure(.init(error: error)))
        return
      }

      guard let user = result?.user else {
        completion(.failure(.noUserFound))
        return
      }

      let uid = user.uid
      let email = user.email
      let photoURL = user.photoURL
      let provider = user.providerID
      let providerData = user.providerData

      completion(
        .success(
          .init(
            email: email,
            token: user.refreshToken,
            loginType: provider == "password" ? .email : .apple
          )
        )
      )
    }
  }
}
