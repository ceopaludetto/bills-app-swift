//
//  HomeView.swift
//  Bills
//
//  Created by Carlos Eduardo on 29/09/21.
//

import SwiftUI

struct HomeView: View {
  @State private var search = ""
  @StateObject private var homeVM = HomeModel()

  var body: some View {
    NavigationView {
      List(homeVM.data?.edges ?? [], id: \.node.id) { item in
        BillCard(item: item.node)
      }
      .toolbar {
        ToolbarItem {
          Button(
            action: {
              print("novo")
            },
            label: {
              FeatherIcon(name: "plus-circle")
            }
          )
        }
      }
      .navigationTitle("Gastos")
    }.onAppear {
      homeVM.handleFetch(after: nil)
    }.searchable(text: $search)
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
  }
}
