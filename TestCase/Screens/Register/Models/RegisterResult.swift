//
//  RegisterResult.swift
//  TestCase
//
//  Created by Douglas Hennrich on 16/04/23.
//

import Foundation

class RegisterResult {
  // MARK: Properties
  var email: String?
  var token: String?
  var loginType: LoginTypeEnum

  // MARK: Init
  init(
    email: String? = nil,
    token: String? = nil,
    loginType: LoginTypeEnum
  ) {
    self.email = email
    self.token = token
    self.loginType = loginType
  }
}
