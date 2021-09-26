// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public struct AuthenticationLoginInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - email
  ///   - password
  public init(email: String, password: String) {
    graphQLMap = ["email": email, "password": password]
  }

  public var email: String {
    get {
      return graphQLMap["email"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "email")
    }
  }

  public var password: String {
    get {
      return graphQLMap["password"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "password")
    }
  }
}

public enum BillType: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case bankInvoice
  case bankSlip
  case investment
  case salary
  case tax
  case transfer
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "BANK_INVOICE": self = .bankInvoice
      case "BANK_SLIP": self = .bankSlip
      case "INVESTMENT": self = .investment
      case "SALARY": self = .salary
      case "TAX": self = .tax
      case "TRANSFER": self = .transfer
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .bankInvoice: return "BANK_INVOICE"
      case .bankSlip: return "BANK_SLIP"
      case .investment: return "INVESTMENT"
      case .salary: return "SALARY"
      case .tax: return "TAX"
      case .transfer: return "TRANSFER"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: BillType, rhs: BillType) -> Bool {
    switch (lhs, rhs) {
      case (.bankInvoice, .bankInvoice): return true
      case (.bankSlip, .bankSlip): return true
      case (.investment, .investment): return true
      case (.salary, .salary): return true
      case (.tax, .tax): return true
      case (.transfer, .transfer): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [BillType] {
    return [
      .bankInvoice,
      .bankSlip,
      .investment,
      .salary,
      .tax,
      .transfer,
    ]
  }
}

public struct BillInsertInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - name
  ///   - type
  ///   - value
  public init(name: String, type: BillType, value: Double) {
    graphQLMap = ["name": name, "type": type, "value": value]
  }

  public var name: String {
    get {
      return graphQLMap["name"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "name")
    }
  }

  public var type: BillType {
    get {
      return graphQLMap["type"] as! BillType
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "type")
    }
  }

  public var value: Double {
    get {
      return graphQLMap["value"] as! Double
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "value")
    }
  }
}

public final class LoginMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation Login($input: AuthenticationLoginInput!) {
      login(input: $input) {
        __typename
        id
        firstName
        lastName
        email
      }
    }
    """

  public let operationName: String = "Login"

  public var input: AuthenticationLoginInput

  public init(input: AuthenticationLoginInput) {
    self.input = input
  }

  public var variables: GraphQLMap? {
    return ["input": input]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("login", arguments: ["input": GraphQLVariable("input")], type: .nonNull(.object(Login.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(login: Login) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "login": login.resultMap])
    }

    public var login: Login {
      get {
        return Login(unsafeResultMap: resultMap["login"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "login")
      }
    }

    public struct Login: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["User"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("firstName", type: .nonNull(.scalar(String.self))),
          GraphQLField("lastName", type: .nonNull(.scalar(String.self))),
          GraphQLField("email", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, firstName: String, lastName: String, email: String) {
        self.init(unsafeResultMap: ["__typename": "User", "id": id, "firstName": firstName, "lastName": lastName, "email": email])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var firstName: String {
        get {
          return resultMap["firstName"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "firstName")
        }
      }

      public var lastName: String {
        get {
          return resultMap["lastName"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "lastName")
        }
      }

      public var email: String {
        get {
          return resultMap["email"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "email")
        }
      }
    }
  }
}

public final class GetBillsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetBills($after: String) {
      getBillsPerMonth(first: 10, after: $after) {
        __typename
        pageInfo {
          __typename
          endCursor
        }
        edges {
          __typename
          cursor
          node {
            __typename
            id
            name
            value
            type
            createdAt
          }
        }
      }
    }
    """

  public let operationName: String = "GetBills"

  public var after: String?

  public init(after: String? = nil) {
    self.after = after
  }

  public var variables: GraphQLMap? {
    return ["after": after]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("getBillsPerMonth", arguments: ["first": 10, "after": GraphQLVariable("after")], type: .nonNull(.object(GetBillsPerMonth.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(getBillsPerMonth: GetBillsPerMonth) {
      self.init(unsafeResultMap: ["__typename": "Query", "getBillsPerMonth": getBillsPerMonth.resultMap])
    }

    public var getBillsPerMonth: GetBillsPerMonth {
      get {
        return GetBillsPerMonth(unsafeResultMap: resultMap["getBillsPerMonth"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "getBillsPerMonth")
      }
    }

    public struct GetBillsPerMonth: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["BillConnection"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("pageInfo", type: .nonNull(.object(PageInfo.selections))),
          GraphQLField("edges", type: .nonNull(.list(.nonNull(.object(Edge.selections))))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(pageInfo: PageInfo, edges: [Edge]) {
        self.init(unsafeResultMap: ["__typename": "BillConnection", "pageInfo": pageInfo.resultMap, "edges": edges.map { (value: Edge) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var pageInfo: PageInfo {
        get {
          return PageInfo(unsafeResultMap: resultMap["pageInfo"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "pageInfo")
        }
      }

      public var edges: [Edge] {
        get {
          return (resultMap["edges"] as! [ResultMap]).map { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Edge) -> ResultMap in value.resultMap }, forKey: "edges")
        }
      }

      public struct PageInfo: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["PageInfo"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("endCursor", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(endCursor: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "PageInfo", "endCursor": endCursor])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var endCursor: String? {
          get {
            return resultMap["endCursor"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "endCursor")
          }
        }
      }

      public struct Edge: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["BillEdge"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("cursor", type: .nonNull(.scalar(String.self))),
            GraphQLField("node", type: .nonNull(.object(Node.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(cursor: String, node: Node) {
          self.init(unsafeResultMap: ["__typename": "BillEdge", "cursor": cursor, "node": node.resultMap])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var cursor: String {
          get {
            return resultMap["cursor"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "cursor")
          }
        }

        public var node: Node {
          get {
            return Node(unsafeResultMap: resultMap["node"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "node")
          }
        }

        public struct Node: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Bill"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("name", type: .nonNull(.scalar(String.self))),
              GraphQLField("value", type: .nonNull(.scalar(Int.self))),
              GraphQLField("type", type: .nonNull(.scalar(BillType.self))),
              GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, name: String, value: Int, type: BillType, createdAt: String) {
            self.init(unsafeResultMap: ["__typename": "Bill", "id": id, "name": name, "value": value, "type": type, "createdAt": createdAt])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return resultMap["id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var name: String {
            get {
              return resultMap["name"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          public var value: Int {
            get {
              return resultMap["value"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "value")
            }
          }

          public var type: BillType {
            get {
              return resultMap["type"]! as! BillType
            }
            set {
              resultMap.updateValue(newValue, forKey: "type")
            }
          }

          public var createdAt: String {
            get {
              return resultMap["createdAt"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "createdAt")
            }
          }
        }
      }
    }
  }
}

public final class SaveBillMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation SaveBill($input: BillInsertInput!) {
      saveBill(input: $input) {
        __typename
        id
        name
        value
        type
      }
    }
    """

  public let operationName: String = "SaveBill"

  public var input: BillInsertInput

  public init(input: BillInsertInput) {
    self.input = input
  }

  public var variables: GraphQLMap? {
    return ["input": input]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("saveBill", arguments: ["input": GraphQLVariable("input")], type: .nonNull(.object(SaveBill.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(saveBill: SaveBill) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "saveBill": saveBill.resultMap])
    }

    public var saveBill: SaveBill {
      get {
        return SaveBill(unsafeResultMap: resultMap["saveBill"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "saveBill")
      }
    }

    public struct SaveBill: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Bill"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("value", type: .nonNull(.scalar(Int.self))),
          GraphQLField("type", type: .nonNull(.scalar(BillType.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, name: String, value: Int, type: BillType) {
        self.init(unsafeResultMap: ["__typename": "Bill", "id": id, "name": name, "value": value, "type": type])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      public var value: Int {
        get {
          return resultMap["value"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "value")
        }
      }

      public var type: BillType {
        get {
          return resultMap["type"]! as! BillType
        }
        set {
          resultMap.updateValue(newValue, forKey: "type")
        }
      }
    }
  }
}

public final class ProfileQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Profile {
      profile {
        __typename
        id
        fullName
        firstName
        lastName
        email
      }
    }
    """

  public let operationName: String = "Profile"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("profile", type: .nonNull(.object(Profile.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(profile: Profile) {
      self.init(unsafeResultMap: ["__typename": "Query", "profile": profile.resultMap])
    }

    public var profile: Profile {
      get {
        return Profile(unsafeResultMap: resultMap["profile"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "profile")
      }
    }

    public struct Profile: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["User"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("fullName", type: .nonNull(.scalar(String.self))),
          GraphQLField("firstName", type: .nonNull(.scalar(String.self))),
          GraphQLField("lastName", type: .nonNull(.scalar(String.self))),
          GraphQLField("email", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, fullName: String, firstName: String, lastName: String, email: String) {
        self.init(unsafeResultMap: ["__typename": "User", "id": id, "fullName": fullName, "firstName": firstName, "lastName": lastName, "email": email])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var fullName: String {
        get {
          return resultMap["fullName"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "fullName")
        }
      }

      public var firstName: String {
        get {
          return resultMap["firstName"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "firstName")
        }
      }

      public var lastName: String {
        get {
          return resultMap["lastName"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "lastName")
        }
      }

      public var email: String {
        get {
          return resultMap["email"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "email")
        }
      }
    }
  }
}
