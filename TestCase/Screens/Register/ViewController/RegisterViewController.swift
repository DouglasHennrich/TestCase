//
//  
//  RegisterViewController.swift
//  TestCase
//
//  Created by Douglas Hennrich on 16/04/23.
//
//

import UIKit

class RegisterViewController: CustomViewController<RegisterView> {
  // MARK: Properties
  weak var viewModel: RegisterViewModelDelegate?
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
extension RegisterViewController: RegisterViewDelegate {
  func onRegisterButtonAction(email: String?, password: String?) {
    viewModel?.onRegister(with: email, password: password)
  }
}

// MARK: Initialize
extension RegisterViewController {
  static func initialize(
    viewModel: RegisterViewModelDelegate?
  ) -> RegisterViewController {
    let vc = RegisterViewController()
    vc.viewModel = viewModel

    return vc
  }
}
