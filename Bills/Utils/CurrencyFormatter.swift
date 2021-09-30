//
//  Currency.swift
//  Bills
//
//  Created by Carlos Eduardo on 25/09/21.
//

import Foundation

class CurrencyFormatterUtil {
  private static let formatter: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.locale = Locale.current
    formatter.numberStyle = .currency
    return formatter
  }()

  static func display(value: Int) -> String {
    let price = CurrencyFormatterUtil.formatter.string(from: NSNumber(value: value / 100))!
    let sign = value >= 0 ? "+" : "-"

    return "\(sign) \(price.replacingOccurrences(of: "-", with: ""))"
  }
}
