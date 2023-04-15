//
//  CustomViewController.swift
//  TestCase
//
//  Created by Douglas Hennrich on 15/04/23.
//

import UIKit

open class CustomViewController<T: UIView>: UIViewController {
  // MARK: Properties
  open override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }

  // MARK: Components
  var customView: T? {
    return view as? T
  }

  // MARK: Life Cycle
  init() {
    super.init(nibName: nil, bundle: nil)
  }

  @available(*, unavailable)
  required public init?(coder _: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  open override func loadView() {
    view = T()
  }

  // MARK: Actions
  func dismissKeyboard() {
    customView?.endEditing(true)
  }
}
