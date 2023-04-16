//
//  Colors.swift
//  TestCase
//
//  Created by Douglas Hennrich on 15/04/23.
//

import UIKit

enum Colors {}

// MARK: Primary
extension UIColor {
  enum Colors {
    static var background = UIColor(r: 30, g: 30, b: 38)
    static var backgroundDark = UIColor(r: 20, g: 20, b: 28)
    static var primary = UIColor(r: 87, g: 178, b: 181)
    static var label = UIColor(r: 255, g: 255, b: 255)
    static var navBarTitle = UIColor(r: 87, g: 178, b: 181)
  }
}

extension UIColor {
  convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
    self.init(red: r / 255, green: g / 255, blue: b / 255, alpha: 1.0)
  }

  convenience init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {
    self.init(red: r / 255, green: g / 255, blue: b / 255, alpha: a)
  }
}
