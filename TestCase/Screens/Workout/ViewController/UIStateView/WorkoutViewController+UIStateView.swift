//
//  
//  WorkoutViewController+UIStateView.swift
//  TestCase
//
//  Created by Douglas Hennrich on 18/04/23.
//
//

import UIKit

extension WorkoutViewController {
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
private extension WorkoutViewController {
  func onChangeUIStateNormal() {
    customView?.stopLoader()
  }
}

// MARK: Loading
private extension WorkoutViewController {
  func onChangeUIStateLoading() {
    customView?.startLoader()
  }
}

// MARK: Error
private extension WorkoutViewController {
  func onChangeUIStateError(withMessage message: String?) {
    customView?.stopLoader()

    let alert = UIAlertController(title: "Ops", message: message, preferredStyle: .alert)
    let action = UIAlertAction(title: "ok", style: .default)

    alert.addAction(action)

    present(alert, animated: true)
  }
}
