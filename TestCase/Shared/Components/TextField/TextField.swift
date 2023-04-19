//
//  TextField.swift
//  TestCase
//
//  Created by Douglas Hennrich on 16/04/23.
//

import UIKit

class TextField: UITextField {
  // MARK: Properties
  lazy var heightConstraint: NSLayoutConstraint = {
    heightAnchor.constraint(equalToConstant: 40)
  }()

  private let padding = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
  private var outline = false

  // MARK: Init
  init(
    placeholder: String? = "",
    type: UIKeyboardType = .default,
    isPassword: Bool = false,
    outline: Bool = false
  ) {
    super.init(frame: .zero)

    self.outline = outline

    configureUI()

    self.placeholder = placeholder
    keyboardType = type
    isSecureTextEntry = isPassword

    attributedPlaceholder = NSAttributedString(
      string: placeholder ?? "",
      attributes: [
        NSAttributedString.Key.foregroundColor: UIColor.Colors.primary
      ]
    )
  }

  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: Actions
  override open func textRect(forBounds bounds: CGRect) -> CGRect {
    return bounds.inset(by: padding)
  }

  override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
    return bounds.inset(by: padding)
  }

  override open func editingRect(forBounds bounds: CGRect) -> CGRect {
    return bounds.inset(by: padding)
  }
}

// MARK: Configure UI
private extension TextField {
  func configureUI() {
    configureSpecs()
    configureConstraints()
  }

  func configureSpecs() {
    tintColor = .Colors.primary
    textAlignment = .left
    textColor = .Colors.label
    font = .systemFont(ofSize: 14)
    autocorrectionType = .no

    guard !outline else { return }

    backgroundColor = .Colors.backgroundDark
    layer.cornerRadius = 4
    layer.borderColor = UIColor.Colors.primary.cgColor
    layer.borderWidth = 1
  }

  func configureConstraints() {
    translatesAutoresizingMaskIntoConstraints = false

    NSLayoutConstraint.activate([
      heightConstraint
    ])
  }
}
