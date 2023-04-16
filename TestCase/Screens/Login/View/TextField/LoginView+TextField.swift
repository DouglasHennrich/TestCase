//
//  LoginView+TextField.swift
//  TestCase
//
//  Created by Douglas Hennrich on 16/04/23.
//

import UIKit

extension LoginView: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    if (textField == emailField) {
      passwordField.becomeFirstResponder()

    } else if (textField == passwordField) {
      textField.resignFirstResponder()
      onLoginButtonAction()
    }

    return true
  }
}
