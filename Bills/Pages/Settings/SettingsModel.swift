//
//  SettingsModel.swift
//  Bills
//
//  Created by Carlos Eduardo on 29/09/21.
//

import Foundation

@MainActor
class SettingsModel: ObservableObject {
  @Published var data: ProfileQuery.Data.Profile?

  func handleFetch() {
    Network.shared.apollo.watch(query: ProfileQuery()) { context in
      switch context {
      case let .success(res):
        if let data = res.data?.profile {
          self.data = data
        }

        return
      case .failure:
        return
      }
    }
  }
}
