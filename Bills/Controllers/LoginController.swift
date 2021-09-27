//
//  LoginController.swift
//  Bills
//
//  Created by Carlos Eduardo on 25/09/21.
//

import Apollo
import Foundation

class LoginController: ObservableObject {
  @Published var input = AuthenticationLoginInput(email: "", password: "")

  var isDisabled: Bool {
    input.email.isEmpty || input.password.isEmpty
  }

  func handleLogin() {
    Network.shared.apollo.perform(mutation: LoginMutation(input: input)) { context in
      switch context {
      case let .success(res):
        if res.data?.login != nil {
          print("Success")
        }

        if let error = res.errors {
          print("Error from Server: \(error)")
        }

      case let .failure(error):
        print("Error: \(error)")
      }
    }
  }
}
