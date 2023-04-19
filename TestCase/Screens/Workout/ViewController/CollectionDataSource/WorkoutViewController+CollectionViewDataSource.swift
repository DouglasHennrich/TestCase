//
//  WorkoutViewController+CollectionViewDataSource.swift
//  TestCase
//
//  Created by Douglas Hennrich on 18/04/23.
//

import UIKit

extension WorkoutViewController: UICollectionViewDataSource {
  func collectionView(
    _ collectionView: UICollectionView,
    numberOfItemsInSection section: Int
  ) -> Int {
    viewModel?.workout.value.exercises.count ?? 0
  }

  func collectionView(
    _ collectionView: UICollectionView,
    cellForItemAt indexPath: IndexPath
  ) -> UICollectionViewCell {
    let cell: ExerciseCollectionViewCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
    let exercise = viewModel?.workout.value.exercises.at(indexPath.item)

    cell.configure(with: exercise)

    cell.delegate = self

    return cell
  }

  func collectionView(
    _ collectionView: UICollectionView,
    viewForSupplementaryElementOfKind kind: String,
    at indexPath: IndexPath
  ) -> UICollectionReusableView {
    let header: WorkoutHeaderCollectionReusableView = collectionView.dequeueReusableView(
      ofKind: kind,
      forIndexPath: indexPath
    )

    header.configure(with: viewModel?.workout.value)

    return header
  }
}

// MARK: Exercise Cell Delegate
extension WorkoutViewController: ExerciseCollectionViewCellDelegate {
  func onShowDeleteAlert(_ exercise: Exercise?) {
    let alert = UIAlertController(
      title: "Atenção",
      message: "Você deseja deletar esse exercício?",
      preferredStyle: .alert
    )

    let deleteAction = UIAlertAction(title: "deletar", style: .destructive) { [weak self] _ in
      guard let self = self else { return }

      self.viewModel?.onDeleteExercise(exercise)
    }

    let backAction = UIAlertAction(title: "voltar", style: .cancel)

    alert.addAction(deleteAction)
    alert.addAction(backAction)

    present(alert, animated: true)
  }
}

