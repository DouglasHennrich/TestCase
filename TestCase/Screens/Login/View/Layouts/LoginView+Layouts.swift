//
//  
//  LoginView+Layouts.swift
//  TestCase
//
//  Created by Douglas Hennrich on 15/04/23.
//
//

import UIKit

extension LoginView {
  func configureUI() {
    configureSelf()
    configureScrollView()
    configureContainerView()
    configureIconImageView()
    configureEmailField()
    configurePasswordField()
    configureLoginButton()
    configureAppleSignInButton()
    configureRegisterButton()
  }
}

// MARK: Self
private extension LoginView {
  func configureSelf() {
    backgroundColor = .Colors.background
  }
}

// MARK: ScrollView
private extension LoginView {
  func configureScrollView() {
    addSubview(scrollView)

    configureScrollViewSpecs()
    configureScrollViewGesture()
    configureScrollViewConstraints()
  }

  func configureScrollViewSpecs() {
    scrollView.alwaysBounceVertical = true
    scrollView.showsVerticalScrollIndicator = false
  }

  func configureScrollViewGesture() {
    let tap = UITapGestureRecognizer(target: self, action: #selector(onScrollViewTap))

    scrollView.addGestureRecognizer(tap)
  }

  func configureScrollViewConstraints() {
    scrollView.translatesAutoresizingMaskIntoConstraints = false

    NSLayoutConstraint.activate([
      scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
      scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
      scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
      scrollView.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])
  }
}

// MARK: ContainerView
private extension LoginView {
  func configureContainerView() {
    scrollView.addSubview(containerView)

    configureContainerViewSpecs()
    configureContainerViewConstraints()
  }

  func configureContainerViewSpecs() {}

  func configureContainerViewConstraints() {
    containerView.translatesAutoresizingMaskIntoConstraints = false

    NSLayoutConstraint.activate([
      containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
      containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
      containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
      containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
      containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
    ])
  }
}

// MARK: IconImageView
private extension LoginView {
  func configureIconImageView() {
    containerView.addSubview(iconImageView)

    configureIconImageViewSpecs()
    configureIconImageViewConstraints()
  }

  func configureIconImageViewSpecs() {
    iconImageView.image = UIImage(systemName: "dumbbell.fill")
    iconImageView.tintColor = .Colors.primary
    iconImageView.contentMode = .scaleAspectFit
  }

  func configureIconImageViewConstraints() {
    let size: CGFloat = 80

    iconImageView.translatesAutoresizingMaskIntoConstraints = false

    NSLayoutConstraint.activate([
      iconImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
      iconImageView.widthAnchor.constraint(equalToConstant: size),
      iconImageView.heightAnchor.constraint(equalToConstant: size),
      iconImageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor)
    ])
  }
}

// MARK: EmailField
private extension LoginView {
  func configureEmailField() {
    containerView.addSubview(emailField)

    configureEmailFieldSpecs()
    configureEmailFieldDelegate()
    configureEmailFieldConstraints()
  }

  func configureEmailFieldSpecs() {
    emailField.returnKeyType = .next
  }

  func configureEmailFieldDelegate() {
    emailField.delegate = self
  }

  func configureEmailFieldConstraints() {
    NSLayoutConstraint.activate([
      emailField.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 20),
      emailField.leadingAnchor.constraint(
        equalTo: containerView.leadingAnchor,
        constant: Constants.Screen.padding
      ),
      emailField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -Constants.Screen.padding)
    ])
  }
}

// MARK: PasswordField
private extension LoginView {
  func configurePasswordField() {
    containerView.addSubview(passwordField)

    configurePasswordFieldSpecs()
    configurePasswordFieldDelegate()
    configurePasswordFieldConstraints()
  }

  func configurePasswordFieldSpecs() {
    passwordField.returnKeyType = .join
  }

  func configurePasswordFieldDelegate() {
    passwordField.delegate = self
  }

  func configurePasswordFieldConstraints() {
    NSLayoutConstraint.activate([
      passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 16),
      passwordField.leadingAnchor.constraint(
        equalTo: containerView.leadingAnchor,
        constant: Constants.Screen.padding
      ),
      passwordField.trailingAnchor.constraint(
        equalTo: containerView.trailingAnchor,
        constant: -Constants.Screen.padding
      )
    ])
  }
}

// MARK: LoginButton
private extension LoginView {
  func configureLoginButton() {
    containerView.addSubview(loginButton)

    configureLoginButtonAction()
    configureLoginButtonConstraints()
  }

  func configureLoginButtonAction() {
    loginButton.addTarget(self, action: #selector(onLoginButtonAction), for: .touchUpInside)
  }

  func configureLoginButtonConstraints() {
    NSLayoutConstraint.activate([
      loginButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 16),
      loginButton.leadingAnchor.constraint(
        equalTo: containerView.leadingAnchor,
        constant: Constants.Screen.padding
      ),
      loginButton.trailingAnchor.constraint(
        equalTo: containerView.trailingAnchor,
        constant: -Constants.Screen.padding
      )
    ])
  }
}

// MARK: Apple SignIn Button
private extension LoginView {
  func configureAppleSignInButton() {
    containerView.addSubview(appleSignInButton)

    configureAppleSignInButtonAction()
    configureAppleSignInButtonConstraints()
  }

  func configureAppleSignInButtonAction() {
    appleSignInButton.addTarget(self, action: #selector(onAppleButtonAction), for: .touchUpInside)
  }

  func configureAppleSignInButtonConstraints() {
    appleSignInButton.translatesAutoresizingMaskIntoConstraints = false

    NSLayoutConstraint.activate([
      appleSignInButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 60),
      appleSignInButton.leadingAnchor.constraint(
        equalTo: containerView.leadingAnchor,
        constant: Constants.Screen.padding
      ),
      appleSignInButton.trailingAnchor.constraint(
        equalTo: containerView.trailingAnchor,
        constant: -Constants.Screen.padding
      ),
      appleSignInButton.heightAnchor.constraint(equalToConstant: 40)
    ])
  }
}

// MARK: RegisterButton
private extension LoginView {
  func configureRegisterButton() {
    containerView.addSubview(registerButton)

    configureRegisterButtonAction()
    configureRegisterButtonConstraints()
  }

  func configureRegisterButtonAction() {
    registerButton.addTarget(self, action: #selector(onRegisterButtonAction), for: .touchUpInside)
  }

  func configureRegisterButtonConstraints() {
    NSLayoutConstraint.activate([
      registerButton.topAnchor.constraint(equalTo: appleSignInButton.bottomAnchor, constant: 16),
      registerButton.leadingAnchor.constraint(
        equalTo: containerView.leadingAnchor,
        constant: Constants.Screen.padding
      ),
      registerButton.trailingAnchor.constraint(
        equalTo: containerView.trailingAnchor,
        constant: -Constants.Screen.padding
      ),
      registerButton.bottomAnchor.constraint(
        equalTo: containerView.bottomAnchor,
        constant: -Constants.Screen.padding
      )
    ])
  }
}
