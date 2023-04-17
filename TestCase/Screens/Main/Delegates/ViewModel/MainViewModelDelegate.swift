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

  func getWorkouts()
}