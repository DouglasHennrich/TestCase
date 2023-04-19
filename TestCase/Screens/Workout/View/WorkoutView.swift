//
//  
//  WorkoutView.swift
//  TestCase
//
//  Created by Douglas Hennrich on 18/04/23.
//
//

import UIKit

class WorkoutView: UIView {
  // MARK: Properties
  weak var delegate: WorkoutViewDelegate?

  // MARK: Components
  let collectionView = UICollectionView(
    frame: .zero,
    collectionViewLayout: UICollectionViewLayout()
  )

  // MARK: Init
  init() {
    super.init(frame: .zero)
    configureUI()
  }

  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: Actions
  func assignCollectionViewDelegates(
    to holder: (UICollectionViewDataSource & UICollectionViewDelegate)
  ) {
    collectionView.dataSource = holder
    collectionView.delegate = holder
  }
}
