//
//  FeatherIcon.swift
//  Bills
//
//  Created by Carlos Eduardo on 27/09/21.
//

import SwiftUI

struct FeatherIcon: View {
  @EnvironmentObject var featherModel: FeatherModel

  var name: String
  var size = CGFloat(22)

  var body: some View {
    Text(featherModel.fromName(name: name)).font(.custom("Feather", size: size))
  }
}

struct FeatherIcon_Previews: PreviewProvider {
  static var previews: some View {
    FeatherIcon(name: "heart")
  }
}
