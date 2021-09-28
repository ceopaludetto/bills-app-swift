//
//  Currency.swift
//  Bills
//
//  Created by Carlos Eduardo on 25/09/21.
//

import Foundation

class CurrencyUtil {
  static let current = CurrencyUtil()
  private let formatter: NumberFormatter
  private let editingFormatter: NumberFormatter

  init() {
    formatter = NumberFormatter()
    formatter.locale = Locale.current
    formatter.numberStyle = .currency

    editingFormatter = NumberFormatter()
    editingFormatter.locale = Locale.current
    editingFormatter.numberStyle = .decimal
  }

  func display(value: Int) -> String {
    let price = formatter.string(from: NSNumber(value: value / 100))!
    let sign = value >= 0 ? "+" : "-"

    return "\(sign) \(price.replacingOccurrences(of: "-", with: ""))"
  }

  func format(isEditing: Bool) -> NumberFormatter {
    if isEditing { return editingFormatter }
    return formatter
  }
}
