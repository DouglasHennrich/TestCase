//
//  
//  RegisterNavigationDelegate.swift
//  TestCase
//
//  Created by Douglas Hennrich on 16/04/23.
//
//

import Foundation

protocol RegisterNavigationDelegate: AnyObject {
  func removeRegisterViewModelReference()
  func onRegisterSuccess()
}
