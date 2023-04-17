//
//  
//  LoginViewDelegate.swift
//  TestCase
//
//  Created by Douglas Hennrich on 15/04/23.
//
//

import Foundation

protocol LoginViewDelegate: AnyObject {
  func onLoginButtonAction(email: String?, password: String?)
  func onRegisterButtonAction()
}
