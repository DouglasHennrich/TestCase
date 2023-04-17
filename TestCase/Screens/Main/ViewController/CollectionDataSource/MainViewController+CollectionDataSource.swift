//
//  MainViewController+CollectionDataSource.swift
//  TestCase
//
//  Created by Douglas Hennrich on 17/04/23.
//

import UIKit

extension MainViewController: UICollectionViewDataSource {
  func collectionView(
    _ collectionView: UICollectionView,
    numberOfItemsInSection section: Int
  ) -> Int {
    viewModel?.workouts.value.count ?? 0
  }

  func collectionView(
    _ collectionView: UICollectionView,
    cellForItemAt indexPath: IndexPath
  ) -> UICollectionViewCell {
    let cell: WorkoutCollectionViewCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
    let workout = viewModel?.workouts.value.at(indexPath.item)

    cell.configure(with: workout)

    cell.delegate = self

    return cell
  }
}

// MARK: Workout Cell Delegate
extension MainViewController: WorkoutCellDelegate {
  func onWorkoutCellAction(_ workout: Workout?) {
    viewModel?.openWorkoutDetails(workout)
  }
}
