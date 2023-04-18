//
//  
//  MainNavigationDelegate.swift
//  TestCase
//
//  Created by Douglas Hennrich on 17/04/23.
//
//

import Foundation

protocol MainNavigationDelegate: AnyObject {
  func onOpenWorkoutDetails(_ workout: Workout)
  func onLogout()
}
