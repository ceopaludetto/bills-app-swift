//
//  BillInfoView.swift
//  Bills
//
//  Created by Carlos Eduardo on 29/09/21.
//

import SwiftUI

struct BillInfoView: View {
  var item: GetBillsQuery.Data.GetBillsPerMonth.Edge.Node

  var body: some View {
    List {
      Text(CurrencyUtil.current.display(value: item.value))
    }
    .toolbar {
      ToolbarItem {
        Button(
          action: {
            print("delete")
          },
          label: {
            FeatherIcon(name: "trash-2")
          }
        )
      }
    }
    .navigationTitle(item.name)
  }
}

//
// struct BillInfoView_Previews: PreviewProvider {
//    static var previews: some View {
//        BillInfoView()
//    }
// }
