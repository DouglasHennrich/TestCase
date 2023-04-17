//
//  
//  RegisterViewController+Binds.swift
//  TestCase
//
//  Created by Douglas Hennrich on 16/04/23.
//
//

import UIKit

extension RegisterViewController {
  func configureBinds() {
    viewModel?.stateView.bind { [weak self] newState in
      guard let self = self else { return }

      self.stateView = newState
    }
  }
}
