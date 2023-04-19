//
//  
//  MainViewModelDelegate.swift
//  TestCase
//
//  Created by Douglas Hennrich on 17/04/23.
//
//

import Foundation

protocol MainViewModelDelegate: AnyObject {
  var stateView: Binder<UIStateEnum> { get }
  var workouts: Binder<Workouts> { get }

  func getWorkouts()
  func openWorkoutDetails(_ workout: Workout?)
  func onDeleteWorkout(_ workout: Workout?)
  func onLogoutAction()
  func onAddWorkoutAction()
}
