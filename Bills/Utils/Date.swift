//
//  Date.swift
//  Bills
//
//  Created by Carlos Eduardo on 25/09/21.
//

import Foundation

class DateUtil {
  static let current = DateUtil()
  private let formatter = RelativeDateTimeFormatter()
  private let parser = DateFormatter()

  init () {
    parser.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
  }
  
  func format(value: String) -> String {
    let date = parser.date(from: value)
    return formatter.localizedString(for: date!, relativeTo: Date())
  }
}
