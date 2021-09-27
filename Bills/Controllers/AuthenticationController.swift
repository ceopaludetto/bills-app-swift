//
//  AuthenticationController.swift
//  Bills
//
//  Created by Carlos Eduardo on 25/09/21.
//

import Foundation
import SwiftUI

class AuthenticationController: ObservableObject {
  @Published var isLoggedIn = false

  init() {
    isLoggedIn = TokenManager.access.exists()
    TokenManager.access.addListener { value in
      self.updateValidation(value: value)
    }
  }

  private func updateValidation(value: Bool) {
    withAnimation {
      isLoggedIn = value
    }
  }
}
