//
//  
//  LoginViewModelDelegate.swift
//  TestCase
//
//  Created by Douglas Hennrich on 15/04/23.
//
//

import Foundation

protocol LoginViewModelDelegate: AnyObject {
  var stateView: Binder<UIStateEnum> { get }

  func onLoginAction(loginType: LoginTypeEnum, email: String?, password: String?)
  func onOpenRegisterAction()
}
