//
//  AppleAuthenticationUseCaseDelegate.swift
//  TestCase
//
//  Created by Douglas Hennrich on 16/04/23.
//

import Foundation

protocol AppleAuthenticationUseCaseDelegate: AnyObject {
  func execute(_ request: AppleAuthenticationUseCaseDTO)
}
