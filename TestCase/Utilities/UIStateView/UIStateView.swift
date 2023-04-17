//
//  UIStateView.swift
//  TestCase
//
//  Created by Douglas Hennrich on 15/04/23.
//

import Foundation

public enum UIStateEnum: Equatable {
  case normal
  case loading
  case error(message: String?)
  case empty
}

public protocol UIStateDelegate: AnyObject {
  var stateView: UIStateEnum { get set }

  func changeUIState(with type: UIStateEnum)
}
