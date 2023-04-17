//
//  UIViewExtension.swift
//  TestCase
//
//  Created by Douglas Hennrich on 16/04/23.
//

import UIKit

// MARK: Identifier
extension UIView {
  class var identifier: String {
    return String(describing: self)
  }
}

// MARK: Loading
extension UIView {
  func startLoader(message: String? = nil) {
    let viewLoading = UIView(frame: self.frame)
    viewLoading.tag = 99999
    viewLoading.backgroundColor = .Colors.background.withAlphaComponent(0.6)
    viewLoading.center = self.center

    let loader = UIActivityIndicatorView(style: .large)
    loader.startAnimating()
    loader.center = viewLoading.center
    loader.color = .Colors.primary
    viewLoading.addSubview(loader)

    addSubview(viewLoading)
    bringSubviewToFront(viewLoading)
  }

  func stopLoader() {
    subviews.forEach { view in
      if view.tag == 99999 {
        view.removeFromSuperview()
      }
    }
  }
}
