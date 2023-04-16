//
//  AppCoordinator+Login.swift
//  TestCase
//
//  Created by Douglas Hennrich on 15/04/23.
//

import Foundation

// MARK: Conforms to Login Navigation
extension AppCoordinator: LoginNavigationDelegate {
  func onOpenMainAction() {
    openMain()

    loginViewModel = nil
  }
}

// MARK: Actions
extension AppCoordinator {
  func openLogin(navigation: LoginNavigationDelegate?) {
    let vc = createLoginViewController(navigation: self)

    navigationController.viewControllers = [vc]
    window?.rootViewController = navigationController

    window?.makeKeyAndVisible()
  }
}

// MARK: Private Actions
private extension AppCoordinator {
  func createLoginViewController(navigation: LoginNavigationDelegate?) -> LoginViewController {
    let viewModel = createLoginViewModel(navigation: navigation)
    let vc = LoginViewController.initialize(viewModel: viewModel)

    return vc
  }

  func createLoginViewModel(navigation: LoginNavigationDelegate?) -> LoginViewModelDelegate {
    let viewModel = LoginViewModel(navigation: navigation)
    loginViewModel = viewModel

    return viewModel
  }
}
