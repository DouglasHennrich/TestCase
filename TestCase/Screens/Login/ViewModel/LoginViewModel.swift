//
//  
//  LoginViewModel.swift
//  TestCase
//
//  Created by Douglas Hennrich on 15/04/23.
//
//

import Foundation

class LoginViewModel {
  // MARK: Properties
  var navigation: LoginNavigationDelegate?
  var stateView: Binder<UIStateEnum> = Binder(.normal)

  // MARK: Init
  init(navigation: LoginNavigationDelegate?) {
    self.navigation = navigation
  }
}

extension LoginViewModel: LoginViewModelDelegate {}
