//
//  UIStateView.swift
//  TestCase
//
//  Created by Douglas Hennrich on 15/04/23.
//

import Foundation

public enum UIStateEnum {
  case normal
  case loading
  case error
  case empty
}

public protocol UIStateDelegate: AnyObject {
  var stateView: UIStateEnum { get set }

  func changeUIState(with type: UIStateEnum)
}
