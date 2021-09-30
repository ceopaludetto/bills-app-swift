//
//  BillAddView.swift
//  Bills
//
//  Created by Carlos Eduardo on 30/09/21.
//

import SwiftUI

let items: [BillType: String] = [
  .bankSlip: "Boleto",
  .bankInvoice: "Fatura",
  .tax: "Imposto",
  .investment: "Investimento",
  .transfer: "Transferência",
  .salary: "Salário",
]

struct BillAddView: View {
  @Environment(\.dismiss) var dismiss
  @StateObject var billAddVM = BillAddModel()

  var body: some View {
    NavigationView {
      Form {
        Picker("Tipo", selection: $billAddVM.input.type) {
          ForEach(BillType.allCases, id: \.self) { item in
            Text(items[item]!).tag(item)
          }
        }.pickerStyle(.wheel)
        TextField("Nome", text: $billAddVM.input.name)
        TextField("Valor", value: $billAddVM.input.value, format: .currency(code: "BRL"))
      }
      .navigationTitle("Novo")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItemGroup(placement: .navigationBarLeading) {
          Button("Cancelar") {
            dismiss()
          }
        }
        ToolbarItemGroup(placement: .navigationBarTrailing) {
          Button("Salvar") {
            print("criar")
          }
        }
      }
    }.accentColor(.purple)
  }
}

struct BillAddView_Previews: PreviewProvider {
  static var previews: some View {
    BillAddView()
  }
}
