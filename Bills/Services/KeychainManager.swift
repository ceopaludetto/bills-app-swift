//
//  TokenManager.swift
//  Bills
//
//  Created by Carlos Eduardo on 25/09/21.
//

import Foundation
import KeychainSwift

@objc protocol AuthChangeListener: AnyObject {
  func authStateDidChange(isLogged: Bool)
}

class TokenManager {
  static let access = TokenManager(key: "token")
  static let refresh = TokenManager(key: "refreshtoken")

  private var listeners: [(_ value: Bool) -> Void] = []
  private var keychain: KeychainSwift
  private var key: String

  init(key: String) {
    self.key = key
    keychain = KeychainSwift()
  }

  func addListener(listener: @escaping (_ value: Bool) -> Void) {
    listeners.append(listener)
  }

  func set(token: String) {
    keychain.set(token, forKey: key)
    listeners.forEach { $0(!token.isEmpty) }
  }

  func exists() -> Bool {
    return keychain.get(key) != nil
  }

  func get() -> String? {
    return keychain.get(key)
  }

  func clear() {
    keychain.delete(key)
    listeners.forEach { $0(false) }
  }
}
