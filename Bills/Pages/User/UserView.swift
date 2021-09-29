//
//  UserView.swift
//  Bills
//
//  Created by Carlos Eduardo on 29/09/21.
//

import SwiftUI

struct UserView: View {
  @EnvironmentObject private var settingsVM: SettingsModel

  var body: some View {
    List {
      Button(
        action: {
          Network.shared.apollo.clearCache()
          TokenManager.access.clear()
          TokenManager.refresh.clear()
        },
        label: {
          Text("Finalizar Sessão").frame(maxWidth: .infinity, alignment: .center)
        }
      ).accentColor(.red)
    }
    .navigationTitle(settingsVM.data!.fullName)
  }
}

struct UserView_Previews: PreviewProvider {
  static var previews: some View {
    UserView()
  }
}
