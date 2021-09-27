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

  init() {
    formatter = NumberFormatter()
    formatter.locale = Locale.current
    formatter.numberStyle = .currency
  }

  func format(value: Int) -> String {
    let price = formatter.string(from: NSNumber(value: value / 100))!
    let sign = value >= 0 ? "+" : "-"

    return "\(sign) \(price.replacingOccurrences(of: "-", with: ""))"
  }
}
