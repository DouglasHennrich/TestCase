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
  var deleteWorkoutUseCase: DeleteWorkoutUseCaseDelegate?
  var stateView: Binder<UIStateEnum> = Binder(.normal)
  var workouts: Binder<Workouts> = Binder([])

  // MARK: Init
  init(
    navigation: MainNavigationDelegate?,
    workoutsUseCase: WorkoutsUseCaseDelegate?,
    deleteWorkoutUseCase: DeleteWorkoutUseCaseDelegate?
  ) {
    self.navigation = navigation
    self.workoutsUseCase = workoutsUseCase
    self.deleteWorkoutUseCase = deleteWorkoutUseCase

    addNotifications()
  }

  deinit {
    NotificationCenter.default.removeObserver(self)
  }

  // MARK: Actions
  func getCurrentUserId() -> String {
    UserDefaults.standard.string(forKey: Constants.UserDefaults.userId) ?? ""
  }

  func onGetWorkoutsSuccess(_ workouts: Workouts) {
    stateView.value = workouts.isNotEmpty ? .normal : .empty

    self.workouts.value = workouts
  }

  func onDeleteWorkoutSuccess(toRemove workout: Workout) {
    workouts.value.removeAll(where: { $0 == workout })

    stateView.value = workouts.value.isNotEmpty ? .normal : .empty
  }

  func addNotifications() {
    NotificationCenter.default.addObserver(
      self,
      selector: #selector(onRefreshWorkoutsNotification),
      name: Constants.Notification.refreshWorkouts,
      object: nil
    )
  }

  @objc func onRefreshWorkoutsNotification() {
    getWorkouts()
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
          self.onGetWorkoutsSuccess(workouts)

        case .failure(let error):
          self.stateView.value = .error(message: error.message)
      }
    }
  }

  func openWorkoutDetails(_ workout: Workout?) {
    guard let workout else { return }

    navigation?.onOpenWorkoutDetails(workout)
  }

  func onDeleteWorkout(_ workout: Workout?) {
    guard let workout else { return }
    let request = DeleteWorkoutUseCaseDTO(workout: workout)

    stateView.value = .loading

    deleteWorkoutUseCase?.execute(request) { [weak self] result in
      guard let self = self else { return }

      switch result {
        case .success:
          self.onDeleteWorkoutSuccess(toRemove: workout)

        case .failure(let error):
          self.stateView.value = .error(message: error.message)
      }
    }
  }

  func onLogoutAction() {
    UserDefaults.standard.removeObject(forKey: Constants.UserDefaults.userId)
    navigation?.onLogout()
  }

  func onAddWorkoutAction() {
    navigation?.onAddWorkout()
  }
}
