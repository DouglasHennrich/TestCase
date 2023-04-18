//
//  
//  MainView.swift
//  TestCase
//
//  Created by Douglas Hennrich on 17/04/23.
//
//

import UIKit

class MainView: UIView {
  // MARK: Properties
  weak var delegate: MainViewDelegate?
  weak var collectionViewDelegates: (UICollectionViewDataSource & UICollectionViewDelegateFlowLayout)?

  // MARK: Components
  let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
  let refreshControl = UIRefreshControl()
  let emptyLabel = UILabel()

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

  func endRefreshing() {
    refreshControl.endRefreshing()
  }

  @objc func onRefreshControl() {
    delegate?.refreshWorkouts()
  }
}
