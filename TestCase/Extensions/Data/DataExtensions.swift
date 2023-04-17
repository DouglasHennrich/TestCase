//
//  DataExtensions.swift
//  TestCase
//
//  Created by Douglas Hennrich on 17/04/23.
//

import Foundation

extension Data {
  func toModel<T: Decodable>() -> T? {
    try? JSONDecoder().decode(T.self, from: self)
  }

  func toJson() -> [String: Any]? {
    try? JSONSerialization.jsonObject(
      with: self,
      options: .allowFragments
    ) as? [String: Any]
  }
}
