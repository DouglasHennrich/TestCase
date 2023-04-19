//
//  
//  WorkoutViewModel.swift
//  TestCase
//
//  Created by Douglas Hennrich on 18/04/23.
//
//

import Foundation

class WorkoutViewModel {
  // MARK: Properties
  var navigation: WorkoutNavigationDelegate?
  var addEditWorkoutUseCase: AddEditWorkoutUseCaseDelegate?
  var stateView: Binder<UIStateEnum> = Binder(.normal)
  var workout: Binder<Workout>
  var addEditSuccessAlert: Binder<()> = Binder(())
  lazy var userId: String = {
    UserDefaults.standard.string(forKey: Constants.UserDefaults.userId) ?? ""
  }()

  // MARK: Init
  init(
    navigation: WorkoutNavigationDelegate?,
    addEditWorkoutUseCase: AddEditWorkoutUseCaseDelegate?,
    workout: Workout?
  ) {
    self.navigation = navigation
    self.addEditWorkoutUseCase = addEditWorkoutUseCase
    self.workout = Binder(workout ?? Workout.empty())
  }

  // MARK: Actions
  func onAddEditWorkoutSuccess() {
    NotificationCenter.default.post(
      name: Constants.Notification.refreshWorkouts,
      object: nil
    )

    addEditSuccessAlert.fire()
  }
}

extension WorkoutViewModel: WorkoutViewModelDelegate {
  func onExit() {
    navigation?.onCloseAddEditWorkout()
  }

  func onRemoveReference() {
    navigation?.onRemoveWorkoutReference()
  }

  func onViewDidLoad() {
    workout.fire()
  }

  func onAddExerciseAction() {
    let emptyExercise = Exercise.empty()
    emptyExercise.name = workout.value.exercises.count + 1

    workout.value.exercises.append(emptyExercise)
    workout.fire()
  }

  func onSaveWorkoutAction() {
    let request = AddEditWorkoutUseCaseDTO(
      workout: workout.value,
      userId: userId
    )

    stateView.value = .loading

    addEditWorkoutUseCase?.execute(request) { [weak self] result in
      guard let self = self else { return }

      switch result {
        case .success:
          self.onAddEditWorkoutSuccess()

        case .failure(let error):
          self.stateView.value = .error(message: error.message)
      }
    }
  }

  func onDeleteExercise(_ exercise: Exercise?) {
    workout.value.exercises.removeAll(where: { $0 == exercise })
    workout.fire()
  }
}

