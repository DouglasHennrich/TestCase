//
//  
//  RegisterViewController+UIStateView.swift
//  TestCase
//
//  Created by Douglas Hennrich on 16/04/23.
//
//

import UIKit

extension RegisterViewController {
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
private extension RegisterViewController {
  func onChangeUIStateNormal() {
    customView?.stopLoader()
  }
}

// MARK: Loading
private extension RegisterViewController {
  func onChangeUIStateLoading() {
    customView?.startLoader()
  }
}

// MARK: Error
private extension RegisterViewController {
  func onChangeUIStateError(withMessage message: String?) {
    customView?.stopLoader()

    let alert = UIAlertController(title: "Ops", message: message, preferredStyle: .alert)
    let action = UIAlertAction(title: "ok", style: .default)

    alert.addAction(action)

    present(alert, animated: true)
  }
}
