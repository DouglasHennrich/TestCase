//
//  AppCoordinator+Register.swift
//  TestCase
//
//  Created by Douglas Hennrich on 17/04/23.
//

import Foundation

extension AppCoordinator {
  func openRegister() {
    let vc = createRegisterViewController()

    navigationController.pushViewController(vc, animated: true)
  }
}

// MARK: Conforms to Navigation
extension AppCoordinator: RegisterNavigationDelegate {
  func removeRegisterViewModelReference() {
    registerViewModel = nil
  }

  func onRegisterSuccess() {
    
  }
}

// MARK: Factory
private extension AppCoordinator {
  func createRegisterViewController() -> RegisterViewController {
    let repository = createRegisterRepository()
    let registerUseCase = createRegisterUseCase(repository: repository)

    let viewModel = createRegisterViewModel(
      navigation: self,
      registerUseCase: registerUseCase
    )

    let vc = RegisterViewController.initialize(viewModel: viewModel)

    return vc
  }

  func createRegisterViewModel(
    navigation: RegisterNavigationDelegate?,
    registerUseCase: RegisterUseCaseDelegate?
  ) -> RegisterViewModelDelegate {
    let viewModel = RegisterViewModel(
      navigation: navigation,
      registerUseCase: registerUseCase
    )

    registerViewModel = viewModel

    return viewModel
  }

  func createRegisterUseCase(repository: RegisterRepositoryDelegate?) -> RegisterUseCaseDelegate? {
    RegisterUseCase(repository: repository)
  }

  func createRegisterRepository() -> RegisterRepositoryDelegate? {
    FirebaseAuthRepository()
  }
}
