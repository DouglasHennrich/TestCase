//
//  EncodableExtensions.swift
//  TestCase
//
//  Created by Douglas Hennrich on 17/04/23.
//

import Foundation

extension Encodable {
  func toData() -> Data? {
    try? JSONEncoder().encode(self)
  }

  func toJson() -> [String: Any]? {
    guard let data = toData() else {
      return nil
    }

    return try? JSONSerialization.jsonObject(
      with: data,
      options: .allowFragments
    ) as? [String: Any]
  }
}
