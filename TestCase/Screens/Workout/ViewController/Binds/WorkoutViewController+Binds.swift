//
//  
//  WorkoutViewController+Binds.swift
//  TestCase
//
//  Created by Douglas Hennrich on 18/04/23.
//
//

import UIKit

extension WorkoutViewController {
  func configureBinds() {
    viewModel?.stateView.bind { [weak self] newState in
      guard let self = self else { return }

      self.stateView = newState
    }

    viewModel?.workout.bind { [weak self] _ in
      guard let self = self else { return }

      self.customView?.collectionView.reloadData()
    }

    viewModel?.addEditSuccessAlert.bind { [weak self] in
      guard let self = self else { return }

      let alert = UIAlertController(
        title: "tudo certo!",
        message: "workout salvo com sucesso",
        preferredStyle: .alert
      )

      let action = UIAlertAction(title: "ok", style: .default) { [weak self] _ in
        guard let self = self else { return }

        self.viewModel?.onExit()
      }

      alert.addAction(action)

      self.present(alert, animated: true)
    }
  }
}
