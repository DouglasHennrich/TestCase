//
//  UIImageView.swift
//  TestCase
//
//  Created by Douglas Hennrich on 18/04/23.
//

import UIKit
import Kingfisher

extension UIImageView {
  func setImage(
    _ imageStringOpt: String?,
    placeholder: UIImage? = nil,
    onCompletion completion: ((RetrieveImageResult?) -> Void)? = nil
  ) {
    guard let imageString = imageStringOpt,
          let escapedString = imageString.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
    else {
      image = placeholder
      completion?(nil)
      return
    }

    kf.setImage(
      with: URL(string: escapedString),
      placeholder: placeholder,
      options: [
        .progressiveJPEG(ImageProgressive(isBlur: false, isFastestScan: false, scanInterval: 0.1)),
      ],
      completionHandler: { [weak self] result in
        guard let self = self else { return }

        if case .success(let imageSuccess) = result {
          completion?(imageSuccess)
        } else {
          self.image = placeholder
          completion?(nil)
        }
      })
  }
}
