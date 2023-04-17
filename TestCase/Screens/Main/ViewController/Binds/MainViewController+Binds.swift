//
//  
//  MainViewController+Binds.swift
//  TestCase
//
//  Created by Douglas Hennrich on 17/04/23.
//
//

import UIKit

extension MainViewController {
  func configureBinds() {
    viewModel?.stateView.bind { [weak self] newState in
      guard let self = self else { return }

      self.stateView = newState
    }

    viewModel?.workouts.bind { [weak self] workouts in
      guard let self = self else { return }

      self.customView?.collectionView.reloadData()
      self.customView?.endRefreshing()
    }
  }
}
