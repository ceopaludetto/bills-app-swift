//
//  AuthModel.swift
//  Bills
//
//  Created by Carlos Eduardo on 29/09/21.
//

import Foundation
import SwiftUI

class AuthenticationModel: ObservableObject {
  @Published var logged = TokenManager.access.exists()

  init() {
    TokenManager.access.addListener(
      listener: { value in
        withAnimation {
          self.logged = value
        }
      }
    )
  }
}
