//
//  TokenManager.swift
//  Bills
//
//  Created by Carlos Eduardo on 25/09/21.
//

import Foundation
import KeychainSwift

class TokenManager {
  private static var key = "token"
  static let shared = TokenManager()

  private var keychain = KeychainSwift()

  func set(token: String) {
    keychain.set(token, forKey: TokenManager.key)
  }

  func exists() -> Bool {
    return keychain.get(TokenManager.key) != nil
  }

  func get() -> String? {
    return keychain.get(TokenManager.key)
  }

  func clear() -> Bool {
    return keychain.delete(TokenManager.key)
  }
}
