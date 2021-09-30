//
//  HomeView.swift
//  Bills
//
//  Created by Carlos Eduardo on 29/09/21.
//

import SwiftUI

struct HomeView: View {
  @State private var search = ""
  @State private var isPresented = false
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
              isPresented = true
            },
            label: {
              FeatherIcon(name: "plus-circle")
            }
          )
        }
      }
      .navigationTitle("Gastos")
    }
    .onAppear {
      homeVM.handleFetch(after: nil)
    }
    .searchable(text: $search, prompt: "Pesquisar")
    .sheet(isPresented: $isPresented) {
      BillAddView()
    }
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
  }
}
