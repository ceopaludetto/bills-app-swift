//
//  HomeView.swift
//  Bills
//
//  Created by Carlos Eduardo on 24/09/21.
//

import SwiftUI

struct HomeView: View {
  @State var showSheet = false
  @State var search = ""
  @StateObject var billController = BillController()
  
  var body: some View {
    NavigationView {
      List(billController.data?.edges ?? [], id: \.node.id) { item in
        NavigationLink(destination: BillView(item: item)) {
          HStack {
            VStack(alignment: .leading) {
              Text(item.node.name).font(.body)
              Text(DateUtil.current.format(value: item.node.createdAt)).font(.footnote).foregroundColor(.gray)
            }
            Spacer()
            Text(CurrencyUtil.current.format(value: item.node.value)).font(.title2).foregroundColor(item.node.value < 0 ? .red : .green).onAppear {
              if item.cursor == billController.data?.pageInfo.endCursor {
                let after = billController.data!.pageInfo.endCursor
                billController.handleFetch(after: after)
              }
            }
          }.padding(.vertical, 2)
        }
      }
      .searchable(text: $search)
      .navigationTitle(Text("Início"))
      .toolbar {
        ToolbarItemGroup(placement: .navigationBarTrailing) {
          Button(
            action: { showSheet = true },
            label: { Image(systemName: "plus.circle") }
          )
        }
      }
    }
    .sheet(isPresented: $showSheet) {
      AddBillView()
    }
    .onAppear(perform: {
      billController.handleFetch()
    })
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
  }
}
