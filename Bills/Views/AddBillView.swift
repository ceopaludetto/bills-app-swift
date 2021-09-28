//
//  AddNewView.swift
//  Bills
//
//  Created by Carlos Eduardo on 25/09/21.
//

import SwiftUI

struct AddBillView: View {
  @Environment(\.presentationMode) var presentation
  @EnvironmentObject var billController: BillController

  @State var date = Date()

  func enumToText(type: BillType) -> String {
    switch type {
    case .bankSlip: return "Boleto"
    case .bankInvoice: return "Fatura"
    case .investment: return "Investimento"
    case .salary: return "Salário"
    case .tax: return "Imposto"
    case .transfer: return "Transferência"
    default: return ""
    }
  }

  var body: some View {
    NavigationView {
      Form {
        TextField("Nome", text: $billController.input.name)
        CurrencyTextField("Valor", value: $billController.input.value)
        DatePicker("Data", selection: $date, displayedComponents: .date)
        Picker("Tipo", selection: $billController.input.type) {
          ForEach(BillType.allCases, id: \.self) { type in
            Text(enumToText(type: type)).tag(type)
          }
        }.pickerStyle(.wheel)
      }
      .navigationTitle("Novo")
      .toolbar {
        ToolbarItemGroup(placement: .navigationBarLeading) {
          Button("Cancelar") {
            presentation.wrappedValue.dismiss()
            billController.resetInput()
          }
        }
        ToolbarItemGroup(placement: .navigationBarTrailing) {
          Button("Salvar") {
            billController.handleInsert { res in
              if res {
                presentation.wrappedValue.dismiss()
              }
            }
          }
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
