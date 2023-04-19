//
//  WorkoutHeaderCollectionReusableView.swift
//  TestCase
//
//  Created by Douglas Hennrich on 18/04/23.
//

import UIKit

class WorkoutHeaderCollectionReusableView: UICollectionReusableView {
  // MARK: Properties
  var workout: Workout?
  private let innerPadding: CGFloat = 6

  // MARK: Components
  let nameField = TextField(placeholder: "nome do treino")
  let descriptionField = TextField(placeholder: "descrição do treino")
  let dateField = TextField(placeholder: "Data hh:mm dd/mm/yyyy")

  // MARK: Init
  override init(frame: CGRect) {
    super.init(frame: frame)
    configureUI()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func prepareForReuse() {
    workout = nil

    super.prepareForReuse()
  }

  // MARK: Configure
  func configure(with workout: Workout?) {
    guard let workout else { return }
    self.workout = workout

    nameField.text = workout.name
    descriptionField.text = workout.description
    dateField.text = workout.formatedDate
  }

  // MARK: Actions
  @objc func textFieldDidChange(_ textField: UITextField) {
    switch textField {
      case nameField:
        workout?.name = textField.text ?? ""

      case descriptionField:
        workout?.description = textField.text ?? ""

      case dateField:
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm dd/MM/yyyy"

        guard let date = dateFormatter.date(from: textField.text ?? "") else {
          return
        }

        workout?.date = date

      default: break
    }
  }
}

// MARK: UI
private extension WorkoutHeaderCollectionReusableView {
  func configureUI() {
    configureSelf()
    configureNameField()
    configureDescriptionField()
    configureDateField()
  }

  func configureSelf() {
    backgroundColor = .Colors.backgroundDark
  }
}

// MARK: NameField
private extension WorkoutHeaderCollectionReusableView {
  func configureNameField() {
    addSubview(nameField)

    configureNameFieldAction()
    configureNameFieldConstraints()
  }

  func configureNameFieldAction() {
    nameField.addTarget(
      self,
      action: #selector(textFieldDidChange),
      for: .editingChanged
    )
  }

  func configureNameFieldConstraints() {
    NSLayoutConstraint.activate([
      nameField.topAnchor.constraint(equalTo: topAnchor, constant: Constants.Screen.padding),
      nameField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.Screen.padding),
      nameField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.Screen.padding)
    ])
  }
}

// MARK: DescriptionField
private extension WorkoutHeaderCollectionReusableView {
  func configureDescriptionField() {
    addSubview(descriptionField)

    configureDescriptionFieldAction()
    configureDescriptionFieldConstraints()
  }

  func configureDescriptionFieldAction() {
    descriptionField.addTarget(
      self,
      action: #selector(textFieldDidChange),
      for: .editingChanged
    )
  }

  func configureDescriptionFieldConstraints() {
    NSLayoutConstraint.activate([
      descriptionField.topAnchor.constraint(equalTo: nameField.bottomAnchor, constant: innerPadding),
      descriptionField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.Screen.padding),
      descriptionField.trailingAnchor.constraint(
        equalTo: trailingAnchor,
        constant: -Constants.Screen.padding
      )
    ])
  }
}

// MARK: DateField
private extension WorkoutHeaderCollectionReusableView {
  func configureDateField() {
    addSubview(dateField)

    configureDateFieldAction()
    configureDateFieldConstraints()
  }

  func configureDateFieldAction() {
    dateField.addTarget(
      self,
      action: #selector(textFieldDidChange),
      for: .editingChanged
    )
  }

  func configureDateFieldConstraints() {
    NSLayoutConstraint.activate([
      dateField.topAnchor.constraint(equalTo: descriptionField.bottomAnchor, constant: innerPadding),
      dateField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.Screen.padding),
      dateField.trailingAnchor.constraint(
        equalTo: trailingAnchor,
        constant: -Constants.Screen.padding
      ),
      dateField.bottomAnchor.constraint(
        equalTo: bottomAnchor,
        constant: -Constants.Screen.padding
      )
    ])
  }
}
