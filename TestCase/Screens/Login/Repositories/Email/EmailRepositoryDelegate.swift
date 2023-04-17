//
//  EmailRepositoryDelegate.swift
//  TestCase
//
//  Created by Douglas Hennrich on 16/04/23.
//

import Foundation

protocol EmailRepositoryDelegate: AnyObject {
  func login(
    email: String,
    password: String,
    onCompletion completion: @escaping (Result<Data, Error>) -> Void
  )
}
