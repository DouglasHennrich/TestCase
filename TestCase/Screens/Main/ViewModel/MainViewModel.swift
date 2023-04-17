//
//  
//  MainViewModel.swift
//  TestCase
//
//  Created by Douglas Hennrich on 17/04/23.
//
//

import Foundation

class MainViewModel {
  // MARK: Properties
  var navigation: MainNavigationDelegate?
  var workoutsUseCase: WorkoutsUseCaseDelegate?
  var stateView: Binder<UIStateEnum> = Binder(.normal)
  var workouts: Binder<Workouts> = Binder([])

  // MARK: Init
  init(
    navigation: MainNavigationDelegate?,
    workoutsUseCase: WorkoutsUseCaseDelegate?
  ) {
    self.navigation = navigation
    self.workoutsUseCase = workoutsUseCase
  }

  // MARK: Actions
  func getCurrentUserId() -> String {
    UserDefaults.standard.string(forKey: Constants.UserDefaults.userId) ?? ""
  }
}

extension MainViewModel: MainViewModelDelegate {
  func getWorkouts() {
    let request = WorkoutsUseCaseDTO(userId: getCurrentUserId())

    stateView.value = .loading

    workoutsUseCase?.execute(request) { [weak self] result in
      guard let self = self else { return }

      switch result {
        case .success(let workouts):
          self.stateView.value = .normal
          self.workouts.value = workouts

        case .failure(let error):
          self.stateView.value = .error(message: error.message)
      }
    }
  }

  func openWorkoutDetails(_ workout: Workout?) {
    print(workout)
  }

  func onDeleteWorkout(_ workout: Workout?) {

  }
}
