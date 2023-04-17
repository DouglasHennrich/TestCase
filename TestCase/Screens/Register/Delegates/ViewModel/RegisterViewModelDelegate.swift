//
//  
//  RegisterViewModelDelegate.swift
//  TestCase
//
//  Created by Douglas Hennrich on 16/04/23.
//
//

import Foundation

protocol RegisterViewModelDelegate: AnyObject {
  var stateView: Binder<UIStateEnum> { get }

  func onRegister(with email: String?, password: String?)
}
