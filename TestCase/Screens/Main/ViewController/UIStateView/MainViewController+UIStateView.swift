//
//  
//  MainViewController+UIStateView.swift
//  TestCase
//
//  Created by Douglas Hennrich on 17/04/23.
//
//

import UIKit

extension MainViewController {
  func changeUIState(with type: UIStateEnum) {
    switch type {
      case .normal:
        onChangeUIStateNormal()

      case .loading:
        onChangeUIStateLoading()

      case .error(let message):
        onChangeUIStateError(withMessage: message)

      case .empty:
        onChangeUIStateEmpty()
    }
  }
}

// MARK: Normal
private extension MainViewController {
  func onChangeUIStateNormal() {
    customView?.stopLoader()

    customView?.emptyLabel.isHidden = true
  }
}

// MARK: Loading
private extension MainViewController {
  func onChangeUIStateLoading() {
    customView?.startLoader()

    customView?.emptyLabel.isHidden = true
  }
}

// MARK: Error
private extension MainViewController {
  func onChangeUIStateError(withMessage message: String?) {
    customView?.stopLoader()

    customView?.emptyLabel.isHidden = true

    let alert = UIAlertController(title: "Ops", message: message, preferredStyle: .alert)
    let action = UIAlertAction(title: "ok", style: .default)

    alert.addAction(action)

    present(alert, animated: true)
  }
}

// MARK: Empty
private extension MainViewController {
  func onChangeUIStateEmpty() {
    customView?.stopLoader()

    customView?.emptyLabel.isHidden = false
  }
}
