//
//  AboutView.swift
//  Bills
//
//  Created by Carlos Eduardo on 29/09/21.
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
          Text(version!).foregroundColor(.gray).font(.callout)
        }
      }
      Section {
        Link(
          destination: URL(string: "http://twitter.com/soreduard")!,
          label: {
            HStack {
              FeatherIcon(name: "twitter")
              Text("Twitter")
            }
          }
        )
        Link(
          destination: URL(string: "https://github.com/ceopaludetto/bills-app-swift")!,
          label: {
            HStack {
              FeatherIcon(name: "code")
              Text("Código")
            }
          }
        )
      }
    }
    .navigationTitle("Sobre")
  }
}

struct AboutView_Previews: PreviewProvider {
  static var previews: some View {
    AboutView()
  }
}
