//
//  User.swift
//  TestCase
//
//  Created by Douglas Hennrich on 16/04/23.
//

import Foundation

class User {
  // MARK: Properties
  var loginType: LoginTypeEnum

  // MARK: Init
  init(loginType: LoginTypeEnum) {
    self.loginType = loginType
  }
}

// MARK: Init from Login Result
extension User {
  convenience init(from login: LoginResult) {
    self.init(loginType: login.loginType)
  }
}
