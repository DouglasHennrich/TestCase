//
//  
//  WorkoutViewController.swift
//  TestCase
//
//  Created by Douglas Hennrich on 18/04/23.
//
//

import UIKit

class WorkoutViewController: CustomViewController<WorkoutView> {
  // MARK: Properties
  weak var viewModel: WorkoutViewModelDelegate?
  var stateView: UIStateEnum = .normal {
    didSet {
      guard stateView != oldValue else { return }

      changeUIState(with: stateView)
    }
  }

  // MARK: Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    configureNavigationBar()
    configureBinds()
    customView?.assignCollectionViewDelegates(to: self)
    
    customView?.delegate = self


    viewModel?.onViewDidLoad()
  }

  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)

    viewModel?.onRemoveReference()
  }

  // MARK: Actions
  @objc func onNavBarAddButtonAction() {
    viewModel?.onAddExerciseAction()
  }

  @objc func onNavBarSaveWorkoutButtonAction() {
    viewModel?.onSaveWorkoutAction()
  }
}

// MARK: Conforms to UI Delegate
extension WorkoutViewController: WorkoutViewDelegate {}

// MARK: Configure NavigationBar
extension WorkoutViewController {
  func configureNavigationBar() {
    title = "Workout"

    configureNavigationBarRightButtons()
  }

  func configureNavigationBarRightButtons() {
    let saveButton = UIBarButtonItem(
      title: "salvar",
      style: .done,
      target: self,
      action: #selector(onNavBarSaveWorkoutButtonAction)
    )

    let addButton = UIBarButtonItem(
      image: UIImage(systemName: "plus"),
      style: .done,
      target: self,
      action: #selector(onNavBarAddButtonAction)
    )

    navigationItem.setRightBarButtonItems([saveButton, addButton], animated: true)
  }
}

// MARK: Initialize
extension WorkoutViewController {
  static func initialize(
    viewModel: WorkoutViewModelDelegate?
  ) -> WorkoutViewController {
    let vc = WorkoutViewController()
    vc.viewModel = viewModel

    return vc
  }
}
