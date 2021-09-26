//
//  BillController.swift
//  Bills
//
//  Created by Carlos Eduardo on 25/09/21.
//

import Foundation

class BillController: ObservableObject {
  @Published var input = BillInsertInput(name: "", type: BillType.bankInvoice, value: 0)
  @Published var data: GetBillsQuery.Data.GetBillsPerMonth?
  
  func handleFetch(after: String? = nil) {
    Network.shared.apollo.fetch(query: GetBillsQuery(after: after)) { context in
      switch context {
      case .success(let res):
        if let data = res.data?.getBillsPerMonth {
          DispatchQueue.main.async {
            if self.data != nil {
              self.data!.edges.append(contentsOf: data.edges)
              let items = self.data!.edges.enumerated().filter { item in
                return item.offset == self.data!.edges.firstIndex { $0.node.id == item.element.node.id }
              }
              
              self.data!.edges = items.map { item in item.element }
            } else {
              self.data = data
            }
          }
        }
        
        if let error = res.errors {
          print("Error from server: \(error)")
        }
      case .failure(let error):
        print("Error: \(error)")
      }
    }
  }
}
