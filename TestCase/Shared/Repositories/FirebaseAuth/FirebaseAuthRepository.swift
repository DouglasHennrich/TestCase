//
//  FirebaseAuthRepository.swift
//  TestCase
//
//  Created by Douglas Hennrich on 16/04/23.
//

import Foundation
import FirebaseAuth

class FirebaseAuthRepository {
  // MARK: Properties
  let auth = Auth.auth()

  // MARK: Actions
  func onEmailOrRegisterSuccess(
    result: AuthDataResult?,
    error: Error?,
    onCompletion completion: @escaping (Result<Data, Error>) -> Void
  ) {
    if let error {
      completion(.failure(error))
      return
    }

    guard let user = result?.user else {
      completion(.failure(NSError(domain: "User not found", code: -1)))
      return
    }

    let uid = user.uid
    let email = user.email
    let providerData = user.providerData
    let token = user.refreshToken
    let loginType = providerData.first?.providerID == "password" ?
    LoginTypeEnum.email.rawValue :
      LoginTypeEnum.apple.rawValue

    let payload: [String: Any] = [
      "uid": user.uid,
      "email": user.email ?? "",
      "loginType": loginType,
      "token": token ?? ""
    ]

    guard let dataFromPayload = payload.toData() else {
      completion(.failure(NSError(domain: "Can't encode payload", code: -1)))
      return
    }

    completion(.success(dataFromPayload))
  }
}

// MARK: Conforms to Email Provider
extension FirebaseAuthRepository: EmailRepositoryDelegate {
  func login(
    email: String,
    password: String,
    onCompletion completion: @escaping (Result<Data, Error>) -> Void
  ) {
    auth.signIn(withEmail: email, password: password) { [weak self] result, error in
      guard let self = self else { return }

      self.onEmailOrRegisterSuccess(result: result, error: error, onCompletion: completion)
    }
  }
}

// MARK: Conforms to Register Provider
extension FirebaseAuthRepository: RegisterRepositoryDelegate {
  func register(
    email: String,
    password: String,
    onCompletion completion: @escaping (Result<Data, Error>) -> Void
  ) {
    auth.createUser(withEmail: email, password: password) { [weak self] result, error in
      guard let self = self else { return }

      self.onEmailOrRegisterSuccess(result: result, error: error, onCompletion: completion)
    }
  }
}
