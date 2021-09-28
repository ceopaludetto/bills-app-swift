//
//  BillController.swift
//  Bills
//
//  Created by Carlos Eduardo on 25/09/21.
//

import Apollo
import Foundation

class BillController: ObservableObject {
  @Published var input = BillInsertInput(name: "", type: BillType.bankInvoice, value: 0)
  @Published var data: GetBillsQuery.Data.GetBillsPerMonth?
  @Published var watcher: GraphQLQueryWatcher<GetBillsQuery>?

  func handleFetch(after: String? = nil) {
    watcher = Network.shared.apollo.watch(query: GetBillsQuery(after: after)) { context in
      switch context {
      case let .success(res):
        if let data = res.data?.getBillsPerMonth {
          DispatchQueue.main.async {
            if self.data != nil {
              self.data!.edges.append(contentsOf: data.edges)
              let items = self.data!.edges.enumerated().filter { item in
                item.offset == self.data!.edges.firstIndex { $0.node.id == item.element.node.id }
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
      case let .failure(error):
        print("Error: \(error)")
      }
    }
  }

  func handleInsert(conform: @escaping (Bool) -> Void) {
    Network.shared.apollo.perform(mutation: SaveBillMutation(input: input)) { context in
      switch context {
      case let .success(res):
        if let data = res.data?.saveBill {
          conform(true)
          self.resetInput()
        }
        if let error = res.errors {
          print("Error from server: \(error)")
          conform(false)
        }

      case let .failure(error):
        print("Error \(error)")
        conform(false)
      }
    }
  }

  func cancelWatcher() {
    watcher?.cancel()
  }

  func resetInput() {
    input = BillInsertInput(name: "", type: BillType.bankInvoice, value: 0)
  }
}
