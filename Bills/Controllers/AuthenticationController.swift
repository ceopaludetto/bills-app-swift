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
    isLoggedIn = TokenManager.shared.exists()
  }
  
  func updateValidation(value: Bool) {
    withAnimation {
      isLoggedIn = value
    }
  }
}
