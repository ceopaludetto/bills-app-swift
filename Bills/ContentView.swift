//
//  ContentView.swift
//  Bills
//
//  Created by Carlos Eduardo on 24/09/21.
//

import SwiftUI

struct ContentView: View {
  @StateObject private var featherModel = FeatherModel()
  @StateObject private var authModel = AuthenticationModel()

  var body: some View {
    Group {
      if !authModel.logged {
        LoginView()
      } else {
        TabBar()
      }
    }.accentColor(.purple).environmentObject(featherModel).environmentObject(authModel)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
