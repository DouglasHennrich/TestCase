//
//  AppCoordinator+Workout.swift
//  TestCase
//
//  Created by Douglas Hennrich on 18/04/23.
//

import Foundation

extension AppCoordinator {
  func openWorkout(_ workout: Workout?) {
    let vc = createWorkoutViewController(workout: workout, navigation: self)

    navigationController.pushViewController(vc, animated: true)
  }
}

// MARK: Navigation
extension AppCoordinator: WorkoutNavigationDelegate {
  func onCloseAddEditWorkout() {
    navigationController.popViewController(animated: true)

    onRemoveWorkoutReference()
  }

  func onRemoveWorkoutReference() {
    workoutViewModel = nil
  }
}

// MARK: Factory
private extension AppCoordinator {
  func createWorkoutViewController(
    workout: Workout?,
    navigation: WorkoutNavigationDelegate?
  ) -> WorkoutViewController {
    let workoutsRepository = createWorkoutsRepository()
    let addEditWorkoutUseCase = createAddEditUseCase(repository: workoutsRepository)

    let viewModel = createWorkoutViewModel(
      workout: workout,
      navigation: navigation,
      addEditWorkoutUseCase: addEditWorkoutUseCase
    )

    let vc = WorkoutViewController.initialize(viewModel: viewModel)

    return vc
  }

  func createWorkoutViewModel(
    workout: Workout?,
    navigation: WorkoutNavigationDelegate?,
    addEditWorkoutUseCase: AddEditWorkoutUseCaseDelegate?
  ) -> WorkoutViewModelDelegate? {
    let viewModel = WorkoutViewModel(
      navigation: navigation,
      addEditWorkoutUseCase: addEditWorkoutUseCase,
      workout: workout
    )

    workoutViewModel = viewModel

    return viewModel
  }

  func createAddEditUseCase(repository: WorkoutsRepositoryDelegate?) -> AddEditWorkoutUseCaseDelegate? {
    AddEditWorkoutUseCase(repository: repository)
  }

  func createWorkoutsRepository() -> WorkoutsRepositoryDelegate? {
    WorkoutsFirestoreRepository()
  }
}
