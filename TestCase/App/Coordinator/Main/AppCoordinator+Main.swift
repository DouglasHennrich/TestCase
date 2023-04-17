//
//  AppCoordinator+Main.swift
//  TestCase
//
//  Created by Douglas Hennrich on 15/04/23.
//

import Foundation

// MARK: Actions
extension AppCoordinator {
  func openMain() {
    if window?.rootViewController == nil {
      window?.rootViewController = navigationController
    }

    let vc = createMainViewController()

    navigationController.viewControllers = [vc]

    window?.makeKeyAndVisible()
  }
}

// MARK: Conforms to navigation delegate
extension AppCoordinator: MainNavigationDelegate {}

// MARK: Private Actions
private extension AppCoordinator {
  func createMainViewController() -> MainViewController {
    let workoutsRepository = createWorkoutsRepository()
    let workoutsUseCase = createWorkoutsUseCase(repository: workoutsRepository)
    let viewModel = createMainViewModel(navigation: self, workoutsUseCase: workoutsUseCase)
    let vc = MainViewController.initialize(viewModel: viewModel)

    return vc
  }

  func createMainViewModel(
    navigation: MainNavigationDelegate?,
    workoutsUseCase: WorkoutsUseCaseDelegate?
  ) -> MainViewModelDelegate? {
    let viewModel = MainViewModel(navigation: navigation, workoutsUseCase: workoutsUseCase)

    mainViewModel = viewModel

    return viewModel
  }

  func createWorkoutsUseCase(repository: WorkoutsRepositoryDelegate?) -> WorkoutsUseCaseDelegate? {
    WorkoutsUseCase(repository: repository)
  }

  func createWorkoutsRepository() -> WorkoutsRepositoryDelegate? {
    WorkoutsFirestoreRepository()
  }
}
