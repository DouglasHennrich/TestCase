//
//  
//  LoginView.swift
//  TestCase
//
//  Created by Douglas Hennrich on 15/04/23.
//
//

import UIKit
import AuthenticationServices
import FirebaseAuth

class LoginView: UIView {
  // MARK: Properties
  weak var delegate: LoginViewDelegate?
  weak var appleAuthenticationDelegate: (ASAuthorizationControllerDelegate & ASAuthorizationControllerPresentationContextProviding)?

  let screenPadding: CGFloat = 24

  // MARK: Components
  let scrollView = UIScrollView()
  let containerView = UIView()
  let iconImageView = UIImageView()
  let emailField = TextField(placeholder: "email", type: .emailAddress)
  let passwordField = TextField(placeholder: "senha", isPassword: true)
  let loginButton = Button(title: "entrar")
  let appleSignInButton = ASAuthorizationAppleIDButton(
    authorizationButtonType: .continue,
    authorizationButtonStyle: .black
  )

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

  @objc func onLoginButtonAction() {
    delegate?.onLoginButtonAction(email: emailField.text, password: passwordField.text)
  }

  @objc func onAppleButtonAction() {
    let appleIDProvider = ASAuthorizationAppleIDProvider()
    let request = appleIDProvider.createRequest()
    request.requestedScopes = [.fullName, .email]

    let authorizationController = ASAuthorizationController(authorizationRequests: [request])
    authorizationController.delegate = appleAuthenticationDelegate
    authorizationController.presentationContextProvider = appleAuthenticationDelegate
    authorizationController.performRequests()
  }
}
