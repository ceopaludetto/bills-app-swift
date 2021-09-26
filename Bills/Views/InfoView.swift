//
//  InfoView.swift
//  Bills
//
//  Created by Carlos Eduardo on 24/09/21.
//

import SwiftUI

struct InfoView: View {
    var body: some View {
      List {
        Link("Twitter", destination: URL(string: "https://twitter.com/ceopaludetto")!)
        Link(
          destination: URL(string: "https://github.com/ceopaludetto")!,
          label: {
            HStack {
              Image(systemName: "chevron.left.slash.chevron.right")
              Text("Github")
            }
          }
        )
      }
        .navigationTitle("Sobre")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
