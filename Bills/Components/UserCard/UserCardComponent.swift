//
//  UserCard.swift
//  Bills
//
//  Created by Carlos Eduardo on 29/09/21.
//

import SwiftUI

struct UserCard: View {
  @EnvironmentObject private var settingsVM: SettingsModel

  var body: some View {
    NavigationLink(destination: UserView()) {
      HStack(alignment: .center) {
        Image(systemName: "person.crop.circle.fill").foregroundColor(.secondary).font(.largeTitle)
        VStack(alignment: .leading) {
          Text(settingsVM.data?.fullName ?? "").font(.title2)
          Text(settingsVM.data?.email ?? "").foregroundColor(.secondary).font(.subheadline)
        }
      }
    }
  }
}

struct UserCard_Previews: PreviewProvider {
  static var previews: some View {
    UserCard()
  }
}
