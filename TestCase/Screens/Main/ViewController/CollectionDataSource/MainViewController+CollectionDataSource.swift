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
  func onWorkoutDetailsCellAction(_ workout: Workout?) {
    viewModel?.openWorkoutDetails(workout)
  }

  func onShowDeleteAlert(_ workout: Workout?) {
    let alert = UIAlertController(
      title: "Atenção",
      message: "Você deseja deletar esse treino?",
      preferredStyle: .alert
    )

    let deleteAction = UIAlertAction(title: "deletar", style: .destructive) { [weak self] _ in
      guard let self = self else { return }

      self.viewModel?.onDeleteWorkout(workout)
    }

    let backAction = UIAlertAction(title: "voltar", style: .cancel)

    alert.addAction(deleteAction)
    alert.addAction(backAction)

    present(alert, animated: true)
  }
}
