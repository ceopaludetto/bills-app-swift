//
//  LoginDTO.swift
//  Bills
//
//  Created by Carlos Eduardo on 29/09/21.
//

import Foundation

enum Fields: Hashable {
  case email
  case password
}

class LoginDTO: ObservableObject {
  @Published var input = AuthenticationLoginInput(email: "", password: "")

  func validate() -> Fields? {
    if !Validators.email(value: input.email) { return .email }
    if !Validators.password(value: input.password) { return .password }

    return nil
  }
}
