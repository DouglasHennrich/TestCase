//
//  ExerciseCollectionViewCellDelegate.swift
//  TestCase
//
//  Created by Douglas Hennrich on 18/04/23.
//

import Foundation

protocol ExerciseCollectionViewCellDelegate: AnyObject {
  func onShowDeleteAlert(_ exercise: Exercise?)
}
