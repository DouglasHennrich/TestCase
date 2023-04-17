//
//  
//  RegisterViewDelegate.swift
//  TestCase
//
//  Created by Douglas Hennrich on 16/04/23.
//
//

import Foundation

protocol RegisterViewDelegate: AnyObject {
  func onRegisterButtonAction(email: String?, password: String?)
}
