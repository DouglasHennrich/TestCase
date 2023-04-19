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

// MARK: Register / Dequeue reusable view
public extension UICollectionView {
  enum ReusableViewType {
    case header
    case footer

    var value: String {
      switch self {
        case .header:
          return UICollectionView.elementKindSectionHeader

        case .footer:
          return UICollectionView.elementKindSectionFooter
      }
    }
  }

  func register<T: UICollectionReusableView>(
    _ reusableView: T.Type,
    ofType type: ReusableViewType
  ) {
    register(
      reusableView.self,
      forSupplementaryViewOfKind: type.value,
      withReuseIdentifier: reusableView.identifier
    )
  }

  func dequeueReusableView<T: UICollectionReusableView>(
    ofKind kind: String,
    forIndexPath indexPath: IndexPath
  ) -> T {
    guard let reusableView = dequeueReusableSupplementaryView(
      ofKind: kind,
      withReuseIdentifier: T.identifier,
      for: indexPath
    ) as? T else {
      fatalError("Could not dequeue reusableView with identifier: \(T.identifier)")
    }

    return reusableView
  }
}
