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
    configureBinds()
    
    customView?.delegate = self
    title = "Workouts"

    viewModel?.getWorkouts()
  }
}

// MARK: Conforms to UI Delegate
extension MainViewController: MainViewDelegate {}

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
