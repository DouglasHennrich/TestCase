//
//  WorkoutCellDelegate+Layouts.swift
//  TestCase
//
//  Created by Douglas Hennrich on 17/04/23.
//

import UIKit

extension WorkoutCollectionViewCell {
  func configureUI() {
    configureContentViewSpecs()
    configureContentViewGesture()
    configureContentViewConstraints()
    configureNameLabel()
    configureDescriptionLabel()
    configureDateLabel()
    configureNumberOfExercisesLabel()
    configureDetailsButton()
  }

  func configureContentViewSpecs() {
    contentView.clipsToBounds = true
    contentView.backgroundColor = .Colors.backgroundDark
    contentView.layer.cornerRadius = 6
    contentView.layer.borderWidth = 1.0
    contentView.layer.borderColor = UIColor.Colors.primary.cgColor
    contentView.layer.masksToBounds = true
  }

  func configureContentViewGesture() {
    let longpressGesture = UILongPressGestureRecognizer(
      target: self,
      action: #selector(onShowDeleteAlertAction)
    )

    contentView.addGestureRecognizer(longpressGesture)
  }

  func configureContentViewConstraints() {
    contentView.translatesAutoresizingMaskIntoConstraints = false
  }
}

// MARK: Name Label
private extension WorkoutCollectionViewCell {
  func configureNameLabel() {
    contentView.addSubview(nameLabel)

    configureNameLabelConstraints()
    configureNameLabelValue()
  }

  func configureNameLabelConstraints() {
    NSLayoutConstraint.activate([
      nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: cellPadding),
      nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: cellPadding)
    ])
  }

  func configureNameLabelValue() {
    contentView.addSubview(nameLabelValue)

    configureNameLabelValueSpecs()
    configureNameLabelValueConstraints()
  }

  func configureNameLabelValueSpecs() {
    nameLabelValue.textAlignment = .right
  }

  func configureNameLabelValueConstraints() {
    NSLayoutConstraint.activate([
      nameLabelValue.topAnchor.constraint(equalTo: nameLabel.topAnchor),
      nameLabelValue.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 4),
      nameLabelValue.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -cellPadding)
    ])

    nameLabelValue.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
  }
}

// MARK: Description Label
private extension WorkoutCollectionViewCell {
  func configureDescriptionLabel() {
    contentView.addSubview(descriptionLabel)

    configureDescriptionLabelConstraints()
    configureDescriptionLabelValue()
  }

  func configureDescriptionLabelConstraints() {
    NSLayoutConstraint.activate([
      descriptionLabel.topAnchor.constraint(equalTo: nameLabelValue.bottomAnchor, constant: 4),
      descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: cellPadding)
    ])
  }

  func configureDescriptionLabelValue() {
    contentView.addSubview(descriptionLabelValue)

    configureDescriptionLabelValueSpecs()
    configureDescriptionLabelValueConstraints()
  }

  func configureDescriptionLabelValueSpecs() {
    descriptionLabelValue.textAlignment = .right
  }

  func configureDescriptionLabelValueConstraints() {
    NSLayoutConstraint.activate([
      descriptionLabelValue.topAnchor.constraint(equalTo: descriptionLabel.topAnchor),
      descriptionLabelValue.leadingAnchor.constraint(equalTo: descriptionLabel.trailingAnchor, constant: 4),
      descriptionLabelValue.trailingAnchor.constraint(
        equalTo: contentView.trailingAnchor,
        constant: -cellPadding
      )
    ])

    descriptionLabelValue.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
  }
}

// MARK: Date Label
private extension WorkoutCollectionViewCell {
  func configureDateLabel() {
    contentView.addSubview(dateLabel)

    configureDateLabelConstraints()
    configureDateLabelValue()
  }

  func configureDateLabelConstraints() {
    NSLayoutConstraint.activate([
      dateLabel.topAnchor.constraint(equalTo: descriptionLabelValue.bottomAnchor, constant: 4),
      dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: cellPadding)
    ])
  }

  func configureDateLabelValue() {
    contentView.addSubview(dateLabelValue)

    configureDateLabelValueSpecs()
    configureDateLabelValueConstraints()
  }

  func configureDateLabelValueSpecs() {
    dateLabelValue.textAlignment = .right
  }

  func configureDateLabelValueConstraints() {
    NSLayoutConstraint.activate([
      dateLabelValue.topAnchor.constraint(equalTo: dateLabel.topAnchor),
      dateLabelValue.leadingAnchor.constraint(equalTo: dateLabel.trailingAnchor, constant: 4),
      dateLabelValue.trailingAnchor.constraint(
        equalTo: contentView.trailingAnchor,
        constant: -cellPadding
      )
    ])

    dateLabelValue.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
  }
}

// MARK: NumberOfExercises Label
private extension WorkoutCollectionViewCell {
  func configureNumberOfExercisesLabel() {
    contentView.addSubview(numberOfExercisesLabel)

    configureNumberOfExercisesLabelConstraints()
    configureNumberOfExercisesLabelValue()
  }

  func configureNumberOfExercisesLabelConstraints() {
    NSLayoutConstraint.activate([
      numberOfExercisesLabel.topAnchor.constraint(equalTo: dateLabelValue.bottomAnchor, constant: 4),
      numberOfExercisesLabel.leadingAnchor.constraint(
        equalTo: contentView.leadingAnchor,
        constant: cellPadding
      )
    ])
  }

  func configureNumberOfExercisesLabelValue() {
    contentView.addSubview(numberOfExercisesLabelValue)

    configureNumberOfExercisesLabelValueSpecs()
    configureNumberOfExercisesLabelValueConstraints()
  }

  func configureNumberOfExercisesLabelValueSpecs() {
    numberOfExercisesLabelValue.textAlignment = .right
  }

  func configureNumberOfExercisesLabelValueConstraints() {
    NSLayoutConstraint.activate([
      numberOfExercisesLabelValue.topAnchor.constraint(equalTo: numberOfExercisesLabel.topAnchor),
      numberOfExercisesLabelValue.leadingAnchor.constraint(
        equalTo: numberOfExercisesLabel.trailingAnchor,
        constant: 4
      ),
      numberOfExercisesLabelValue.trailingAnchor.constraint(
        equalTo: contentView.trailingAnchor,
        constant: -cellPadding
      )
    ])

    numberOfExercisesLabelValue.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
  }
}

// MARK: DetailsButton
private extension WorkoutCollectionViewCell {
  func configureDetailsButton() {
    contentView.addSubview(detailsButton)

    configureDetailsButtonSpecs()
    configureDetailsButtonAction()
    configureDetailsButtonConstraints()
  }

  func configureDetailsButtonSpecs() {
    detailsButton.titleLabel?.font = .systemFont(ofSize: 12, weight: .bold)
  }

  func configureDetailsButtonAction() {
    detailsButton.addTarget(self, action: #selector(onDetailsButtonAction), for: .touchUpInside)
  }

  func configureDetailsButtonConstraints() {
    NSLayoutConstraint.activate([
      detailsButton.topAnchor.constraint(equalTo: numberOfExercisesLabelValue.bottomAnchor, constant: 4),
      detailsButton.trailingAnchor.constraint(
        equalTo: contentView.trailingAnchor,
        constant: -cellPadding
      ),
      detailsButton.bottomAnchor.constraint(
        equalTo: contentView.bottomAnchor,
        constant: -cellPadding
      )
    ])

    detailsButton.heightConstraint.constant = 32
  }
}
