//
//  Constans.swift
//  TestCase
//
//  Created by Douglas Hennrich on 16/04/23.
//

import UIKit

enum Constants {
  enum Screen {
    static let width = UIScreen.main.bounds.size.width
    static let height = UIScreen.main.bounds.size.height
    static let maxLength = max(Constants.Screen.width, Constants.Screen.height)
    static let minLength = min(Constants.Screen.width, Constants.Screen.height)
    static let safeAreaTopInsets = UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0
    static let safeAreaBottomInsets = UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 0
    static let tabBarHeight: CGFloat = 49
    static let padding: CGFloat = 24
  }

  enum DeviceTypes {
    static let idiom = UIDevice.current.userInterfaceIdiom
    static let nativeScale = UIScreen.main.nativeScale
    static let scale = UIScreen.main.scale

    static let isiPhoneSE = idiom == .phone && Constants.Screen.maxLength == 568.0
    static let isiPhone8Standard = idiom == .phone &&
    Constants.Screen.maxLength == 667.0 &&
    nativeScale == scale

    static let isiPhone8Zoomed = idiom == .phone &&
    Constants.Screen.maxLength == 667.0 &&
    nativeScale > scale

    static let isiPhone8PlusStandard = idiom == .phone &&
    Constants.Screen.maxLength == 736.0

    static let isiPhone8PlusZoomed = idiom == .phone &&
    Constants.Screen.maxLength == 736.0 &&
    nativeScale < scale

    static let isiPhoneX = idiom == .phone && Constants.Screen.maxLength == 812.0
    static let isiPhoneXsMaxAndXr = idiom == .phone && Constants.Screen.maxLength == 896.0
    static let isiPad = idiom == .pad && Constants.Screen.maxLength >= 1024.0

    static func isiPhoneXAspectRatio() -> Bool {
      return isiPhoneX || isiPhoneXsMaxAndXr
    }

    static func isiPhoneSESize() -> Bool {
      return DeviceTypes.isiPhoneSE || DeviceTypes.isiPhone8Zoomed
    }
  }

  enum Notification {
    static let refreshWorkouts = NSNotification.Name("refreshWorkouts")
  }

  enum UserDefaults {
    static let userId = "userId"
  }
}
