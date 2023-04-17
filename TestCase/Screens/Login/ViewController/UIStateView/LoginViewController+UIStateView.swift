//
//  
//  LoginViewController+UIStateView.swift
//  TestCase
//
//  Created by Douglas Hennrich on 15/04/23.
//
//

import UIKit

extension LoginViewController {
  func changeUIState(with type: UIStateEnum) {
    switch type {
      case .normal:
        onChangeUIStateNormal()

      case .loading:
        onChangeUIStateLoading()

      case .error(let message):
        onChangeUIStateError(withMessage: message)

      case .empty: break
    }
  }
}

// MARK: Normal
private extension LoginViewController {
  func onChangeUIStateNormal() {
    customView?.stopLoader()
  }
}

// MARK: Loading
private extension LoginViewController {
  func onChangeUIStateLoading() {
    customView?.startLoader()
  }
}

// MARK: Error
private extension LoginViewController {
  func onChangeUIStateError(withMessage message: String?) {
    customView?.stopLoader()

    let alert = UIAlertController(title: "Ops", message: message, preferredStyle: .alert)

    present(alert, animated: true)
  }
}
