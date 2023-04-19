//
//  Button.swift
//  TestCase
//
//  Created by Douglas Hennrich on 16/04/23.
//

import UIKit

class Button: UIButton {
  // MARK: Properties
  private var fulfill = true

  // MARK: Components
  lazy var heightConstraint: NSLayoutConstraint = {
    heightAnchor.constraint(equalToConstant: 40)
  }()

  // MARK: Init
  init(
    title: String?,
    fulfill: Bool = true
  ) {
    super.init(frame: .zero)

    self.fulfill = fulfill

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
    setTitleColor(.Colors.primary, for: .normal)

    if fulfill {
      layer.borderWidth = 1
      layer.borderColor = UIColor.Colors.primary.cgColor
      layer.cornerRadius = 6

      backgroundColor = .Colors.backgroundDark
    } else {
      titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
    }

    contentEdgeInsets = UIEdgeInsets(
      top: 0,
      left: 16,
      bottom: 0,
      right: 16
    )
  }

  func configureConstraints() {
    translatesAutoresizingMaskIntoConstraints = false

    NSLayoutConstraint.activate([
      heightConstraint
    ])
  }
}
