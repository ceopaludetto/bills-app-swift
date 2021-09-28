//
//  ContentView.swift
//  Bills
//
//  Created by Carlos Eduardo on 24/09/21.
//

import SwiftUI

struct ContentView: View {
  @StateObject private var authenticationController = AuthenticationController()
  @StateObject private var featherController = FeatherController()

  var body: some View {
    if !authenticationController.isLoggedIn {
      LoginView().accentColor(.purple).environmentObject(authenticationController).environmentObject(featherController)
    } else {
      TabBar().accentColor(.purple).environmentObject(authenticationController).environmentObject(featherController)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
