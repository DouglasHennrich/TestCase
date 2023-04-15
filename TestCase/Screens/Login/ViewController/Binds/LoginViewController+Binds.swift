//
//  
//  LoginViewController+Binds.swift
//  TestCase
//
//  Created by Douglas Hennrich on 15/04/23.
//
//

import UIKit

extension LoginViewController {
  func configureBinds() {
    viewModel?.stateView.bind { [weak self] newState in
      guard let self = self else { return }

      self.stateView = newState
    }
  }
}
