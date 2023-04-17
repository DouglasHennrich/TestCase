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
  var loginUseCase: LoginAuthenticationUseCaseDelegate?
  var stateView: Binder<UIStateEnum> = Binder(.normal)

  // MARK: Init
  init(
    navigation: LoginNavigationDelegate?,
    loginUseCase: LoginAuthenticationUseCaseDelegate?
  ) {
    self.navigation = navigation
    self.loginUseCase = loginUseCase
  }

  // MARK: Actions
  func onLoginSuccess(_ login: LoginResult) {
    // save user

    navigation?.onOpenMainAction()
  }
}

// MARK: Conforms to Delegate
extension LoginViewModel: LoginViewModelDelegate {
  func onLoginAction(loginType: LoginTypeEnum, email: String?, password: String?) {
    guard let email,
          let password
    else {
      return
    }

    let request = LoginAuthenticationUseCaseDTO(loginType: loginType, email: email, password: password)

    stateView.value = .loading

    loginUseCase?.execute(request) { [weak self] result in
      guard let self = self else { return }

      switch result {
        case .success(let login):
          self.onLoginSuccess(login)

        case .failure(let error):
          self.stateView.value = .error(message: error.localizedDescription)
      }
    }
  }
}
