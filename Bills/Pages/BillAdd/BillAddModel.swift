//
//  BillAddModel.swift
//  Bills
//
//  Created by Carlos Eduardo on 30/09/21.
//

import Foundation

class BillAddModel: ObservableObject {
  @Published var input = BillInsertInput(name: "", type: .bankSlip, value: 0)
}
