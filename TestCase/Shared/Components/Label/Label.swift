//
//  Label.swift
//  TestCase
//
//  Created by Douglas Hennrich on 17/04/23.
//

import UIKit

class Label: UILabel {
  // MARK: Properties
  private var fontWeight: UIFont.Weight = .regular

  // MARK: Components
  lazy var heightConstraint: NSLayoutConstraint = {
    heightAnchor.constraint(equalToConstant: 14)
  }()

  // MARK: Init
  init(
    text: String? = nil,
    weight: UIFont.Weight = .regular
  ) {
    super.init(frame: .zero)

    fontWeight = weight

    configureUI()

    self.text = text
  }

  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

// MARK: UI
private extension Label {
  func configureUI() {
    configureSpecs()
    configureConstraints()
  }

  func configureSpecs() {
    textColor = .Colors.label
    textAlignment = .left
    font = .systemFont(ofSize: 14, weight: fontWeight)
    numberOfLines = 0
  }

  func configureConstraints() {
    translatesAutoresizingMaskIntoConstraints = false

    NSLayoutConstraint.activate([
      heightConstraint
    ])
  }
}
