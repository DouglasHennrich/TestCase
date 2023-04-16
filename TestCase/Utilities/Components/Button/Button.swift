//
//  Button.swift
//  TestCase
//
//  Created by Douglas Hennrich on 16/04/23.
//

import UIKit

class Button: UIButton {
  // MARK: Properties
  lazy var heightConstraint: NSLayoutConstraint = {
    heightAnchor.constraint(equalToConstant: 40)
  }()

  // MARK: Init
  init(title: String?) {
    super.init(frame: .zero)
    configureUI()

    setTitle(title, for: .normal)
  }

  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

// MARK: UI
private extension Button {
  func configureUI() {
    configureSpecs()
    configureConstraints()
  }

  func configureSpecs() {
    layer.borderWidth = 1
    layer.borderColor = UIColor.Colors.primary.cgColor
    layer.cornerRadius = 6
    backgroundColor = .Colors.backgroundDark

    setTitleColor(.Colors.primary, for: .normal)
  }

  func configureConstraints() {
    translatesAutoresizingMaskIntoConstraints = false

    NSLayoutConstraint.activate([
      heightConstraint
    ])
  }
}
