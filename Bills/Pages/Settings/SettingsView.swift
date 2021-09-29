//
//  SettingsView.swift
//  Bills
//
//  Created by Carlos Eduardo on 29/09/21.
//

import SwiftUI

struct SettingsView: View {
  @StateObject private var settingsVM = SettingsModel()

  var body: some View {
    NavigationView {
      List {
        Section {
          UserCard()
        }
        Section {
          NavigationLink(destination: AboutView()) {
            FeatherIcon(name: "info").foregroundColor(.blue)
            Text("Sobre")
          }
        }
      }
      .navigationTitle("Ajustes")
    }.onAppear {
      settingsVM.handleFetch()
    }.environmentObject(settingsVM)
  }
}

struct SettingsView_Previews: PreviewProvider {
  static var previews: some View {
    SettingsView()
  }
}
