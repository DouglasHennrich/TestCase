//
//  
//  MainViewController.swift
//  TestCase
//
//  Created by Douglas Hennrich on 17/04/23.
//
//

import UIKit

class MainViewController: CustomViewController<MainView> {
  // MARK: Properties
  weak var viewModel: MainViewModelDelegate?
  var stateView: UIStateEnum = .normal {
    didSet {
      guard stateView != oldValue else { return }

      changeUIState(with: stateView)
    }
  }

  // MARK: Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    configureNavigationBar()
    configureBinds()
    customView?.assignCollectionViewDelegates(to: self)
    
    customView?.delegate = self

    viewModel?.getWorkouts()
  }

  // MARK: Actions
  @objc func onNavBarAddButtonAction() {
    viewModel?.onAddWorkoutAction()
  }

  @objc func onNavBarLogoutButtonAction() {
    viewModel?.onLogoutAction()
  }
}

// MARK: Conforms to UI Delegate
extension MainViewController: MainViewDelegate {
  func refreshWorkouts() {
    viewModel?.getWorkouts()
  }
}

// MARK: Configure NavigationBar
extension MainViewController {
  func configureNavigationBar() {
    title = "Workouts"

    configureNavigationBarRightButtons()
  }

  func configureNavigationBarRightButtons() {
    let logoutButton = UIBarButtonItem(
      image: UIImage(systemName: "rectangle.portrait.and.arrow.right"),
      style: .done,
      target: self,
      action: #selector(onNavBarLogoutButtonAction)
    )

    let addButton = UIBarButtonItem(
      image: UIImage(systemName: "plus"),
      style: .done,
      target: self,
      action: #selector(onNavBarAddButtonAction)
    )

    navigationItem.setRightBarButtonItems([logoutButton, addButton], animated: true)
  }
}

// MARK: Initialize
extension MainViewController {
  static func initialize(
    viewModel: MainViewModelDelegate?
  ) -> MainViewController {
    let vc = MainViewController()
    vc.viewModel = viewModel

    return vc
  }
}
