//
//  AppCoordinator.swift
//  TestCase
//
//  Created by Douglas Hennrich on 15/04/23.
//

import UIKit

class AppCoordinator {
  // MARK: Properties
  var loginViewModel: LoginViewModel?
  var registerViewModel: RegisterViewModelDelegate?
  var mainViewModel: MainViewModelDelegate?

  // MARK: Components
  let window: UIWindow?
  let navigationController: UINavigationController

  // MARK: Init
  init(
    window: UIWindow?,
    navigationController: UINavigationController
  ) {
    self.window = window
    self.navigationController = navigationController

    applyStyle(to: navigationController)
  }

  // MARK: Start
  func start() {
    if (checkIfUserIsLogged()) {
      openMain()
      return
    }

    openLogin(navigation: self)
  }
}

// MARK: Actions
private extension AppCoordinator {
  func checkIfUserIsLogged() -> Bool {
    UserDefaults.standard.string(forKey: Constants.UserDefaults.userId) != nil
  }
}

// MARK: Navigation Style
private extension AppCoordinator {
  func applyStyle(to navigation: UINavigationController) {
    let appearance = UINavigationBarAppearance()
    let appearanceStandard = UINavigationBarAppearance()
    let buttonAppearance = UIBarButtonItemAppearance()

    buttonAppearance.normal.titleTextAttributes = [
      .foregroundColor: UIColor.Colors.primary
    ]

    appearance.shadowImage = UIImage()
    appearance.backgroundImage = UIImage()
    appearance.titleTextAttributes = [.foregroundColor: UIColor.Colors.navBarTitle]
    appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.Colors.navBarTitle]
    appearance.backgroundColor = UIColor.Colors.backgroundDark
    appearance.shadowColor = nil
    appearance.buttonAppearance = buttonAppearance
    appearance.backButtonAppearance = buttonAppearance
    appearance.doneButtonAppearance = buttonAppearance

    appearanceStandard.titleTextAttributes = [.foregroundColor: UIColor.Colors.navBarTitle]
    appearanceStandard.shadowImage = UIImage()
    appearanceStandard.backgroundImage = UIImage()
    appearanceStandard.backgroundColor = .Colors.backgroundDark
    appearanceStandard.shadowColor = nil
    appearanceStandard.buttonAppearance = buttonAppearance
    appearanceStandard.backButtonAppearance = buttonAppearance
    appearanceStandard.doneButtonAppearance = buttonAppearance

    navigation.navigationBar.tintColor = .Colors.primary
    navigation.navigationBar.compactAppearance = appearance
    navigation.navigationBar.standardAppearance = appearanceStandard
    navigation.navigationBar.scrollEdgeAppearance = appearance
    navigation.navigationBar.prefersLargeTitles = true
  }
}
