//
//  ExerciseCollectionViewCell+Layouts.swift
//  TestCase
//
//  Created by Douglas Hennrich on 18/04/23.
//

import UIKit

extension ExerciseCollectionViewCell {
  func configureUI() {
    configureContentViewSpecs()
    configureContentViewConstraints()
    configurePhotoImageView()
    configureNumberField()
    configureNotesField()
    configureDeleteButton()
  }

  func configureContentViewSpecs() {
    contentView.clipsToBounds = true
    contentView.backgroundColor = .Colors.backgroundDark
    contentView.layer.cornerRadius = 6
    contentView.layer.borderWidth = 1.0
    contentView.layer.borderColor = UIColor.Colors.primary.cgColor
    contentView.layer.masksToBounds = true
  }

  func configureContentViewConstraints() {
    contentView.translatesAutoresizingMaskIntoConstraints = false
  }
}

// MARK: PhotoImageView
private extension ExerciseCollectionViewCell {
  func configurePhotoImageView() {
    contentView.addSubview(photoImageView)

    configurePhotoImageViewSpecs()
    configurePhotoImageViewConstraints()
  }

  func configurePhotoImageViewSpecs() {
    photoImageView.contentMode = .scaleAspectFit
    photoImageView.layer.cornerRadius = 40
    photoImageView.image = UIImage(systemName: "photo.artframe")
    photoImageView.tintColor = .Colors.primary
    photoImageView.clipsToBounds = true
  }

  func configurePhotoImageViewConstraints() {
    let size: CGFloat = 80

    photoImageView.translatesAutoresizingMaskIntoConstraints = false

    NSLayoutConstraint.activate([
      photoImageView.widthAnchor.constraint(equalToConstant: size),
      photoImageView.heightAnchor.constraint(equalToConstant: size),
      photoImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
      photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: cellPadding)
    ])
  }
}

// MARK: NumberField
private extension ExerciseCollectionViewCell {
  func configureNumberField() {
    contentView.addSubview(numberField)

    configureNumberFieldAction()
    configureNumberFieldConstraints()
  }

  func configureNumberFieldAction() {
    numberField.addTarget(
      self,
      action: #selector(textFieldDidChange),
      for: .editingChanged
    )
  }

  func configureNumberFieldConstraints() {
    NSLayoutConstraint.activate([
      numberField.topAnchor.constraint(equalTo: contentView.topAnchor, constant: cellPadding),
      numberField.leadingAnchor.constraint(equalTo: photoImageView.trailingAnchor, constant: 6),
      numberField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -cellPadding)
    ])
  }
}

// MARK: NotesField
private extension ExerciseCollectionViewCell {
  func configureNotesField() {
    contentView.addSubview(notesField)

    configureNotesFieldAction()
    configureNotesFieldConstraints()
  }

  func configureNotesFieldAction() {
    notesField.addTarget(
      self,
      action: #selector(textFieldDidChange),
      for: .editingChanged
    )
  }

  func configureNotesFieldConstraints() {
    NSLayoutConstraint.activate([
      notesField.topAnchor.constraint(equalTo: numberField.bottomAnchor, constant: 6),
      notesField.leadingAnchor.constraint(equalTo: numberField.leadingAnchor),
      notesField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -cellPadding)
    ])
  }
}

// MARK: DetailsButton
private extension ExerciseCollectionViewCell {
  func configureDeleteButton() {
    contentView.addSubview(deleteButton)

    configureDeleteButtonSpecs()
    configureDeleteButtonAction()
    configureDeleteButtonConstraints()
  }

  func configureDeleteButtonSpecs() {
    deleteButton.titleLabel?.font = .systemFont(ofSize: 12, weight: .bold)
  }

  func configureDeleteButtonAction() {
    deleteButton.addTarget(self, action: #selector(onShowDeleteAlertAction), for: .touchUpInside)
  }

  func configureDeleteButtonConstraints() {
    NSLayoutConstraint.activate([
      deleteButton.topAnchor.constraint(equalTo: notesField.bottomAnchor, constant: 6),
      deleteButton.trailingAnchor.constraint(
        equalTo: contentView.trailingAnchor,
        constant: -cellPadding
      ),
      deleteButton.bottomAnchor.constraint(
        equalTo: contentView.bottomAnchor,
        constant: -cellPadding
      )
    ])

    deleteButton.heightConstraint.constant = 32
  }
}
