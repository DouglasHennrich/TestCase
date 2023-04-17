//
//  FirebaseAuthProvider.swift
//  TestCase
//
//  Created by Douglas Hennrich on 16/04/23.
//

import Foundation
import FirebaseAuth

class FirebaseAuthProvider: FirebaseAuthProviderDelegate {
  // MARK: Properties
  let auth = Auth.auth()

  // MARK: Actions
  func login(
    email: String,
    password: String,
    onCompletion completion: @escaping (Result<LoginResult, Error>) -> Void
  ) {
    auth.signIn(withEmail: email, password: password) { result, error in
      if let error {
        completion(.failure(error))
        return
      }

      guard let user = result?.user else {
        completion(.failure(NSError(domain: "No user returned", code: -1)))
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

  func register(email: String, password: String) {}
}
