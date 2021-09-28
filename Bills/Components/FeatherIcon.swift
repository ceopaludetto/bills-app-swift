//
//  FeatherIcon.swift
//  Bills
//
//  Created by Carlos Eduardo on 27/09/21.
//

import SwiftUI

struct FeatherIcon: View {
  @EnvironmentObject var featherController: FeatherController

  var size = CGFloat(22)
  var name: String

  var body: some View {
    Text(featherController.fromName(name: name)).font(.custom("Feather", size: size))
  }
}

struct FeatherIcon_Previews: PreviewProvider {
  static var previews: some View {
    FeatherIcon(name: "heart")
  }
}
