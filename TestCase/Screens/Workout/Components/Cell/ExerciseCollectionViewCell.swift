//
//  ExerciseCollectionViewCell.swift
//  TestCase
//
//  Created by Douglas Hennrich on 18/04/23.
//

import UIKit

class ExerciseCollectionViewCell: UICollectionViewCell {
  // MARK: Properties
  lazy var width: NSLayoutConstraint = {
    let width = contentView.widthAnchor.constraint(equalToConstant: bounds.size.width)
    width.isActive = true

    return width
  }()
  weak var delegate: ExerciseCollectionViewCellDelegate?
  var exercise: Exercise?
  let cellPadding: CGFloat = 8

  // MARK: Components
  let photoImageView = UIImageView()
  let numberField = TextField(placeholder: "número do exercício", type: .numberPad, outline: true)
  let notesField = TextField(placeholder: "descrição", outline: true)
  let deleteButton = Button(title: "deletar")

  // MARK: Init
  override init(frame: CGRect) {
    super.init(frame: frame)
    configureUI()
  }

  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: Life Cycle
  override func systemLayoutSizeFitting(
    _ targetSize: CGSize,
    withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority,
    verticalFittingPriority: UILayoutPriority
  ) -> CGSize {
    width.constant = bounds.size.width

    return contentView.systemLayoutSizeFitting(
      CGSize(width: targetSize.width, height: 1)
    )
  }

  override func prepareForReuse() {
    delegate = nil
    exercise = nil
    photoImageView.image = nil
    numberField.text = nil
    notesField.text = nil

    super.prepareForReuse()
  }

  // MARK: Configure
  func configure(with exercise: Exercise?) {
    guard let exercise else { return }
    self.exercise = exercise

    numberField.text = "\(exercise.name)"
    notesField.text = exercise.notes
    photoImageView.setImage(exercise.image, placeholder: UIImage(systemName: "photo.artframe"))
  }

  // MARK: Actions
  @objc func onShowDeleteAlertAction() {
    delegate?.onShowDeleteAlert(exercise)
  }

  @objc func textFieldDidChange(_ textField: UITextField) {
    if textField == numberField {
      exercise?.name = Int(textField.text ?? "0") ?? 0

    } else if textField == notesField {
      exercise?.notes = textField.text
    }
  }
}
