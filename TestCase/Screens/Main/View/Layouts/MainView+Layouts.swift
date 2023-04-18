//
//  
//  MainView+Layouts.swift
//  TestCase
//
//  Created by Douglas Hennrich on 17/04/23.
//
//

import UIKit

extension MainView {
  func configureUI() {
    configureSelf()
    configureCollectionView()
    configureRefreshControl()
    configureEmptyLabel()
  }

  func configureSelf() {
    backgroundColor = .Colors.background
  }
}

// MARK: CollectionView
private extension MainView {
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
    layout.estimatedItemSize = CGSize(width: Constants.Screen.width - totalPadding, height: 100)

    collectionView.collectionViewLayout = layout
  }

  func configureCollectionViewRegisters() {
    collectionView.register(WorkoutCollectionViewCell.self)
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

// MARK: RefreshControl
private extension MainView {
  func configureRefreshControl() {
    collectionView.refreshControl = refreshControl

    configureRefreshControlSpecs()
    configureRefreshControlAction()
  }

  func configureRefreshControlSpecs() {
    refreshControl.tintColor = .Colors.primary
  }

  func configureRefreshControlAction() {
    refreshControl.addTarget(self, action: #selector(onRefreshControl), for: .valueChanged)
  }
}

// MARK: EmptyLabel
private extension MainView {
  func configureEmptyLabel() {
    collectionView.addSubview(emptyLabel)

    configureEmptyLabelSpecs()
    configureEmptyLabelConstraints()
  }

  func configureEmptyLabelSpecs() {
    emptyLabel.font = .systemFont(ofSize: 16, weight: .medium)
    emptyLabel.textAlignment = .center
    emptyLabel.textColor = .Colors.primary
    emptyLabel.text = "nenhum treino salvo ainda"
    emptyLabel.isHidden = true
  }

  func configureEmptyLabelConstraints() {
    emptyLabel.translatesAutoresizingMaskIntoConstraints = false

    NSLayoutConstraint.activate([
      emptyLabel.centerXAnchor.constraint(equalTo: collectionView.centerXAnchor),
    ])

    NSLayoutConstraint(
      item: emptyLabel,
      attribute: .centerY,
      relatedBy: .equal,
      toItem: collectionView,
      attribute: .centerY,
      multiplier: 0.6,
      constant: 0
    ).isActive = true
  }
}
