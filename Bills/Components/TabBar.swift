//
//  TabBar.swift
//  Bills
//
//  Created by Carlos Eduardo on 27/09/21.
//

import SwiftUI

struct TabBar: View {
  init() {
    UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Feather", size: 22)!], for: .normal)
  }

  var body: some View {
    TabView {
      HomeView().tabItem {
        FeatherIcon(name: "home")
      }
      ChartView().tabItem {
        FeatherIcon(name: "pie-chart")
      }
      SettingsView().tabItem {
        FeatherIcon(name: "sliders")
      }
    }
  }
}

struct TabBar_Previews: PreviewProvider {
  static var previews: some View {
    TabBar()
  }
}
