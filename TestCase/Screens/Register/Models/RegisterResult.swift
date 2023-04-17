//
//  RegisterResult.swift
//  TestCase
//
//  Created by Douglas Hennrich on 16/04/23.
//

import Foundation

class RegisterResult: Codable {
  // MARK: Properties
  var uid: String?
  var email: String?
  var token: String?
  var loginType: LoginTypeEnum

  // MARK: Init
  init(
    uid: String? = nil,
    email: String? = nil,
    token: String? = nil,
    loginType: LoginTypeEnum
  ) {
    self.uid = uid
    self.email = email
    self.token = token
    self.loginType = loginType
  }
}
