//
//  SettingsView.swift
//  Bills
//
//  Created by Carlos Eduardo on 24/09/21.
//

import SwiftUI

struct SettingsView: View {
  @StateObject private var profileController = ProfileController()

  var body: some View {
    NavigationView {
      List {
        if profileController.user != nil {
          Section {
            NavigationLink(destination: GeneralView().environmentObject(profileController)) {
              Image(systemName: "info.circle").clipShape(Circle())
              VStack(alignment: .leading) {
                Text(profileController.user!.fullName).font(.body).padding(.top, 4)
                Text(profileController.user!.email).font(.footnote).foregroundColor(.gray).padding(.bottom, 4)
              }
            }
          }
        }
        Section {
          NavigationLink(destination: InfoView()) {
            Image(systemName: "info.circle.fill").foregroundColor(.blue)
            Text("Sobre")
          }
        }
      }
      .navigationTitle(Text("Ajustes"))
      .onAppear(perform: profileController.handleFetch)
    }
  }
}

struct SettingsView_Previews: PreviewProvider {
  static var previews: some View {
    SettingsView()
  }
}
