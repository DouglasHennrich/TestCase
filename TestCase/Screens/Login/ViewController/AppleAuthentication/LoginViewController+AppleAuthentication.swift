//
//  LoginViewController+AppleAuthentication.swift
//  TestCase
//
//  Created by Douglas Hennrich on 16/04/23.
//

import Foundation
import AuthenticationServices

extension LoginViewController: ASAuthorizationControllerDelegate,
                               ASAuthorizationControllerPresentationContextProviding {
  func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
    view.window!
  }

  func authorizationController(
    controller: ASAuthorizationController,
    didCompleteWithAuthorization authorization: ASAuthorization
  ) {
    switch authorization.credential {
      case let appleIDCredential as ASAuthorizationAppleIDCredential:

        // Create an account in your system.
        let userIdentifier = appleIDCredential.user
        let fullName = appleIDCredential.fullName
        let email = appleIDCredential.email

      case let passwordCredential as ASPasswordCredential:
        // Sign in using an existing iCloud Keychain credential.
        let username = passwordCredential.user
        let password = passwordCredential.password

      default:
        break
    }
  }
}
