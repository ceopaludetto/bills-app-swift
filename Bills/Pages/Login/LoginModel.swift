//
//  LoginModel.swift
//  Bills
//
//  Created by Carlos Eduardo on 29/09/21.
//

import Foundation

class LoginModel: ObservableObject {
  @Published var errorMessage: String?

  func handleLogin(input: AuthenticationLoginInput) {
    Network.shared.apollo.perform(mutation: LoginMutation(input: input)) { context in
      switch context {
      case let .success(res):
        if let error = res.errors {
          self.errorMessage = "Falha ao realizar Login"
        }
        return
      case let .failure(error):
        self.errorMessage = "Falha ao realizar Login"
      }
    }
  }
}
