//
//  AddNewView.swift
//  Bills
//
//  Created by Carlos Eduardo on 25/09/21.
//

import SwiftUI

struct AddBillView: View {
  @Environment(\.presentationMode) var presentation

  @State var name = ""
  @State var date = Date()

  var body: some View {
    NavigationView {
      Form {
        TextField("Nome", text: $name)
        DatePicker("Data", selection: $date, displayedComponents: .date)
      }
      .navigationTitle("Novo")
      .toolbar {
        ToolbarItemGroup(placement: .navigationBarLeading) {
          Button("Cancelar") {
            presentation.wrappedValue.dismiss()
          }
        }
        ToolbarItemGroup(placement: .navigationBarTrailing) {
          Button("Salvar") {}
        }
      }
    }.accentColor(.purple)
  }
}

struct AddNewView_Previews: PreviewProvider {
  static var previews: some View {
    AddBillView()
  }
}
