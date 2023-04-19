//
//  
//  WorkoutView+Layouts.swift
//  TestCase
//
//  Created by Douglas Hennrich on 18/04/23.
//
//

import UIKit

extension WorkoutView {
  func configureUI() {
    configureSelf()
    configureCollectionView()
  }

  func configureSelf() {
    backgroundColor = .Colors.background
  }
}

// MARK: CollectionView
private extension WorkoutView {
  func configureCollectionView() {
    addSubview(collectionView)

    configureCollectionViewSpecs()
    configureCollectionViewLayout()
    configureCollectionViewRegisters()
    configureCollectionViewConstraints()
  }

  func configureCollectionViewSpecs() {
    collectionView.backgroundColor = .clear
    collectionView.showsVerticalScrollIndicator = false
    collectionView.alwaysBounceVertical = true
    collectionView.keyboardDismissMode = .interactive
  }

  func configureCollectionViewLayout() {
    let layout = UICollectionViewFlowLayout()
    layout.minimumInteritemSpacing = 12
    layout.minimumLineSpacing = 16
    layout.sectionInset = .init(
      top: Constants.Screen.padding,
      left: Constants.Screen.padding,
      bottom: Constants.Screen.padding,
      right:  Constants.Screen.padding
    )
    layout.scrollDirection = .vertical

    let totalPadding = Constants.Screen.padding * 2
    layout.estimatedItemSize = .init(width: Constants.Screen.width - totalPadding, height: 100)
    layout.headerReferenceSize = .init(width: Constants.Screen.width, height: 180)

    collectionView.collectionViewLayout = layout
  }

  func configureCollectionViewRegisters() {
    collectionView.register(ExerciseCollectionViewCell.self)
    collectionView.register(WorkoutHeaderCollectionReusableView.self, ofType: .header)
  }

  func configureCollectionViewConstraints() {
    collectionView.translatesAutoresizingMaskIntoConstraints = false

    NSLayoutConstraint.activate([
      collectionView.topAnchor.constraint(equalTo: topAnchor),
      collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
      collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
      collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])
  }
}
