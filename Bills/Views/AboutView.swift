//
//  InfoView.swift
//  Bills
//
//  Created by Carlos Eduardo on 24/09/21.
//

import SwiftUI

struct AboutView: View {
  let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String

  var body: some View {
    List {
      Section {
        HStack {
          Text("Versão")
          Spacer()
          Text(version!).foregroundColor(.gray)
        }
      }
      Section {
        Link(destination: URL(string: "https://twitter.com/soreduard")!, label: { Label(title: { Text("Twitter") }, icon: { FeatherIcon(name: "twitter") }) })
        Link(destination: URL(string: "https://github.com/ceopaludetto")!, label: { Label(title: { Text("Github") }, icon: { FeatherIcon(name: "code") }) })
      }
    }
    .navigationTitle("Sobre")
    .navigationBarTitleDisplayMode(.inline)
  }
}

struct InfoView_Previews: PreviewProvider {
  static var previews: some View {
    AboutView()
  }
}
