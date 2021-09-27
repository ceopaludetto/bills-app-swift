//
//  ContentView.swift
//  Bills
//
//  Created by Carlos Eduardo on 24/09/21.
//

import SwiftUI

struct ContentView: View {
  @StateObject private var authenticationController = AuthenticationController()

  var body: some View {
    if !authenticationController.isLoggedIn {
      LoginView().accentColor(.purple).environmentObject(authenticationController)
    } else {
      TabView {
        HomeView().tabItem {
          Image(systemName: "dollarsign.circle")
          Text("Contas")
        }
        ChartView().tabItem {
          Image(systemName: "chart.pie")
          Text("Gráficos")
        }
        SettingsView().tabItem {
          Image(systemName: "gear")
          Text("Ajustes")
        }
      }.accentColor(.purple).environmentObject(authenticationController)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
