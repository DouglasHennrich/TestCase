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
  var id: String?
  var token: String?

  // MARK: Init
  init(loginType: LoginTypeEnum, id: String?, token: String?) {
    self.loginType = loginType
    self.id = id
    self.token = token
  }
}

// MARK: Init from Login Result
extension User {
  convenience init(from login: LoginResult) {
    self.init(loginType: login.loginType, id: login.uid, token: login.token)
  }
}

// MARK: Init from Register Result
extension User {
  convenience init(from register: RegisterResult) {
    self.init(loginType: register.loginType, id: register.uid, token: register.token)
  }
}
