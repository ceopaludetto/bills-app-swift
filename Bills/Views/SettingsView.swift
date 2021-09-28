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
              Image(systemName: "person.crop.circle.fill").font(.title).foregroundColor(.gray)
              VStack(alignment: .leading) {
                Text(profileController.user!.fullName).font(.body).padding(.top, 4)
                Text(profileController.user!.email).font(.footnote).foregroundColor(.gray).padding(.bottom, 4)
              }
            }
          }
        }
        Section {
          NavigationLink(destination: AboutView()) {
            Label(title: { Text("Sobre") }, icon: { FeatherIcon(name: "info").foregroundColor(.blue) })
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
