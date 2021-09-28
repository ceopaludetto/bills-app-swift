//
//  BillView.swift
//  Bills
//
//  Created by Carlos Eduardo on 25/09/21.
//

import SwiftUI

struct BillView: View {
  var item: GetBillsQuery.Data.GetBillsPerMonth.Edge?

  var body: some View {
    List {
      HStack {
        Text("Nome").font(.body)
        Spacer()
        Text(item!.node.name).font(.body).foregroundColor(.gray)
      }
      HStack {
        Text("Valor").font(.body)
        Spacer()
        Text(CurrencyUtil.current.display(value: item!.node.value)).font(.body).foregroundColor(.gray)
      }
      HStack {
        Text("Data").font(.body)
        Spacer()
        Text(DateUtil.current.format(value: item!.node.createdAt)).font(.body).foregroundColor(.gray)
      }
    }
    .navigationTitle(item!.node.name)
    .toolbar {
      ToolbarItemGroup(placement: .navigationBarTrailing) {
        Button(
          action: { print("oi") },
          label: { FeatherIcon(name: "trash-2") }
        )
      }
    }
  }
}

struct BillView_Previews: PreviewProvider {
  static var previews: some View {
    BillView(item: nil)
  }
}
