//
//  
//  LoginViewController.swift
//  TestCase
//
//  Created by Douglas Hennrich on 15/04/23.
//
//

import UIKit

class LoginViewController: CustomViewController<LoginView> {
  // MARK: Properties
  weak var viewModel: LoginViewModelDelegate?
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
  }
}

// MARK: Conforms to UI Delegate
extension LoginViewController: LoginViewDelegate {}

// MARK: Initialize
extension LoginViewController {
  static func initialize(
    viewModel: LoginViewModelDelegate?
  ) -> LoginViewController {
    let vc = LoginViewController()
    vc.viewModel = viewModel

    return vc
  }
}
