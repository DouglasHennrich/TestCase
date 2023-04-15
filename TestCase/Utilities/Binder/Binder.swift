//
//  Binder.swift
//  TestCase
//
//  Created by Douglas Hennrich on 15/04/23.
//

import Foundation

class Binder<T> {
  // MARK: Properties
  typealias Listener = ((T) -> Void)

  private(set) var listener: Listener?
  private var justOneFire = false
  var onSetEvents: Int = 0

  // MARK: Computed Variables
  var value: T {
    didSet {
      onSetEvents += 1
      callListener()
    }
  }

  // MARK: Init
  init(_ value: T) {
    self.value = value
  }

  // MARK: Actions
  func bind(listener: Listener?) {
    self.listener = listener
  }

  func bindAndFire(listener: Listener?) {
    self.listener = listener
    callListener()
  }

  func bindOnce(listener: Listener?) {
    justOneFire = true
    self.listener = listener
  }

  func isBinded() -> Bool {
    return listener != nil
  }

  func fire() {
    callListener()
  }

  private func callListener() {
    if Thread.isMainThread {
      listener?(value)

      if justOneFire {
        listener = nil
      }
    } else {
      DispatchQueue.main.async {
        self.listener?(self.value)

        if self.justOneFire {
          self.listener = nil
        }
      }
    }
  }
}
