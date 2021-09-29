//
//  BillCard.swift
//  Bills
//
//  Created by Carlos Eduardo on 29/09/21.
//

import SwiftUI

struct BillCard: View {
  private let icon: [BillType: String] = [
    .bankInvoice: "credit-card",
    .salary: "dollar-sign",
    .tax: "frown",
    .investment: "bar-chart-2",
    .transfer: "corner-down-right",
    .bankSlip: "file-text",
  ]
  var item: GetBillsQuery.Data.GetBillsPerMonth.Edge.Node

  var body: some View {
    NavigationLink(destination: BillInfoView(item: item)) {
      HStack(alignment: .center, spacing: 10) {
        FeatherIcon(name: icon[item.type]!, size: 24)
        VStack(alignment: .leading) {
          Text(item.name)
          Text(CurrencyUtil.current.display(value: item.value)).font(.title3).foregroundColor(item.value >= 0 ? .green : .red)
        }
        Spacer()
        Text(DateUtil.current.format(value: item.createdAt)).font(.callout).foregroundColor(.gray)
      }
    }
    .padding(.vertical, 4)
  }
}

// struct BillCard_Previews: PreviewProvider {
//    static var previews: some View {
//      BillCard(item: nil)
//    }
// }
