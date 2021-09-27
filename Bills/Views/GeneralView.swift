//
//  GeneralView.swift
//  Bills
//
//  Created by Carlos Eduardo on 24/09/21.
//

import SwiftUI

struct GeneralView: View {
  @StateObject private var generalController = GeneralController()
  @EnvironmentObject private var authenticationController: AuthenticationController

  var body: some View {
    Form {
//      if profileController.user != nil {
//        Section {
//          TextField("Nome", text: profileController.user!.firstName)
//          TextField("Sobrenome", text: profileController.user!.lastName)
//        }
//      }
      Section {
        Button(
          action: {
            TokenManager.access.clear()
            Network.shared.apollo.clearCache()
          },
          label: {
            Text("Finalizar Sessão").frame(maxWidth: .infinity, alignment: .center)
          }
        ).accentColor(.red)
      }
    }
    .navigationTitle("Geral")
    .navigationBarTitleDisplayMode(.inline)
  }
}

struct GeneralView_Previews: PreviewProvider {
  static var previews: some View {
    GeneralView()
  }
}
