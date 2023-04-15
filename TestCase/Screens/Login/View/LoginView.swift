//
//  
//  LoginView.swift
//  TestCase
//
//  Created by Douglas Hennrich on 15/04/23.
//
//

import UIKit

class LoginView: UIView {
  // MARK: Properties
  weak var delegate: LoginViewDelegate?

  // MARK: Components

  // MARK: Init
  init() {
    super.init(frame: .zero)
    configureUI()
  }

  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
