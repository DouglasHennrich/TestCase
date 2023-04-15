//
//  AppCoordinator.swift
//  TestCase
//
//  Created by Douglas Hennrich on 15/04/23.
//

import UIKit

class AppCoordinator {
  // MARK: Properties

  // MARK: Components
  let navigationController: UINavigationController

  // MARK: Init
  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }

  // MARK: Start
  func start(window: UIWindowScene) {
    if (checkIfUserIsLogged()) {
      return
    }


  }
}

// MARK: Actions
extension AppCoordinator {
  private func checkIfUserIsLogged() -> Bool {
    return true
  }
}
