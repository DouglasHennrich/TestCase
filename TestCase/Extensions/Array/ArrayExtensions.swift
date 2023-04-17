//
//  ArrayExtensions.swift
//  TestCase
//
//  Created by Douglas Hennrich on 17/04/23.
//

import Foundation

extension Array {
  func at(_ index: Int) -> Element? {
    return 0 <= index && index < count ? self[index] : nil
  }

  var isNotEmpty: Bool {
    !self.isEmpty
  }
}
