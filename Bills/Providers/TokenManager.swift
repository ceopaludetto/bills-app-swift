//
//  TokenManager.swift
//  Bills
//
//  Created by Carlos Eduardo on 25/09/21.
//

import Foundation
import KeychainSwift

class TokenManager {
  static private var key = "token"
  static let shared = TokenManager()
  
  private var keychain = KeychainSwift()
  
  func set(token: String) -> Void {
    self.keychain.set(token, forKey: TokenManager.key)
  }
  
  func exists() -> Bool {
    return self.keychain.get(TokenManager.key) != nil
  }
  
  func get() -> String? {
    return self.keychain.get(TokenManager.key)
  }
  
  func clear() -> Bool {
    return self.keychain.delete(TokenManager.key)
  }
}
