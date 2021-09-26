//
//  LoginController.swift
//  Bills
//
//  Created by Carlos Eduardo on 25/09/21.
//

import Foundation
import Apollo

class LoginController: ObservableObject {
  @Published var input = AuthenticationLoginInput(email: "", password: "")
  
  var isDisabled: Bool {
    input.email.isEmpty || input.password.isEmpty
  }
  
  func handleLogin (completion: @escaping (Bool) -> Void) {
    Network.shared.apollo.perform(mutation: LoginMutation(input: input)) { context in
      switch context {
      case .success(let res):
        if res.data?.login != nil {
          completion(true)
        }
        
        if let error = res.errors {
          print("Error from Server: \(error)")
          completion(false)
        }
        
      case .failure (let error):
        print("Error: \(error)")
        completion(false)
      }
    }
  }
}
