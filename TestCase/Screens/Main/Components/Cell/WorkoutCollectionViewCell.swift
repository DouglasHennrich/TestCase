//
//  WorkoutCollectionViewCell.swift
//  TestCase
//
//  Created by Douglas Hennrich on 17/04/23.
//

import UIKit

class WorkoutCollectionViewCell: UICollectionViewCell {
  // MARK: Properties
  lazy var width: NSLayoutConstraint = {
    let width = contentView.widthAnchor.constraint(equalToConstant: bounds.size.width)
    width.isActive = true

    return width
  }()

  weak var delegate: WorkoutCellDelegate?
  var workout: Workout?
  let cellPadding: CGFloat = 8

  // MARK: Components
  let nameLabel = Label(text: "nome:")
  let nameLabelValue = Label(weight: .bold)

  let descriptionLabel = Label(text: "descrição:")
  let descriptionLabelValue = Label(weight: .bold)

  let dateLabel = Label(text: "data:")
  let dateLabelValue = Label(weight: .bold)

  let numberOfExercisesLabel = Label(text: "quantos exercícios:")
  let numberOfExercisesLabelValue = Label(weight: .bold)

  let detailsButton = Button(title: "detalhes")

  // MARK: Init
  override init(frame: CGRect) {
    super.init(frame: frame)
    configureUI()
  }

  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

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
    workout = nil
    delegate = nil
    nameLabelValue.text = nil
    descriptionLabelValue.text = nil
    dateLabelValue.text = nil
    numberOfExercisesLabelValue.text = nil

    super.prepareForReuse()
  }

  // MARK: Configure
  func configure(with workout: Workout?) {
    guard let workout else { return }

    self.workout = workout
    nameLabelValue.text = workout.name
    descriptionLabelValue.text = workout.description
    dateLabelValue.text = workout.formatedDate
    numberOfExercisesLabelValue.text = workout.exercises.count <= 9 ?
    "0\(workout.exercises.count)":
    "\(workout.exercises.count)"
  }

  // MARK: Actions
  @objc func onDetailsButtonAction() {
    delegate?.onWorkoutCellAction(workout)
  }
}
