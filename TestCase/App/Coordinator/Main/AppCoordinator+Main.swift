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
extension AppCoordinator: MainNavigationDelegate {
  func onOpenWorkoutDetails(_ workout: Workout) {

  }

  func onLogout() {
    mainViewModel = nil

    start()
  }
}

// MARK: Private Actions
private extension AppCoordinator {
  func createMainViewController() -> MainViewController {
    let workoutsRepository = createWorkoutsRepository()
    let workoutsUseCase = createWorkoutsUseCase(repository: workoutsRepository)
    let deleteWorkoutUseCase = createDeleteWorkoutUseCase(repository: workoutsRepository)

    let viewModel = createMainViewModel(
      navigation: self,
      workoutsUseCase: workoutsUseCase,
      deleteWorkoutUseCase: deleteWorkoutUseCase
    )

    let vc = MainViewController.initialize(viewModel: viewModel)

    return vc
  }

  func createMainViewModel(
    navigation: MainNavigationDelegate?,
    workoutsUseCase: WorkoutsUseCaseDelegate?,
    deleteWorkoutUseCase: DeleteWorkoutUseCaseDelegate?
  ) -> MainViewModelDelegate? {
    let viewModel = MainViewModel(
      navigation: navigation,
      workoutsUseCase: workoutsUseCase,
      deleteWorkoutUseCase: deleteWorkoutUseCase
    )

    mainViewModel = viewModel

    return viewModel
  }

  func createWorkoutsUseCase(repository: WorkoutsRepositoryDelegate?) -> WorkoutsUseCaseDelegate? {
    WorkoutsUseCase(repository: repository)
  }

  func createDeleteWorkoutUseCase(repository: WorkoutsRepositoryDelegate?) -> DeleteWorkoutUseCaseDelegate? {
    DeleteWorkoutUseCase(repository: repository)
  }

  func createWorkoutsRepository() -> WorkoutsRepositoryDelegate? {
    WorkoutsFirestoreRepository()
  }
}
