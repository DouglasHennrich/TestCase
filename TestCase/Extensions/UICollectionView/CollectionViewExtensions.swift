//
//  CollectionViewExtensions.swift
//  TestCase
//
//  Created by Douglas Hennrich on 17/04/23.
//

import UIKit

// MARK: Register / Dequeue cell
extension UICollectionView {
  func register<T: UICollectionViewCell>(_: T.Type) {
    register(T.self, forCellWithReuseIdentifier: T.identifier)
  }

  func dequeueReusableCell<T: UICollectionViewCell>(
    forIndexPath indexPath: IndexPath
  ) -> T {
    guard let cell = dequeueReusableCell(
      withReuseIdentifier: T.identifier,
      for: indexPath
    ) as? T else {
      fatalError("Could not dequeue cell with identifier: \(T.identifier)")
    }

    return cell
  }
}
