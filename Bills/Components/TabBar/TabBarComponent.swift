//
//  TabBar.swift
//  Bills
//
//  Created by Carlos Eduardo on 27/09/21.
//

import SwiftUI

struct TabBar: View {
  var body: some View {
    TabView {
      HomeView().tabItem {
        Image(systemName: "dollarsign.circle")
        Text("Gastos")
      }
      SettingsView().tabItem {
        Image(systemName: "slider.vertical.3")
        Text("Ajustes")
      }
    }
  }
}

struct TabBar_Previews: PreviewProvider {
  static var previews: some View {
    TabBar()
  }
}
