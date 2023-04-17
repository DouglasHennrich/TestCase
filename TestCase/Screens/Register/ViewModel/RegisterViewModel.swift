//
//  
//  RegisterViewModel.swift
//  TestCase
//
//  Created by Douglas Hennrich on 16/04/23.
//
//

import Foundation

class RegisterViewModel {
  // MARK: Properties
  var navigation: RegisterNavigationDelegate?
  var registerUseCase: RegisterUseCaseDelegate?
  var stateView: Binder<UIStateEnum> = Binder(.normal)

  // MARK: Init
  init(
    navigation: RegisterNavigationDelegate?,
    registerUseCase: RegisterUseCaseDelegate?
  ) {
    self.navigation = navigation
    self.registerUseCase = registerUseCase
  }

  // MARK: Actions
  func onRegisterSuccess(_ register: RegisterResult) {

  }
}

extension RegisterViewModel: RegisterViewModelDelegate {
  func onRegister(with email: String?, password: String?) {
    guard let email,
          let password
    else {
      return
    }
    let request = RegisterUseCaseDTO(email: email, password: password)

    stateView.value = .loading

    registerUseCase?.execute(request) { [weak self] result in
      guard let self = self else { return }

      switch result {
        case .success(let register):
          self.onRegisterSuccess(register)

        case .failure(let error):
          self.stateView.value = .error(message: error.message)
      }
    }
  }
}
