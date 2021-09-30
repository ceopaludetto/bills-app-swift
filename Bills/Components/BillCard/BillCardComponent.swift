//
//  BillCard.swift
//  Bills
//
//  Created by Carlos Eduardo on 29/09/21.
//

import SwiftUI

let icons: [BillType: String] = [
  .bankInvoice: "credit-card",
  .salary: "dollar-sign",
  .tax: "frown",
  .investment: "bar-chart-2",
  .transfer: "corner-down-right",
  .bankSlip: "file-text",
]

struct BillCard: View {
  var item: GetBillsQuery.Data.GetBillsPerMonth.Edge.Node

  var body: some View {
    NavigationLink(destination: BillInfoView(item: item)) {
      FeatherIcon(name: icons[item.type]!, size: 24)
      VStack(alignment: .leading) {
        Text(item.name)
        Text(CurrencyFormatterUtil.display(value: item.value)).font(.title3).foregroundColor(item.value >= 0 ? .green : .red)
      }
      .badge(DateFormatterUtil.display(value: item.createdAt))
    }
    .padding(.vertical, 4)
  }
}

// struct BillCard_Previews: PreviewProvider {
//    static var previews: some View {
//      BillCard(item: nil)
//    }
// }
