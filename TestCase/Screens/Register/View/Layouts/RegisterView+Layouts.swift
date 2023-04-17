//
//  
//  RegisterView+Layouts.swift
//  TestCase
//
//  Created by Douglas Hennrich on 16/04/23.
//
//

import UIKit

extension RegisterView {
  func configureUI() {
    configureSelf()
    configureScrollView()
    configureContainerView()
    configureIconImageView()
    configureEmailField()
    configurePasswordField()
    configureRegisterButton()
  }
}

// MARK: Self
private extension RegisterView {
  func configureSelf() {
    backgroundColor = .Colors.background
  }
}

// MARK: ScrollView
private extension RegisterView {
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
private extension RegisterView {
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
private extension RegisterView {
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
private extension RegisterView {
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
private extension RegisterView {
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

// MARK: RegisterButton
private extension RegisterView {
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
      registerButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 16),
      registerButton.leadingAnchor.constraint(
        equalTo: containerView.leadingAnchor,
        constant: Constants.Screen.padding
      ),
      registerButton.trailingAnchor.constraint(
        equalTo: containerView.trailingAnchor,
        constant: -Constants.Screen.padding
      )
    ])
  }
}
