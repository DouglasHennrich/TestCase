//
//  RegisterProviderDelegate.swift
//  TestCase
//
//  Created by Douglas Hennrich on 17/04/23.
//

import Foundation

protocol RegisterRepositoryDelegate: AnyObject {
  func register(
    email: String,
    password: String,
    onCompletion completion: @escaping (Result<Data, Error>) -> Void
  )
}
