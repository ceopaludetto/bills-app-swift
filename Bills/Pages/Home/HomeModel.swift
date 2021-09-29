//
//  HomeModel.swift
//  Bills
//
//  Created by Carlos Eduardo on 29/09/21.
//

import Foundation

@MainActor
class HomeModel: ObservableObject {
  @Published var data: GetBillsQuery.Data.GetBillsPerMonth?

  func handleFetch(after: String?) {
    Network.shared.apollo.watch(query: GetBillsQuery(after: after)) { context in
      switch context {
      case let .success(res):
        if let data = res.data?.getBillsPerMonth {
          self.data = data
        }
      case .failure:
        return
      }
    }
  }
}
