//
//  
//  RegisterView.swift
//  TestCase
//
//  Created by Douglas Hennrich on 16/04/23.
//
//

import UIKit

class RegisterView: UIView {
  // MARK: Properties
  weak var delegate: RegisterViewDelegate?

  // MARK: Components
  let scrollView = UIScrollView()
  let containerView = UIView()
  let iconImageView = UIImageView()
  let emailField = TextField(placeholder: "email", type: .emailAddress)
  let passwordField = TextField(placeholder: "senha", isPassword: true)
  let registerButton = Button(title: "registrar")

  // MARK: Init
  init() {
    super.init(frame: .zero)
    configureUI()
  }

  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: Actions
  @objc func onScrollViewTap() {
    endEditing(true)
  }
  
  func onRegisterButtonAction() {
    delegate?.onRegisterButtonAction(email: emailField.text, password: passwordField.text)
  }
}
