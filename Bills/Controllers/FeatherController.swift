//
//  FeatherController.swift
//  Bills
//
//  Created by Carlos Eduardo on 27/09/21.
//

import Foundation

class FeatherController: ObservableObject {
  private var glyphs: [String: Int] = [:]

  init() {
    if let filePath = Bundle.main.path(forResource: "Glyphs", ofType: "json") {
      do {
        let data = try Data(contentsOf: URL(fileURLWithPath: filePath), options: .mappedIfSafe)
        let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
        if let jsonResult = jsonResult as? [String: Int] {
          print(jsonResult)
          glyphs = jsonResult
        }
      } catch {
        print(error)
      }
    }
  }

  func fromName(name: String) -> String {
    let value = glyphs[name]
    if value == nil { return "?" }

    return String(UnicodeScalar(value!) ?? "?")
  }
}
