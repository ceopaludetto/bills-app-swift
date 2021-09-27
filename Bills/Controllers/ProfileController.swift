//
//  ProfileController.swift
//  Bills
//
//  Created by Carlos Eduardo on 25/09/21.
//

import Foundation

class ProfileController: ObservableObject {
  @Published var user: ProfileQuery.Data.Profile?

  func handleFetch() {
    Network.shared.apollo.fetch(query: ProfileQuery()) { context in
      switch context {
      case let .success(res):
        if let data = res.data {
          DispatchQueue.main.async {
            self.user = data.profile
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
}
