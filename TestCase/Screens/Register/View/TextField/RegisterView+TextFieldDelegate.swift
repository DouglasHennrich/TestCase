//
//  RegisterView+TextFieldDelegate.swift
//  TestCase
//
//  Created by Douglas Hennrich on 17/04/23.
//

import UIKit

extension RegisterView: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    if (textField == emailField) {
      passwordField.becomeFirstResponder()

    } else if (textField == passwordField) {
      textField.resignFirstResponder()
      onRegisterButtonAction()
    }

    return true
  }
}
