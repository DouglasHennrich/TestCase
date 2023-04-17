//
//  DictionaryExtensions.swift
//  TestCase
//
//  Created by Douglas Hennrich on 17/04/23.
//

import Foundation

extension Dictionary {
  var isNotEmpty: Bool { !isEmpty }

  func toData() -> Data? {
    try? JSONSerialization.data(
      withJSONObject: self,
      options: .fragmentsAllowed
    )
  }
}
