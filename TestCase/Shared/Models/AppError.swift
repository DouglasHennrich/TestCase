//
//  AppError.swift
//  TestCase
//
//  Created by Douglas Hennrich on 17/04/23.
//

import Foundation

enum AppError: Error {
  case noUserFound
  case missingParameters

  case unknow(message: String?)

  // MARK: Computed Variables
  var message: String {
    switch self {
      case .noUserFound:
        return "Nenhum usuário encontrado"

      case .missingParameters:
        return "Campos faltando"

      case .unknow(let message):
        return message ?? "Erro inesperado"
    }
  }

  // MARK: Init
  init(withMessage message: String) {
    self = .unknow(message: message)
  }

  init(error: Error?) {
    guard let errorMessage = error?.localizedDescription else {
      self = .unknow(message: nil)
      return
    }

    self = .unknow(message: errorMessage)
  }
}
