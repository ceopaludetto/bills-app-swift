//
//  LoginView.swift
//  Bills
//
//  Created by Carlos Eduardo on 29/09/21.
//

import SwiftUI

struct LoginView: View {
  @StateObject private var loginDTO = LoginDTO()
  @StateObject private var loginVM = LoginModel()

  @FocusState private var focused: Fields?

  func handleSubmit() {
    let focus = loginDTO.validate()
    if focus != nil {
      if focus != focused {
        focused = focus
      }
    } else {
      loginVM.handleLogin(input: loginDTO.input)
      focused = nil
    }
  }

  var body: some View {
    NavigationView {
      Form {
        TextField("E-mail", text: $loginDTO.input.email)
          .autocapitalization(.none)
          .keyboardType(.emailAddress)
          .focused($focused, equals: .email)
          .submitLabel(.next)
          .onSubmit {
            focused = .password
          }
        SecureField("Senha", text: $loginDTO.input.password)
          .focused($focused, equals: .password)
          .submitLabel(.done)
          .onSubmit {
            handleSubmit()
          }
      }
      .toolbar {
        ToolbarItem {
          Button("Entrar") {
            handleSubmit()
          }
        }
      }
      .navigationTitle("Bem vindo")
    }
  }
}

struct LoginView_Previews: PreviewProvider {
  static var previews: some View {
    LoginView()
  }
}
