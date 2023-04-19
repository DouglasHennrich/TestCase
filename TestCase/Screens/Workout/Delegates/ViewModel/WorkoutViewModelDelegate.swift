//
//  
//  WorkoutViewModelDelegate.swift
//  TestCase
//
//  Created by Douglas Hennrich on 18/04/23.
//
//

import Foundation

protocol WorkoutViewModelDelegate: AnyObject {
  var stateView: Binder<UIStateEnum> { get }
  var workout: Binder<Workout> { get }
  var addEditSuccessAlert: Binder<()> { get }

  func onExit()
  func onViewDidLoad()
  func onAddExerciseAction()
  func onSaveWorkoutAction()
  func onDeleteExercise(_ exercise: Exercise?)
  func onRemoveReference()
}
