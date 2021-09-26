//
//  LoginView.swift
//  Bills
//
//  Created by Carlos Eduardo on 25/09/21.
//

import SwiftUI

struct LoginView: View {
  @EnvironmentObject private var authenticationController: AuthenticationController
  @StateObject private var loginController = LoginController()
  
  var body: some View {
    NavigationView {
      Form {
        TextField("E-mail", text: $loginController.input.email).keyboardType(.emailAddress).autocapitalization(.none)
        SecureField("Senha", text: $loginController.input.password)
      }
      .navigationTitle("Bem Vindo")
      .toolbar {
        ToolbarItemGroup(placement: .navigationBarTrailing) {
          Button("Entrar") {
            loginController.handleLogin { res in
              print(res)
              authenticationController.updateValidation(value: res)
            }
          }.disabled(loginController.isDisabled)
        }
      }
    }
  }
}

struct LoginView_Previews: PreviewProvider {
  static var previews: some View {
    LoginView()
  }
}
