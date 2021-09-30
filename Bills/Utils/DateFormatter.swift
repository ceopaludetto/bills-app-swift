//
//  Date.swift
//  Bills
//
//  Created by Carlos Eduardo on 25/09/21.
//

import Foundation

class DateFormatterUtil {
  private static let formatter = RelativeDateTimeFormatter()
  private static let parser: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
    return dateFormatter
  }()

  static func display(value: String) -> String {
    let date = DateFormatterUtil.parser.date(from: value)
    return DateFormatterUtil.formatter.localizedString(for: date!, relativeTo: Date())
  }
}
