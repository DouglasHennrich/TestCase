//
//  AppCoordinator+Login.swift
//  TestCase
//
//  Created by Douglas Hennrich on 15/04/23.
//

import Foundation

// MARK: Conforms to Login Navigation
extension AppCoordinator: LoginNavigationDelegate {
  func onOpenMain() {
    openMain()

    loginViewModel = nil
  }

  func onOpenRegister() {
    openRegister()
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

// MARK: Factory
private extension AppCoordinator {
  func createLoginViewController(navigation: LoginNavigationDelegate?) -> LoginViewController {
    let viewModel = createLoginViewModel(navigation: navigation)
    let vc = LoginViewController.initialize(viewModel: viewModel)

    return vc
  }

  func createLoginViewModel(navigation: LoginNavigationDelegate?) -> LoginViewModelDelegate {
    let appleAuthenticationUseCase = createAppleAuthenticationUseCase()

    let firebaseRepository = FirebaseAuthRepository()
    let emailAuthenticationUseCase = createEmailAuthenticationUseCase(repository: firebaseRepository)

    let loginUseCase = createLoginUseCase(
      appleUseCase: appleAuthenticationUseCase,
      emailUseCase: emailAuthenticationUseCase
    )
    let viewModel = LoginViewModel(
      navigation: navigation,
      loginUseCase: loginUseCase
    )

    loginViewModel = viewModel

    return viewModel
  }

  func createLoginUseCase(
    appleUseCase: AppleAuthenticationUseCaseDelegate?,
    emailUseCase: EmailAuthenticationUseCaseDelegate?
  ) -> LoginAuthenticationUseCaseDelegate? {
    LoginAuthenticationUseCase(appleUseCase: appleUseCase, emailUseCase: emailUseCase)
  }

  func createAppleAuthenticationUseCase() -> AppleAuthenticationUseCaseDelegate? {
    AppleAuthenticationUseCase()
  }

  func createEmailAuthenticationUseCase(
    repository: EmailRepositoryDelegate?
  ) -> EmailAuthenticationUseCaseDelegate? {
    EmailAuthenticationUseCase(emailRepository: repository)
  }
}
