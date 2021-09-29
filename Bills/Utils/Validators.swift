//
//  Constants.swift
//  Bills
//
//  Created by Carlos Eduardo on 29/09/21.
//

import Foundation

class Validators {
  static let EMAIL_REGEX = try! NSRegularExpression(pattern: #"^\S+@\S+\.\S+$"#, options: [])

  private static func validateRegex(regex: NSRegularExpression, value: String) -> Bool {
    let range = NSRange(value.startIndex ..< value.endIndex, in: value)
    let match = regex.firstMatch(in: value, options: [], range: range)

    if match != nil { return true }
    return false
  }

  static func email(value: String) -> Bool {
    if value.isEmpty { return false }
    if !validateRegex(regex: EMAIL_REGEX, value: value) { return false }

    return true
  }

  static func password(value: String) -> Bool {
    if value.isEmpty { return false }
    if value.count < 6 { return false }

    return true
  }
}
