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

    window?.makeKeyAndVisible()
  }
}

// MARK: Private Actions
private extension AppCoordinator {
  func createMainViewController() {

  }
}
